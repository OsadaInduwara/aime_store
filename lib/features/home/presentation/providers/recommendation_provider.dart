// lib/features/home/presentation/providers/recommendation_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/recommendation_service.dart';
import '../../../../core/data/models/user_behavior_model.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/services/product_service.dart';
import '../../../../core/presentation/providers/auth_provider.dart';

// Recommendation service provider
final recommendationServiceProvider = Provider<RecommendationService>((ref) {
  return RecommendationService();
});

// Personalized recommendations provider
final personalizedRecommendationsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final recommendationService = ref.read(recommendationServiceProvider);
  final authState = ref.watch(authProvider);

  final user = authState.value;
  if (user == null) {
    // Return fallback recommendations for anonymous users
    final scores = await recommendationService.getFallbackRecommendations(limit: 10);
    return await _getProductsFromScores(scores, ref);
  }

  try {
    final scores = await recommendationService.getPersonalizedRecommendations(
      userId: user.id,
      limit: 10,
    );

    // If personalized recommendations are empty or insufficient, use fallback
    if (scores.isEmpty || scores.length < 5) {
      final fallbackScores = await recommendationService.getFallbackRecommendations(
        limit: 10 - scores.length,
      );

      // Combine personalized and fallback recommendations
      scores.addAll(fallbackScores);
    }

    return await _getProductsFromScores(scores, ref);
  } catch (e) {
    // On error, fall back to fallback recommendations
    final fallbackScores = await recommendationService.getFallbackRecommendations(limit: 10);
    return await _getProductsFromScores(fallbackScores, ref);
  }
});

// Trending recommendations provider
final trendingRecommendationsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final recommendationService = ref.read(recommendationServiceProvider);
  final authState = ref.watch(authProvider);

  final user = authState.value;
  try {
    final scores = await recommendationService.getTrendingRecommendations(
      userId: user?.id,
      limit: 8,
    );

    // If trending recommendations are insufficient, supplement with fallback
    if (scores.length < 4) {
      final fallbackScores = await recommendationService.getFallbackRecommendations(
        limit: 8 - scores.length,
      );
      scores.addAll(fallbackScores);
    }

    return await _getProductsFromScores(scores, ref);
  } catch (e) {
    // On error, use fallback recommendations
    final fallbackScores = await recommendationService.getFallbackRecommendations(limit: 8);
    return await _getProductsFromScores(fallbackScores, ref);
  }
});

// Product-based recommendations provider (for product detail page)
final productBasedRecommendationsProvider = FutureProvider.family<List<ProductModel>, String>((ref, productId) async {
  final recommendationService = ref.read(recommendationServiceProvider);
  final authState = ref.watch(authProvider);

  final user = authState.value;
  final scores = await recommendationService.getProductBasedRecommendations(
    productId: productId,
    userId: user?.id,
    limit: 6,
  );

  return await _getProductsFromScores(scores, ref);
});

// Category-based recommendations provider
final categoryRecommendationsProvider = FutureProvider.family<List<ProductModel>, String>((ref, categoryId) async {
  final recommendationService = ref.read(recommendationServiceProvider);
  final authState = ref.watch(authProvider);

  final user = authState.value;
  final scores = await recommendationService.getCategoryRecommendations(
    categoryId: categoryId,
    userId: user?.id,
    limit: 8,
  );

  return await _getProductsFromScores(scores, ref);
});

// Recently viewed products provider
final recentlyViewedProvider = FutureProvider<List<ProductModel>>((ref) async {
  final authState = ref.watch(authProvider);
  final user = authState.value;

  if (user == null) return [];

  // Get user preferences to find recently viewed products
  final recommendationService = ref.read(recommendationServiceProvider);
  try {
    // This is a simplified version - in real implementation, you'd have a dedicated method
    final personalizedScores = await recommendationService.getPersonalizedRecommendations(
      userId: user.id,
      limit: 5,
    );

    // Filter for recently viewed type or implement a dedicated method
    final recentlyViewedScores = personalizedScores
        .where((score) => score.type == RecommendationType.recentlyViewed)
        .take(5)
        .toList();

    return await _getProductsFromScores(recentlyViewedScores, ref);
  } catch (e) {
    return [];
  }
});

// User behavior tracking provider
final userBehaviorTrackerProvider = Provider<UserBehaviorTracker>((ref) {
  return UserBehaviorTracker(ref.read(recommendationServiceProvider));
});

// Helper class for tracking user behavior
class UserBehaviorTracker {
  final RecommendationService _recommendationService;

  UserBehaviorTracker(this._recommendationService);

  /// Track product view
  Future<void> trackProductView(String productId, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.view,
      targetId: productId,
      targetType: 'product',
      metadata: metadata,
    );
  }

  /// Track product click
  Future<void> trackProductClick(String productId, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.click,
      targetId: productId,
      targetType: 'product',
      metadata: metadata,
    );
  }

  /// Track add to cart
  Future<void> trackAddToCart(String productId, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.addToCart,
      targetId: productId,
      targetType: 'product',
      metadata: metadata,
    );
  }

  /// Track purchase
  Future<void> trackPurchase(String productId, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.purchase,
      targetId: productId,
      targetType: 'product',
      metadata: metadata,
    );
  }

  /// Track search
  Future<void> trackSearch(String query, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.search,
      targetId: query,
      targetType: 'search',
      metadata: {...?metadata, 'query': query},
    );
  }

  /// Track category browse
  Future<void> trackCategoryBrowse(String categoryId, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.categoryBrowse,
      targetId: categoryId,
      targetType: 'category',
      metadata: metadata,
    );
  }

  /// Track store visit
  Future<void> trackStoreVisit(String storeId, {Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.storeVisit,
      targetId: storeId,
      targetType: 'store',
      metadata: metadata,
    );
  }

  /// Track app open
  Future<void> trackAppOpen({Map<String, dynamic>? metadata}) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.appOpen,
      targetId: 'app',
      targetType: 'app',
      metadata: metadata,
    );
  }
}

// Helper function to convert recommendation scores to products
Future<List<ProductModel>> _getProductsFromScores(
  List<RecommendationScore> scores,
  Ref ref,
) async {
  final productService = ref.read(productServiceProvider);
  final products = <ProductModel>[];

  for (final score in scores) {
    try {
      final product = await productService.getProductById(score.productId);
      if (product != null) {
        products.add(product);
      }
    } catch (e) {
      // Skip products that can't be fetched
      continue;
    }
  }

  return products;
}

// Provider for recommendation analytics
final recommendationAnalyticsProvider = Provider<RecommendationAnalytics>((ref) {
  return RecommendationAnalytics(ref.read(recommendationServiceProvider));
});

class RecommendationAnalytics {
  final RecommendationService _recommendationService;

  RecommendationAnalytics(this._recommendationService);

  /// Track when user clicks on a recommendation
  Future<void> trackRecommendationClick({
    required String productId,
    required RecommendationType recommendationType,
    required String section, // 'home_personalized', 'home_trending', etc.
    int? position, // Position in the recommendation list
  }) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.click,
      targetId: productId,
      targetType: 'recommendation',
      metadata: {
        'recommendation_type': recommendationType.name,
        'section': section,
        'position': position,
        'source': 'recommendation_engine',
      },
    );
  }

  /// Track when user converts from a recommendation
  Future<void> trackRecommendationConversion({
    required String productId,
    required RecommendationType recommendationType,
    required String section,
    int? position,
  }) async {
    await _recommendationService.trackUserBehavior(
      action: UserAction.purchase,
      targetId: productId,
      targetType: 'recommendation',
      metadata: {
        'recommendation_type': recommendationType.name,
        'section': section,
        'position': position,
        'source': 'recommendation_engine',
        'conversion': true,
      },
    );
  }
}

// Recommendation section configuration
enum RecommendationSectionType {
  personalizedHome('home_personalized', 'Just for You'),
  trendingHome('home_trending', 'Trending Now'),
  categoryBased('category_based', 'More in Category'),
  productBased('product_based', 'You Might Also Like'),
  recentlyViewed('recently_viewed', 'Recently Viewed');

  const RecommendationSectionType(this.id, this.title);

  final String id;
  final String title;
}
