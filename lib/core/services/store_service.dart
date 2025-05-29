// lib/core/services/store_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/store_model.dart';

class StoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<StoreModel>> getFeaturedStores({int limit = 10}) async {
    try {
      final querySnapshot = await _firestore
          .collection('stores')
          .where('settings.isActive', isEqualTo: true)
          .where('stats.isVerified', isEqualTo: true)
          .orderBy('stats.rating', descending: true)
          .limit(limit)
          .get();

      return querySnapshot.docs
          .map((doc) => StoreModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load featured stores: $e');
    }
  }

  Future<List<StoreModel>> getAllStores({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      Query query = _firestore
          .collection('stores')
          .where('settings.isActive', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => StoreModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load stores: $e');
    }
  }

  Future<StoreModel?> getStoreById(String storeId) async {
    try {
      final doc = await _firestore.collection('stores').doc(storeId).get();

      if (doc.exists) {
        return StoreModel.fromJson({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get store: $e');
    }
  }

  Future<List<StoreModel>> searchStores(String query) async {
    try {
      final querySnapshot = await _firestore
          .collection('stores')
          .where('settings.isActive', isEqualTo: true)
          .where('storeName', isGreaterThanOrEqualTo: query)
          .where('storeName', isLessThan: query + '\uf8ff')
          .get();

      return querySnapshot.docs
          .map((doc) => StoreModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to search stores: $e');
    }
  }
}