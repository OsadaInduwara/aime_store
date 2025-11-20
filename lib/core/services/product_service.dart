// lib/core/services/product_service.dart
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../data/models/product_model.dart';
import '../constants/app_constants.dart';
import '../exceptions/app_exceptions.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Uuid _uuid = const Uuid();

  Future<List<ProductModel>> getFeaturedProducts({
    int page = 1,
    int limit = AppConstants.defaultPageSize,
  }) async {
    try {
      Query query = _firestore
          .collection('products')
          .where('settings.isActive', isEqualTo: true)
          .where('settings.isFeatured', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (page > 1) {
        // For pagination, you'd need to implement proper cursor-based pagination
        query = query.startAfter([(page - 1) * limit]);
      }

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load featured products: $e');
    }
  }

  Future<List<ProductModel>> getProductsByCategory(
      String categoryId, {
        int page = 1,
        int limit = AppConstants.defaultPageSize,
      }) async {
    try {
      Query query = _firestore
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .where('settings.isActive', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products by category: $e');
    }
  }

  Future<List<ProductModel>> getProductsByStore(
      String storeId, {
        int page = 1,
        int limit = AppConstants.defaultPageSize,
      }) async {
    try {
      Query query = _firestore
          .collection('products')
          .where('storeId', isEqualTo: storeId)
          .where('settings.isActive', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products by store: $e');
    }
  }

  Future<List<ProductModel>> searchProducts(
      String query, {
        int page = 1,
        int limit = AppConstants.defaultPageSize,
      }) async {
    try {
      // Simple text search - in production, you'd use Algolia or similar
      final querySnapshot = await _firestore
          .collection('products')
          .where('settings.isActive', isEqualTo: true)
          .where('searchKeywords', arrayContains: query.toLowerCase())
          .limit(limit)
          .get();

      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
  }

  Future<ProductModel?> getProductById(String productId) async {
    try {
      final doc = await _firestore.collection('products').doc(productId).get();

      if (doc.exists) {
        return ProductModel.fromJson({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get product: $e');
    }
  }

  Future<void> incrementViewCount(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).update({
        'stats.viewCount': FieldValue.increment(1),
      });
    } catch (e) {
      // Silently fail for view count updates
    }
  }

  // Product Creation and Management Methods

  /// Create a new product
  Future<String> createProduct(ProductModel product) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to create products');
      }

      // Generate product ID
      final productId = _uuid.v4();

      // Get user's store ID (assuming stored in user document)
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      final storeId = userData?['storeId'] as String?;

      if (storeId == null) {
        throw DataException('User must have a store to create products');
      }

      // Create product with generated ID and store ID
      final productData = product.copyWith(
        id: productId,
        storeId: storeId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to Firestore
      await _firestore
          .collection('products')
          .doc(productId)
          .set(productData.toJson());

      return productId;
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to create product: $e');
    }
  }

  /// Upload product image to Firebase Storage
  Future<String> uploadProductImage(File imageFile) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to upload images');
      }

      // Generate unique filename
      final imageId = _uuid.v4();
      final extension = imageFile.path.split('.').last.toLowerCase();
      final fileName = 'product_${imageId}.$extension';

      // Upload to Firebase Storage
      final ref = _storage
          .ref()
          .child('products')
          .child(user.uid)
          .child('images')
          .child(fileName);

      final uploadTask = ref.putFile(imageFile);

      // Monitor upload progress (optional)
      uploadTask.snapshotEvents.listen((snapshot) {
        final progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        print('Image upload progress: ${progress.toStringAsFixed(2)}%');
      });

      // Wait for upload to complete
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      if (e is FirebaseException) {
        throw DataException('Failed to upload image: ${e.message}');
      }
      throw DataException('Failed to upload image: $e');
    }
  }

  /// Upload product video to Firebase Storage
  Future<String> uploadProductVideo(File videoFile) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to upload videos');
      }

      // Validate video file size (10MB limit)
      final fileSize = await videoFile.length();
      const maxSize = 10 * 1024 * 1024; // 10MB in bytes

      if (fileSize > maxSize) {
        throw ValidationException(
          'Video file is too large. Maximum size is 10MB. Current size: ${(fileSize / (1024 * 1024)).toStringAsFixed(1)}MB',
        );
      }

      // Generate unique filename
      final videoId = _uuid.v4();
      final extension = videoFile.path.split('.').last.toLowerCase();
      final fileName = 'product_${videoId}.$extension';

      // Upload to Firebase Storage
      final ref = _storage
          .ref()
          .child('products')
          .child(user.uid)
          .child('videos')
          .child(fileName);

      final uploadTask = ref.putFile(videoFile);

      // Monitor upload progress
      uploadTask.snapshotEvents.listen((snapshot) {
        final progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        print('Video upload progress: ${progress.toStringAsFixed(2)}%');
      });

      // Wait for upload to complete
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      if (e is AppException) rethrow;
      if (e is FirebaseException) {
        throw DataException('Failed to upload video: ${e.message}');
      }
      throw DataException('Failed to upload video: $e');
    }
  }

  /// Update an existing product
  Future<void> updateProduct(ProductModel product) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to update products');
      }

      // Verify product exists and belongs to user's store
      final existingProduct = await getProductById(product.id);
      if (existingProduct == null) {
        throw DataException('Product not found');
      }

      // Get user's store ID
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      final storeId = userData?['storeId'] as String?;

      if (storeId == null || existingProduct.storeId != storeId) {
        throw PermissionException('You can only update products from your own store');
      }

      // Update product with new timestamp
      final updatedProduct = product.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection('products')
          .doc(product.id)
          .update(updatedProduct.toJson());
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to update product: $e');
    }
  }

  /// Delete a product
  Future<void> deleteProduct(String productId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to delete products');
      }

      // Verify product exists and belongs to user's store
      final existingProduct = await getProductById(productId);
      if (existingProduct == null) {
        throw DataException('Product not found');
      }

      // Get user's store ID
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      final storeId = userData?['storeId'] as String?;

      if (storeId == null || existingProduct.storeId != storeId) {
        throw PermissionException('You can only delete products from your own store');
      }

      // Delete product document
      await _firestore.collection('products').doc(productId).delete();

      // Optionally: Delete associated media files from Storage
      // This would require tracking file references in the product document
      _deleteProductMedia(existingProduct);
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to delete product: $e');
    }
  }

  /// Get products for vendor/store owner
  Future<List<ProductModel>> getVendorProducts({
    int page = 1,
    int limit = AppConstants.defaultPageSize,
    bool? isActive,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to view products');
      }

      // Get user's store ID
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      final storeId = userData?['storeId'] as String?;

      if (storeId == null) {
        throw DataException('User must have a store to view products');
      }

      Query query = _firestore
          .collection('products')
          .where('storeId', isEqualTo: storeId)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      // Filter by active status if specified
      if (isActive != null) {
        query = query.where('settings.isActive', isEqualTo: isActive);
      }

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              }))
          .toList();
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to load vendor products: $e');
    }
  }

  /// Delete associated media files from Storage
  Future<void> _deleteProductMedia(ProductModel product) async {
    try {
      // Delete images
      for (final imageUrl in product.images) {
        try {
          final ref = _storage.refFromURL(imageUrl);
          await ref.delete();
        } catch (e) {
          // Continue deleting other files even if one fails
          print('Failed to delete image: $imageUrl, Error: $e');
        }
      }

      // Delete videos
      for (final videoUrl in product.videos) {
        try {
          final ref = _storage.refFromURL(videoUrl);
          await ref.delete();
        } catch (e) {
          // Continue deleting other files even if one fails
          print('Failed to delete video: $videoUrl, Error: $e');
        }
      }
    } catch (e) {
      // Don't throw error for media cleanup failures
      print('Media cleanup error: $e');
    }
  }

  /// Toggle product active status
  Future<void> toggleProductStatus(String productId, bool isActive) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw AuthException('User must be authenticated to update products');
      }

      // Verify product belongs to user's store
      final existingProduct = await getProductById(productId);
      if (existingProduct == null) {
        throw DataException('Product not found');
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      final storeId = userData?['storeId'] as String?;

      if (storeId == null || existingProduct.storeId != storeId) {
        throw PermissionException('You can only update products from your own store');
      }

      await _firestore.collection('products').doc(productId).update({
        'settings.isActive': isActive,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      if (e is AppException) rethrow;
      throw DataException('Failed to toggle product status: $e');
    }
  }
}
