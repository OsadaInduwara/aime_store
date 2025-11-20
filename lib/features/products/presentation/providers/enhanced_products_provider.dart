// lib/features/products/presentation/providers/enhanced_products_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/services/product_service.dart';
import '../../../../core/utils/async_helper.dart';
import '../../../../core/presentation/providers/global_loading_provider.dart';
import '../../../../core/presentation/providers/global_error_provider.dart';
import '../../../../core/exceptions/app_exceptions.dart';

part 'enhanced_products_provider.g.dart';

/// Enhanced products provider with proper async handling
@riverpod
class EnhancedProducts extends _$EnhancedProducts {
  @override
  Future<List<ProductModel>> build() async {
    return await _loadProducts();
  }

  /// Load products with error handling
  Future<List<ProductModel>> _loadProducts() async {
    final result = await AsyncHelper.execute<List<ProductModel>>(
      operation: () => ref.read(productServiceProvider).getFeaturedProducts(),
      ref: ref,
      loadingMessage: 'Loading products...',
      errorContext: 'loading products',
      showLoading: false, // Products have their own loading state
      canRetry: true,
      retryAction: 'retry_load_products',
    );

    return result ?? [];
  }

  /// Refresh products
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadProducts());
  }

  /// Load products by category
  Future<List<ProductModel>> loadProductsByCategory(String categoryId) async {
    final result = await AsyncHelper.execute<List<ProductModel>>(
      operation: () => ref.read(productServiceProvider).getProductsByCategory(categoryId),
      ref: ref,
      loadingMessage: 'Loading category products...',
      errorContext: 'loading products by category',
      canRetry: true,
      retryAction: 'retry_load_category_products',
    );

    return result ?? [];
  }

  /// Search products
  Future<List<ProductModel>> searchProducts(String query) async {
    if (query.trim().isEmpty) {
      ref.read(globalErrorProvider.notifier).showValidationError(
            'Please enter a search term',
          );
      return [];
    }

    final result = await AsyncHelper.execute<List<ProductModel>>(
      operation: () => ref.read(productServiceProvider).searchProducts(query),
      ref: ref,
      loadingMessage: 'Searching products...',
      errorContext: 'searching products',
      canRetry: true,
      retryAction: 'retry_search',
    );

    return result ?? [];
  }
}

/// Provider for single product details
@riverpod
class EnhancedProductDetail extends _$EnhancedProductDetail {
  @override
  Future<ProductModel?> build(String productId) async {
    return await _loadProduct(productId);
  }

  Future<ProductModel?> _loadProduct(String productId) async {
    final result = await AsyncHelper.execute<ProductModel?>(
      operation: () => ref.read(productServiceProvider).getProductById(productId),
      ref: ref,
      loadingMessage: 'Loading product details...',
      errorContext: 'loading product details',
      showLoading: false, // Product detail has its own loading state
      canRetry: true,
      retryAction: 'retry_load_product',
    );

    return result;
  }

  /// Refresh product details
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadProduct(productId));
  }
}

/// Provider for featured products
@riverpod
class EnhancedFeaturedProducts extends _$EnhancedFeaturedProducts {
  @override
  Future<List<ProductModel>> build() async {
    return await _loadFeaturedProducts();
  }

  Future<List<ProductModel>> _loadFeaturedProducts() async {
    final result = await AsyncHelper.execute<List<ProductModel>>(
      operation: () => ref.read(productServiceProvider).getFeaturedProducts(),
      ref: ref,
      loadingMessage: 'Loading featured products...',
      errorContext: 'loading featured products',
      showLoading: false,
      canRetry: true,
      retryAction: 'retry_load_featured',
    );

    return result ?? [];
  }

  /// Refresh featured products
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadFeaturedProducts());
  }
}

/// Provider for trending products
@riverpod
class EnhancedTrendingProducts extends _$EnhancedTrendingProducts {
  @override
  Future<List<ProductModel>> build() async {
    return await _loadTrendingProducts();
  }

  Future<List<ProductModel>> _loadTrendingProducts() async {
    final result = await AsyncHelper.execute<List<ProductModel>>(
      operation: () => ref.read(productServiceProvider).getFeaturedProducts(),
      ref: ref,
      loadingMessage: 'Loading trending products...',
      errorContext: 'loading trending products',
      showLoading: false,
      canRetry: true,
      retryAction: 'retry_load_trending',
    );

    return result ?? [];
  }

  /// Refresh trending products
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadTrendingProducts());
  }
}

/// Provider for product recommendations
@riverpod
class EnhancedProductRecommendations extends _$EnhancedProductRecommendations {
  @override
  Future<List<ProductModel>> build(String? userId) async {
    if (userId == null) return [];
    return await _loadRecommendations(userId);
  }

  Future<List<ProductModel>> _loadRecommendations(String userId) async {
    final result = await AsyncHelper.execute<List<ProductModel>>(
      operation: () => ref.read(productServiceProvider).getFeaturedProducts(),
      ref: ref,
      loadingMessage: 'Finding products you might like...',
      errorContext: 'loading recommendations',
      showLoading: false,
      canRetry: true,
      retryAction: 'retry_load_recommendations',
    );

    return result ?? [];
  }

  /// Refresh recommendations
  Future<void> refresh() async {
    if (userId == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadRecommendations(userId!));
  }
}

/// Provider for product service
@riverpod
ProductService productService(ProductServiceRef ref) {
  return ProductService();
}