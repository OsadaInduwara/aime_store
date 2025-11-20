// lib/core/providers/store_products_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';
import '../../services/product_service.dart';

// Service Provider for store products
final storeProductServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

// Store Products Provider
final storeProductsProvider = StateNotifierProvider.family<StoreProductsNotifier, AsyncValue<List<ProductModel>>, String>((ref, storeId) {
  return StoreProductsNotifier(ref.read(storeProductServiceProvider), storeId);
});

class StoreProductsNotifier extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final ProductService _productService;
  final String _storeId;

  StoreProductsNotifier(this._productService, this._storeId) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = const AsyncValue.loading();

    try {
      final products = await _productService.getProductsByStore(_storeId);
      state = AsyncValue.data(products);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadProducts();
  }
}
