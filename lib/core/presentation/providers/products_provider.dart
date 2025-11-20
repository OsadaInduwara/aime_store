// lib/core/providers/products_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';
import '../../services/product_service.dart';

// Service Provider
final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

// Featured Products Provider
final featuredProductsProvider = StateNotifierProvider<FeaturedProductsNotifier, AsyncValue<List<ProductModel>>>((ref) {
  return FeaturedProductsNotifier(ref.read(productServiceProvider));
});

class FeaturedProductsNotifier extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final ProductService _productService;
  int _currentPage = 1;
  bool _hasMore = true;
  List<ProductModel> _products = [];

  FeaturedProductsNotifier(this._productService) : super(const AsyncValue.loading()) {
    _loadInitialProducts();
  }

  Future<void> _loadInitialProducts() async {
    try {
      final products = await _productService.getFeaturedProducts(page: 1);

      _products = products;
      _currentPage = 1;
      _hasMore = products.length >= 20; // Assuming 20 is page size

      state = AsyncValue.data(_products);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;

    try {
      final newProducts = await _productService.getFeaturedProducts(
        page: _currentPage + 1,
      );

      if (newProducts.isNotEmpty) {
        _products.addAll(newProducts);
        _currentPage++;
        _hasMore = newProducts.length >= 20;
        state = AsyncValue.data(_products);
      } else {
        _hasMore = false;
      }
    } catch (error, stackTrace) {
      // Don't update state on load more error, just log it
      print('Error loading more products: $error');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    _currentPage = 1;
    _hasMore = true;
    _products = [];
    await _loadInitialProducts();
  }
}

// Product Detail Provider
final productDetailProvider = FutureProvider.family<ProductModel?, String>((ref, productId) async {
  final productService = ref.read(productServiceProvider);
  final product = await productService.getProductById(productId);

  if (product != null) {
    // Increment view count
    await productService.incrementViewCount(productId);
  }

  return product;
});

// Search Products Provider
final searchProductsProvider = StateNotifierProvider<SearchProductsNotifier, AsyncValue<List<ProductModel>>>((ref) {
  return SearchProductsNotifier(ref.read(productServiceProvider));
});

class SearchProductsNotifier extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final ProductService _productService;

  SearchProductsNotifier(this._productService) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.trim().length < 2) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();

    try {
      final products = await _productService.searchProducts(query);
      state = AsyncValue.data(products);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearResults() {
    state = const AsyncValue.data([]);
  }
}
