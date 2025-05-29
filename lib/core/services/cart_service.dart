// lib/core/services/cart_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  Future<List<CartItem>> getCartItems() async {
    if (_userId == null) return [];

    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('cart')
          .orderBy('addedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => CartItem.fromJson({
        'id': doc.id,
        ...doc.data(),
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load cart items: $e');
    }
  }

  Future<void> addToCart({
    required String productId,
    String? variantId,
    int quantity = 1,
    Map<String, dynamic>? customizations,
    String? notes,
  }) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      // Get product details
      final productDoc = await _firestore.collection('products').doc(productId).get();
      if (!productDoc.exists) throw Exception('Product not found');

      final product = ProductModel.fromJson({
        'id': productDoc.id,
        ...productDoc.data()!,
      });

      // Calculate price
      double unitPrice = product.pricing.salePrice ?? product.pricing.basePrice;
      if (variantId != null) {
        final variant = product.variants.firstWhere((v) => v.id == variantId);
        if (variant.price != null) {
          unitPrice += variant.price!;
        }
      }

      final now = DateTime.now();
      final cartItem = CartItem(
        id: '', // Will be set by Firestore
        productId: productId,
        storeId: product.storeId,
        variantId: variantId,
        productName: product.name,
        productImage: product.thumbnailImage,
        variantName: variantId != null
            ? product.variants.firstWhere((v) => v.id == variantId).name
            : null,
        quantity: quantity,
        unitPrice: unitPrice,
        totalPrice: unitPrice * quantity,
        customizations: customizations,
        notes: notes,
        addedAt: now,
        updatedAt: now,
      );

      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('cart')
          .add(cartItem.toJson());
    } catch (e) {
      throw Exception('Failed to add to cart: $e');
    }
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final itemDoc = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('cart')
          .doc(itemId)
          .get();

      if (!itemDoc.exists) throw Exception('Cart item not found');

      final item = CartItem.fromJson({
        'id': itemDoc.id,
        ...itemDoc.data()!,
      });

      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('cart')
          .doc(itemId)
          .update({
        'quantity': quantity,
        'totalPrice': item.unitPrice * quantity,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      throw Exception('Failed to update quantity: $e');
    }
  }

  Future<void> removeFromCart(String itemId) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('cart')
          .doc(itemId)
          .delete();
    } catch (e) {
      throw Exception('Failed to remove from cart: $e');
    }
  }

  Future<void> clearCart() async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final batch = _firestore.batch();
      final cartItems = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('cart')
          .get();

      for (final doc in cartItems.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      throw Exception('Failed to clear cart: $e');
    }
  }
}