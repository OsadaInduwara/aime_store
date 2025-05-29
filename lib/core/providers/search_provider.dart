// lib/core/providers/search_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

// Service Provider (reuse from products_provider if needed)
final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

// Search Provider
final searchProvider = StateNotifierProvider<SearchNotifier, AsyncValue<List<ProductModel>>>((ref) {
  return SearchNotifier(ref.read(productServiceProvider));
});

class SearchNotifier extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final ProductService _productService;

  SearchNotifier(this._productService) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.trim().length < 2) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();

    try {
      final results = await _productService.searchProducts(query);
      state = AsyncValue.data(results);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearResults() {
    state = const AsyncValue.data([]);
  }
}