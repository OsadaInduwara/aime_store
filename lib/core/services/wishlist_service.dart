// lib/core/services/wishlist_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/product_model.dart';
import 'product_service.dart';

class WishlistService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  Future<List<ProductModel>> getWishlistItems() async {
    if (_userId == null) return [];

    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('wishlist')
          .orderBy('addedAt', descending: true)
          .get();

      final productIds = querySnapshot.docs.map((doc) => doc.id).toList();

      if (productIds.isEmpty) return [];

      // Fetch product details
      final products = <ProductModel>[];
      final productService = ProductService();

      for (final productId in productIds) {
        final product = await productService.getProductById(productId);
        if (product != null) {
          products.add(product);
        }
      }

      return products;
    } catch (e) {
      throw Exception('Failed to load wishlist: $e');
    }
  }

  Future<void> addToWishlist(String productId) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('wishlist')
          .doc(productId)
          .set({
        'addedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add to wishlist: $e');
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('wishlist')
          .doc(productId)
          .delete();
    } catch (e) {
      throw Exception('Failed to remove from wishlist: $e');
    }
  }

  Future<bool> isInWishlist(String productId) async {
    if (_userId == null) return false;

    try {
      final doc = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('wishlist')
          .doc(productId)
          .get();

      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}
