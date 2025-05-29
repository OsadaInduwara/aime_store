// lib/core/providers/wishlist_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product_model.dart';
import '../services/wishlist_service.dart';

part 'wishlist_provider.g.dart';

@riverpod
class Wishlist extends _$Wishlist {
  @override
  AsyncValue<List<ProductModel>> build() {
    _loadWishlist();
    return const AsyncValue.loading();
  }

  Future<void> _loadWishlist() async {
    try {
      final wishlistService = ref.read(wishlistServiceProvider);
      final items = await wishlistService.getWishlistItems();
      state = AsyncValue.data(items);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addItem(String productId) async {
    try {
      final wishlistService = ref.read(wishlistServiceProvider);
      await wishlistService.addToWishlist(productId);
      await _loadWishlist();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeItem(String productId) async {
    try {
      final wishlistService = ref.read(wishlistServiceProvider);
      await wishlistService.removeFromWishlist(productId);
      await _loadWishlist();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  bool isInWishlist(String productId) {
    final items = state.value ?? [];
    return items.any((item) => item.id == productId);
  }
}

/// Provides an instance of your WishlistService
@riverpod
WishlistService wishlistService(WishlistServiceRef ref) {
  return WishlistService();
}
