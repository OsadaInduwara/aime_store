// lib/core/providers/category_products_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';
import '../../services/product_service.dart';

// Service Provider for category products
final categoryProductServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

// Category Products Provider
final categoryProductsProvider = StateNotifierProvider.family<CategoryProductsNotifier, AsyncValue<List<ProductModel>>, String>((ref, categoryId) {
  return CategoryProductsNotifier(ref.read(categoryProductServiceProvider), categoryId);
});

class CategoryProductsNotifier extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final ProductService _productService;
  final String _categoryId;

  CategoryProductsNotifier(this._productService, this._categoryId) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = const AsyncValue.loading();

    try {
      final products = await _productService.getProductsByCategory(_categoryId);
      state = AsyncValue.data(products);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadProducts();
  }
}
