// lib/core/providers/cart_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/cart_model.dart';
import '../../services/cart_service.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  AsyncValue<List<CartItem>> build() {
    _loadCart();
    return const AsyncValue.loading();
  }

  Future<void> _loadCart() async {
    try {
      final cartService = ref.read(cartServiceProvider);
      final cartItems = await cartService.getCartItems();
      state = AsyncValue.data(cartItems);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addItem(String productId, {
    String? variantId,
    int quantity = 1,
    Map<String, dynamic>? customizations,
    String? notes,
  }) async {
    try {
      final cartService = ref.read(cartServiceProvider);
      await cartService.addToCart(
        productId: productId,
        variantId: variantId,
        quantity: quantity,
        customizations: customizations,
        notes: notes,
      );
      await _loadCart();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    try {
      final cartService = ref.read(cartServiceProvider);
      if (quantity <= 0) {
        await cartService.removeFromCart(itemId);
      } else {
        await cartService.updateQuantity(itemId, quantity);
      }
      await _loadCart();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeItem(String itemId) async {
    try {
      final cartService = ref.read(cartServiceProvider);
      await cartService.removeFromCart(itemId);
      await _loadCart();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> clearCart() async {
    try {
      final cartService = ref.read(cartServiceProvider);
      await cartService.clearCart();
      state = const AsyncValue.data([]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  int get itemCount {
    return state.value?.fold<int>(0, (sum, item) => sum + item.quantity) ?? 0;
  }

  double get totalAmount {
    return state.value?.fold<double>(0, (sum, item) => sum + item.totalPrice) ?? 0.0;
  }
}

@riverpod
CartService cartService(CartServiceRef ref) {
  return CartService();
}
