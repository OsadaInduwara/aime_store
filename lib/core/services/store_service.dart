// lib/core/services/store_service.dart
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../data/models/store_model.dart';
import '../data/models/user_model.dart';
import '../exceptions/app_exceptions.dart';

class StoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Uuid _uuid = const Uuid();

  /// Check if current user already has a store
  Future<bool> hasStore() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated');
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();

      if (userData == null) {
        throw DataException('User data not found');
      }

      // Check if user has storeId field and it's not empty
      final storeId = userData['storeId'] as String?;
      return storeId != null && storeId.isNotEmpty;
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to check store status: $e');
    }
  }

  /// Get user's store if they have one
  Future<StoreModel?> getUserStore() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated');
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();

      if (userData == null) {
        throw DataException('User data not found');
      }

      final storeId = userData['storeId'] as String?;
      if (storeId == null || storeId.isEmpty) {
        return null; // User doesn't have a store
      }

      final storeDoc = await _firestore.collection('stores').doc(storeId).get();
      if (!storeDoc.exists) {
        // Store reference exists but store document is missing - cleanup
        await _firestore.collection('users').doc(user.uid).update({
          'storeId': FieldValue.delete(),
          'userType': UserType.customer.name,
        });
        return null;
      }

      return StoreModel.fromJson({
        'id': storeDoc.id,
        ...storeDoc.data() as Map<String, dynamic>,
      });
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to get user store: $e');
    }
  }

  /// Create a new store for the current user
  Future<String> createStore(StoreModel store) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to create a store');
      }

      // First, check if user already has a store
      if (await hasStore()) {
        throw ValidationException('You can only create one store per account');
      }

      // Generate store ID
      final storeId = _uuid.v4();

      // Create store document
      final storeData = store.copyWith(
        id: storeId,
        ownerId: user.uid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Use a batch write to ensure atomicity
      final batch = _firestore.batch();

      // 1. Create the store document
      final storeRef = _firestore.collection('stores').doc(storeId);
      batch.set(storeRef, storeData.toJson());

      // 2. Update user document with storeId and change userType to vendor
      final userRef = _firestore.collection('users').doc(user.uid);
      batch.update(userRef, {
        'storeId': storeId,
        'userType': UserType.vendor.name,
        'updatedAt': Timestamp.now(),
      });

      // Commit the batch
      await batch.commit();

      return storeId;
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to create store: $e');
    }
  }

  /// Update an existing store
  Future<void> updateStore(StoreModel store) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to update store');
      }

      // Verify the store belongs to the current user
      final existingStore = await getUserStore();
      if (existingStore == null) {
        throw PermissionException('User does not have a store to update');
      }

      if (existingStore.ownerId != user.uid) {
        throw PermissionException('You can only update your own store');
      }

      // Update the store
      final updatedStore = store.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection('stores')
          .doc(store.id)
          .update(updatedStore.toJson());
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to update store: $e');
    }
  }

  /// Delete a store (and revert user back to customer)
  Future<void> deleteStore() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to delete store');
      }

      final store = await getUserStore();
      if (store == null) {
        throw DataException('No store found to delete');
      }

      if (store.ownerId != user.uid) {
        throw PermissionException('You can only delete your own store');
      }

      // Use a batch write for atomicity
      final batch = _firestore.batch();

      // 1. Delete the store document
      final storeRef = _firestore.collection('stores').doc(store.id);
      batch.delete(storeRef);

      // 2. Update user document to remove storeId and revert to customer
      final userRef = _firestore.collection('users').doc(user.uid);
      batch.update(userRef, {
        'storeId': FieldValue.delete(),
        'userType': UserType.customer.name,
        'updatedAt': Timestamp.now(),
      });

      // Commit the batch
      await batch.commit();

      // Optionally: Delete store media files
      await _deleteStoreMedia(store);
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to delete store: $e');
    }
  }

  /// Upload store logo
  Future<String> uploadStoreLogo(File logoFile) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to upload images');
      }

      // Check file size (max 5MB for logo)
      final fileSize = await logoFile.length();
      const maxSize = 5 * 1024 * 1024; // 5MB

      if (fileSize > maxSize) {
        throw ValidationException(
          'Logo file is too large. Maximum size is 5MB. Current size: ${(fileSize / (1024 * 1024)).toStringAsFixed(1)}MB',
        );
      }

      // Generate unique filename
      final logoId = _uuid.v4();
      final extension = logoFile.path.split('.').last.toLowerCase();
      final fileName = 'logo_${logoId}.$extension';

      // Upload to Firebase Storage
      final ref = _storage
          .ref()
          .child('stores')
          .child(user.uid)
          .child('logo')
          .child(fileName);

      final uploadTask = ref.putFile(logoFile);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      if (e is AppException) rethrow;
      if (e is FirebaseException) {
        throw DataException('Failed to upload logo: ${e.message}');
      }
      throw DataException('Failed to upload logo: $e');
    }
  }

  /// Upload store cover image
  Future<String> uploadStoreCoverImage(File coverFile) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to upload images');
      }

      // Check file size (max 10MB for cover image)
      final fileSize = await coverFile.length();
      const maxSize = 10 * 1024 * 1024; // 10MB

      if (fileSize > maxSize) {
        throw ValidationException(
          'Cover image file is too large. Maximum size is 10MB. Current size: ${(fileSize / (1024 * 1024)).toStringAsFixed(1)}MB',
        );
      }

      // Generate unique filename
      final coverId = _uuid.v4();
      final extension = coverFile.path.split('.').last.toLowerCase();
      final fileName = 'cover_${coverId}.$extension';

      // Upload to Firebase Storage
      final ref = _storage
          .ref()
          .child('stores')
          .child(user.uid)
          .child('cover')
          .child(fileName);

      final uploadTask = ref.putFile(coverFile);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      if (e is AppException) rethrow;
      if (e is FirebaseException) {
        throw DataException('Failed to upload cover image: ${e.message}');
      }
      throw DataException('Failed to upload cover image: $e');
    }
  }

  /// Delete store media files from Storage
  Future<void> _deleteStoreMedia(StoreModel store) async {
    try {
      // Delete logo
      if (store.logo?.isNotEmpty == true) {
        try {
          final logoRef = _storage.refFromURL(store.logo!);
          await logoRef.delete();
        } catch (e) {
          print('Failed to delete store logo: $e');
        }
      }

      // Delete cover image
      if (store.coverImage?.isNotEmpty == true) {
        try {
          final coverRef = _storage.refFromURL(store.coverImage!);
          await coverRef.delete();
        } catch (e) {
          print('Failed to delete store cover image: $e');
        }
      }
    } catch (e) {
      // Don't throw error for media cleanup failures
      print('Store media cleanup error: $e');
    }
  }

  /// Get store by ID
  Future<StoreModel?> getStoreById(String storeId) async {
    try {
      final doc = await _firestore.collection('stores').doc(storeId).get();

      if (!doc.exists) {
        return null;
      }

      return StoreModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      });
    } catch (e) {
      throw DataException('Failed to get store: $e');
    }
  }

  /// Get featured stores
  Future<List<StoreModel>> getFeaturedStores({int limit = 10}) async {
    try {
      final query = await _firestore
          .collection('stores')
          .where('settings.isActive', isEqualTo: true)
          .where('settings.isFeatured', isEqualTo: true)
          .orderBy('stats.rating', descending: true)
          .limit(limit)
          .get();

      return query.docs.map((doc) {
        return StoreModel.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      throw DataException('Failed to get featured stores: $e');
    }
  }

  /// Get all stores
  Future<List<StoreModel>> getAllStores({
    int limit = 20,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      var query = _firestore
          .collection('stores')
          .where('settings.isActive', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();

      return snapshot.docs.map((doc) {
        return StoreModel.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      throw DataException('Failed to get stores: $e');
    }
  }

  /// Search stores
  Future<List<StoreModel>> searchStores(String query, {int limit = 20}) async {
    try {
      // Simple text search - in production, use Algolia or similar
      final snapshot = await _firestore
          .collection('stores')
          .where('settings.isActive', isEqualTo: true)
          .orderBy('storeName')
          .startAt([query])
          .endAt([query + '\uf8ff'])
          .limit(limit)
          .get();

      return snapshot.docs.map((doc) {
        return StoreModel.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      throw DataException('Failed to search stores: $e');
    }
  }
}
