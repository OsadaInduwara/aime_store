// lib/core/services/product_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';
import '../utils/app_constants.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}