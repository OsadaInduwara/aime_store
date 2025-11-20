// lib/core/services/recommendation_service.dart
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/user_behavior_model.dart';
import '../data/models/product_model.dart';
import '../exceptions/app_exceptions.dart';

class RecommendationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Cache for performance
  final Map<String, List<RecommendationScore>> _recommendationCache = {};
  final Map<String, DateTime> _cacheExpiry = {};
  static const Duration _cacheValidDuration = Duration(minutes: 30);

  /// Track user behavior
  Future<void> trackUserBehavior({
    required UserAction action,
    required String targetId,
    required String targetType,
    Map<String, dynamic>? metadata,
    String? sessionId,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return; // Don't track anonymous users

      final behaviorData = UserBehaviorModel(
        id: _generateBehaviorId(),
        userId: user.uid,
        action: action,
        targetId: targetId,
        targetType: targetType,
        metadata: metadata,
        timestamp: DateTime.now(),
        sessionId: sessionId,
      );

      // Store behavior in Firestore
      await _firestore
          .collection('user_behaviors')
          .doc(behaviorData.id)
          .set(behaviorData.toJson());

      // Update user preferences asynchronously
      _updateUserPreferences(user.uid, behaviorData);

    } catch (e) {
      // Don't throw errors for tracking - it should be non-blocking
      print('Failed to track user behavior: $e');
    }
  }

  /// Get personalized recommendations for a user
  Future<List<RecommendationScore>> getPersonalizedRecommendations({
    required String userId,
    int limit = 10,
    RecommendationContext? context,
    bool useCache = true,
  }) async {
    try {
      // Check cache first
      final cacheKey = '$userId-$limit-${context?.currentCategoryId ?? 'general'}';
      if (useCache && _isCacheValid(cacheKey)) {
        return _recommendationCache[cacheKey]!;
      }

      List<RecommendationScore> recommendations = [];

      // 1. Get user preferences
      final userPrefs = await _getUserPreferences(userId);

      if (userPrefs != null && userPrefs.totalInteractions > 10) {
        // User has enough data for personalized recommendations
        recommendations.addAll(await _getCollaborativeRecommendations(userId, userPrefs, limit ~/ 4));
        recommendations.addAll(await _getCategoryBasedRecommendations(userId, userPrefs, limit ~/ 4));
        recommendations.addAll(await _getSimilarProductRecommendations(userId, userPrefs, limit ~/ 4));
        recommendations.addAll(await _getTrendingRecommendations(userId, limit ~/ 4));
      } else {
        // New user or insufficient data - use fallback strategies
        recommendations.addAll(await _getTrendingRecommendations(userId, limit ~/ 2));
        recommendations.addAll(await _getPopularInCategoryRecommendations(userId, context?.currentCategoryId, limit ~/ 2));
      }

      // Remove duplicates and sort by score
      recommendations = _removeDuplicatesAndSort(recommendations, limit);

      // Cache the results
      _recommendationCache[cacheKey] = recommendations;
      _cacheExpiry[cacheKey] = DateTime.now().add(_cacheValidDuration);

      return recommendations;
    } catch (e) {
      print('Error getting personalized recommendations: $e');
      // Return fallback recommendations
      return await _getFallbackRecommendations(userId, limit);
    }
  }

  /// Get recommendations based on currently viewed product
  Future<List<RecommendationScore>> getProductBasedRecommendations({
    required String productId,
    String? userId,
    int limit = 6,
  }) async {
    try {
      List<RecommendationScore> recommendations = [];

      // Get the current product
      final currentProduct = await _getProduct(productId);
      if (currentProduct == null) return [];

      // 1. Products in same category
      final categoryProducts = await _getProductsInCategory(
        currentProduct.categoryId,
        excludeProductId: productId,
        limit: limit ~/ 2,
      );

      for (final product in categoryProducts) {
        recommendations.add(RecommendationScore(
          productId: product.id,
          score: 0.7,
          type: RecommendationType.similar,
          reason: 'Similar category',
        ));
      }

      // 2. Products with similar tags
      if (currentProduct.tags.isNotEmpty) {
        final tagSimilarProducts = await _getProductsBySimilarTags(
          currentProduct.tags,
          excludeProductId: productId,
          limit: limit ~/ 2,
        );

        for (final product in tagSimilarProducts) {
          recommendations.add(RecommendationScore(
            productId: product.id,
            score: 0.6,
            type: RecommendationType.similar,
            reason: 'Similar tags',
          ));
        }
      }

      return _removeDuplicatesAndSort(recommendations, limit);
    } catch (e) {
      print('Error getting product-based recommendations: $e');
      return [];
    }
  }

  /// Get trending products
  Future<List<RecommendationScore>> getTrendingRecommendations({
    String? userId,
    int limit = 10,
  }) async {
    return await _getTrendingRecommendations(userId, limit);
  }

  /// Get recommendations for a specific category
  Future<List<RecommendationScore>> getCategoryRecommendations({
    required String categoryId,
    String? userId,
    int limit = 10,
  }) async {
    try {
      final products = await _getProductsInCategory(categoryId, limit: limit * 2);

      final recommendations = products.map((product) {
        // Calculate score based on product stats
        double score = _calculateProductScore(product);

        return RecommendationScore(
          productId: product.id,
          score: score,
          type: RecommendationType.categoryBased,
          reason: 'Popular in category',
        );
      }).toList();

      return _removeDuplicatesAndSort(recommendations, limit);
    } catch (e) {
      print('Error getting category recommendations: $e');
      return [];
    }
  }

  /// Update user preferences based on behavior
  Future<void> _updateUserPreferences(String userId, UserBehaviorModel behavior) async {
    try {
      final prefsRef = _firestore.collection('user_preferences').doc(userId);
      final prefsDoc = await prefsRef.get();

      UserPreferencesModel prefs;
      if (prefsDoc.exists) {
        prefs = UserPreferencesModel.fromJson(prefsDoc.data()!);
      } else {
        prefs = UserPreferencesModel(
          userId: userId,
          lastUpdated: DateTime.now(),
          totalInteractions: 0,
        );
      }

      // Update preferences based on action
      prefs = await _updatePreferencesForAction(prefs, behavior);

      // Save updated preferences
      await prefsRef.set(prefs.toJson());
    } catch (e) {
      print('Error updating user preferences: $e');
    }
  }

  /// Update preferences based on specific user action
  Future<UserPreferencesModel> _updatePreferencesForAction(
    UserPreferencesModel prefs,
    UserBehaviorModel behavior,
  ) async {
    Map<String, double> categoryPrefs = Map.from(prefs.categoryPreferences);
    List<String> viewedProducts = List.from(prefs.viewedProducts);
    List<String> searchHistory = List.from(prefs.searchHistory);
    int totalInteractions = prefs.totalInteractions + 1;

    switch (behavior.action) {
      case UserAction.view:
      case UserAction.click:
        // Get product and update category preference
        final product = await _getProduct(behavior.targetId);
        if (product != null) {
          double currentPref = categoryPrefs[product.categoryId] ?? 0.5;
          categoryPrefs[product.categoryId] = (currentPref + 0.1).clamp(0.0, 1.0);

          // Add to viewed products (keep last 50)
          viewedProducts.remove(behavior.targetId);
          viewedProducts.insert(0, behavior.targetId);
          if (viewedProducts.length > 50) {
            viewedProducts = viewedProducts.take(50).toList();
          }
        }
        break;

      case UserAction.purchase:
        // Strongly increase category preference for purchases
        final product = await _getProduct(behavior.targetId);
        if (product != null) {
          double currentPref = categoryPrefs[product.categoryId] ?? 0.5;
          categoryPrefs[product.categoryId] = (currentPref + 0.3).clamp(0.0, 1.0);
        }
        break;

      case UserAction.search:
        // Add to search history
        if (behavior.metadata?['query'] != null) {
          String query = behavior.metadata!['query'].toString().toLowerCase();
          searchHistory.remove(query);
          searchHistory.insert(0, query);
          if (searchHistory.length > 20) {
            searchHistory = searchHistory.take(20).toList();
          }
        }
        break;

      case UserAction.addToCart:
        // Increase category preference slightly
        final product = await _getProduct(behavior.targetId);
        if (product != null) {
          double currentPref = categoryPrefs[product.categoryId] ?? 0.5;
          categoryPrefs[product.categoryId] = (currentPref + 0.15).clamp(0.0, 1.0);
        }
        break;

      default:
        break;
    }

    return prefs.copyWith(
      categoryPreferences: categoryPrefs,
      viewedProducts: viewedProducts,
      searchHistory: searchHistory,
      totalInteractions: totalInteractions,
      lastUpdated: DateTime.now(),
    );
  }

  /// Get collaborative filtering recommendations
  Future<List<RecommendationScore>> _getCollaborativeRecommendations(
    String userId,
    UserPreferencesModel userPrefs,
    int limit,
  ) async {
    try {
      // Find users with similar preferences
      final similarUsers = await _findSimilarUsers(userId, userPrefs);
      List<RecommendationScore> recommendations = [];

      for (final similarUserId in similarUsers.take(5)) {
        final similarUserPrefs = await _getUserPreferences(similarUserId);
        if (similarUserPrefs != null) {
          // Get products this similar user liked but current user hasn't seen
          final unseenProducts = similarUserPrefs.viewedProducts
              .where((productId) => !userPrefs.viewedProducts.contains(productId))
              .take(limit ~/ 5);

          for (final productId in unseenProducts) {
            recommendations.add(RecommendationScore(
              productId: productId,
              score: 0.8,
              type: RecommendationType.collaborative,
              reason: 'Users like you also liked',
            ));
          }
        }
      }

      return recommendations;
    } catch (e) {
      print('Error getting collaborative recommendations: $e');
      return [];
    }
  }

  /// Get category-based recommendations
  Future<List<RecommendationScore>> _getCategoryBasedRecommendations(
    String userId,
    UserPreferencesModel userPrefs,
    int limit,
  ) async {
    try {
      List<RecommendationScore> recommendations = [];

      // Get user's top preferred categories
      final sortedCategories = userPrefs.categoryPreferences.entries
          .where((entry) => entry.value > 0.6)
          .toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      for (final categoryEntry in sortedCategories.take(3)) {
        final products = await _getProductsInCategory(
          categoryEntry.key,
          limit: limit ~/ 3,
        );

        for (final product in products) {
          // Skip if user already viewed this product
          if (userPrefs.viewedProducts.contains(product.id)) continue;

          recommendations.add(RecommendationScore(
            productId: product.id,
            score: categoryEntry.value * 0.9,
            type: RecommendationType.categoryBased,
            reason: 'Based on your interests in ${categoryEntry.key}',
          ));
        }
      }

      return recommendations;
    } catch (e) {
      print('Error getting category-based recommendations: $e');
      return [];
    }
  }

  /// Get recommendations based on similar products to recently viewed
  Future<List<RecommendationScore>> _getSimilarProductRecommendations(
    String userId,
    UserPreferencesModel userPrefs,
    int limit,
  ) async {
    try {
      List<RecommendationScore> recommendations = [];

      // Get user's recent viewed products
      final recentProducts = userPrefs.viewedProducts.take(5);

      for (final productId in recentProducts) {
        final similarProducts = await getProductBasedRecommendations(
          productId: productId,
          userId: userId,
          limit: limit ~/ 5,
        );

        recommendations.addAll(similarProducts);
      }

      return recommendations;
    } catch (e) {
      print('Error getting similar product recommendations: $e');
      return [];
    }
  }

  /// Get trending recommendations
  Future<List<RecommendationScore>> _getTrendingRecommendations(
    String? userId,
    int limit,
  ) async {
    try {
      final querySnapshot = await _firestore
          .collection('products')
          .where('settings.isActive', isEqualTo: true)
          .orderBy('stats.viewCount', descending: true)
          .limit(limit * 2)
          .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();

      return products.map((product) {
        double score = _calculateTrendingScore(product);

        return RecommendationScore(
          productId: product.id,
          score: score,
          type: RecommendationType.trending,
          reason: 'Trending now',
        );
      }).toList();
    } catch (e) {
      print('Error getting trending recommendations: $e');
      return [];
    }
  }

  /// Get popular products in category
  Future<List<RecommendationScore>> _getPopularInCategoryRecommendations(
    String? userId,
    String? categoryId,
    int limit,
  ) async {
    try {
      Query query = _firestore
          .collection('products')
          .where('settings.isActive', isEqualTo: true);

      if (categoryId != null) {
        query = query.where('categoryId', isEqualTo: categoryId);
      }

      final querySnapshot = await query
          .orderBy('stats.orderCount', descending: true)
          .limit(limit)
          .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();

      return products.map((product) {
        return RecommendationScore(
          productId: product.id,
          score: 0.7,
          type: RecommendationType.categoryBased,
          reason: categoryId != null ? 'Popular in category' : 'Popular products',
        );
      }).toList();
    } catch (e) {
      print('Error getting popular category recommendations: $e');
      return [];
    }
  }

  /// Get fallback recommendations for new users
  Future<List<RecommendationScore>> _getFallbackRecommendations(
    String? userId,
    int limit,
  ) async {
    try {
      final querySnapshot = await _firestore
          .collection('products')
          .where('settings.isActive', isEqualTo: true)
          .where('settings.isFeatured', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();

      return products.map((product) {
        return RecommendationScore(
          productId: product.id,
          score: 0.5,
          type: RecommendationType.fallback,
          reason: 'Featured products',
        );
      }).toList();
    } catch (e) {
      print('Error getting fallback recommendations: $e');
      return [];
    }
  }

  // Helper methods

  Future<UserPreferencesModel?> _getUserPreferences(String userId) async {
    try {
      final doc = await _firestore.collection('user_preferences').doc(userId).get();
      if (doc.exists) {
        return UserPreferencesModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<ProductModel?> _getProduct(String productId) async {
    try {
      final doc = await _firestore.collection('products').doc(productId).get();
      if (doc.exists) {
        return ProductModel.fromJson({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<ProductModel>> _getProductsInCategory(
    String categoryId, {
    String? excludeProductId,
    int limit = 10,
  }) async {
    try {
      Query query = _firestore
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .where('settings.isActive', isEqualTo: true)
          .orderBy('stats.rating', descending: true)
          .limit(limit + (excludeProductId != null ? 1 : 0));

      final querySnapshot = await query.get();

      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              }))
          .where((product) => product.id != excludeProductId)
          .take(limit)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<ProductModel>> _getProductsBySimilarTags(
    List<String> tags, {
    String? excludeProductId,
    int limit = 10,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection('products')
          .where('settings.isActive', isEqualTo: true)
          .where('tags', arrayContainsAny: tags)
          .limit(limit * 2)
          .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson({
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              }))
          .where((product) => product.id != excludeProductId)
          .toList();

      // Sort by number of matching tags
      products.sort((a, b) {
        final aMatches = a.tags.where((tag) => tags.contains(tag)).length;
        final bMatches = b.tags.where((tag) => tags.contains(tag)).length;
        return bMatches.compareTo(aMatches);
      });

      return products.take(limit).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<String>> _findSimilarUsers(
    String userId,
    UserPreferencesModel userPrefs,
  ) async {
    try {
      // This is a simplified version - in production, you'd want more sophisticated similarity calculation
      final querySnapshot = await _firestore
          .collection('user_preferences')
          .where('totalInteractions', isGreaterThan: 10)
          .limit(50)
          .get();

      final similarUsers = <String>[];

      for (final doc in querySnapshot.docs) {
        if (doc.id == userId) continue;

        final otherPrefs = UserPreferencesModel.fromJson(doc.data());
        final similarity = _calculateUserSimilarity(userPrefs, otherPrefs);

        if (similarity > 0.3) {
          similarUsers.add(doc.id);
        }
      }

      return similarUsers;
    } catch (e) {
      return [];
    }
  }

  double _calculateUserSimilarity(
    UserPreferencesModel user1,
    UserPreferencesModel user2,
  ) {
    // Calculate cosine similarity based on category preferences
    double dotProduct = 0.0;
    double norm1 = 0.0;
    double norm2 = 0.0;

    final allCategories = {
      ...user1.categoryPreferences.keys,
      ...user2.categoryPreferences.keys,
    };

    for (final category in allCategories) {
      final pref1 = user1.categoryPreferences[category] ?? 0.0;
      final pref2 = user2.categoryPreferences[category] ?? 0.0;

      dotProduct += pref1 * pref2;
      norm1 += pref1 * pref1;
      norm2 += pref2 * pref2;
    }

    if (norm1 == 0.0 || norm2 == 0.0) return 0.0;

    return dotProduct / (sqrt(norm1) * sqrt(norm2));
  }

  double _calculateProductScore(ProductModel product) {
    // Calculate score based on various factors
    double score = 0.5; // Base score

    // Rating factor (0.3 weight)
    score += (product.stats.rating / 5.0) * 0.3;

    // View count factor (0.2 weight)
    final normalizedViews = min(product.stats.viewCount / 1000.0, 1.0);
    score += normalizedViews * 0.2;

    // Order count factor (0.3 weight)
    final normalizedOrders = min(product.stats.orderCount / 100.0, 1.0);
    score += normalizedOrders * 0.3;

    // Recency factor (0.2 weight)
    final daysSinceCreation = DateTime.now().difference(product.createdAt).inDays;
    final recencyScore = max(0.0, 1.0 - (daysSinceCreation / 365.0));
    score += recencyScore * 0.2;

    return score.clamp(0.0, 1.0);
  }

  double _calculateTrendingScore(ProductModel product) {
    // Calculate trending score based on recent activity
    final daysSinceCreation = DateTime.now().difference(product.createdAt).inDays;
    final recencyMultiplier = daysSinceCreation <= 30 ? 1.2 : daysSinceCreation <= 90 ? 1.0 : 0.8;

    double score = (product.stats.viewCount * 0.3 +
                   product.stats.orderCount * 0.5 +
                   product.stats.rating * 0.2) / 100.0;

    return (score * recencyMultiplier).clamp(0.0, 1.0);
  }

  List<RecommendationScore> _removeDuplicatesAndSort(
    List<RecommendationScore> recommendations,
    int limit,
  ) {
    // Remove duplicates
    final seen = <String>{};
    final unique = recommendations.where((rec) => seen.add(rec.productId)).toList();

    // Sort by score
    unique.sort((a, b) => b.score.compareTo(a.score));

    return unique.take(limit).toList();
  }

  String _generateBehaviorId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}';
  }

  bool _isCacheValid(String cacheKey) {
    final expiry = _cacheExpiry[cacheKey];
    if (expiry == null) return false;
    return DateTime.now().isBefore(expiry);
  }

  /// Get fallback recommendations for new users or when no data is available
  Future<List<RecommendationScore>> getFallbackRecommendations({
    int limit = 10,
  }) async {
    try {
      List<RecommendationScore> fallbackRecommendations = [];

      // 1. Most popular products (high rating + high order count)
      final popularProducts = await _firestore
          .collection('products')
          .where('isActive', isEqualTo: true)
          .orderBy('stats.orderCount', descending: true)
          .limit(limit ~/ 2)
          .get();

      for (final doc in popularProducts.docs) {
        final product = ProductModel.fromJson({...doc.data(), 'id': doc.id});
        fallbackRecommendations.add(RecommendationScore(
          productId: product.id,
          score: 0.8 + (product.stats.rating / 5.0) * 0.2,
          type: RecommendationType.fallback,
          reason: 'Popular product',
          metadata: {
            'rating': product.stats.rating,
            'orders': product.stats.orderCount,
          },
        ));
      }

      // 2. Recently added products with good initial ratings
      final recentProducts = await _firestore
          .collection('products')
          .where('isActive', isEqualTo: true)
          .where('stats.rating', isGreaterThanOrEqualTo: 4.0)
          .orderBy('stats.rating', descending: true)
          .orderBy('createdAt', descending: true)
          .limit(limit ~/ 2)
          .get();

      for (final doc in recentProducts.docs) {
        final product = ProductModel.fromJson({...doc.data(), 'id': doc.id});

        // Check if not already included
        if (!fallbackRecommendations.any((r) => r.productId == product.id)) {
          fallbackRecommendations.add(RecommendationScore(
            productId: product.id,
            score: 0.7 + (product.stats.rating / 5.0) * 0.2,
            type: RecommendationType.newArrivals,
            reason: 'New arrival with good rating',
            metadata: {
              'rating': product.stats.rating,
              'created': product.createdAt.toIso8601String(),
            },
          ));
        }
      }

      // 3. If still need more, get products from different categories for variety
      if (fallbackRecommendations.length < limit) {
        final remainingLimit = limit - fallbackRecommendations.length;
        final existingIds = fallbackRecommendations.map((r) => r.productId).toSet();

        final categories = await _firestore.collection('categories').limit(5).get();
        for (final categoryDoc in categories.docs) {
          if (fallbackRecommendations.length >= limit) break;

          final categoryProducts = await _firestore
              .collection('products')
              .where('isActive', isEqualTo: true)
              .where('categoryId', isEqualTo: categoryDoc.id)
              .orderBy('stats.rating', descending: true)
              .limit(2)
              .get();

          for (final doc in categoryProducts.docs) {
            if (fallbackRecommendations.length >= limit) break;

            if (!existingIds.contains(doc.id)) {
              final product = ProductModel.fromJson({...doc.data(), 'id': doc.id});
              fallbackRecommendations.add(RecommendationScore(
                productId: product.id,
                score: 0.6,
                type: RecommendationType.fallback,
                reason: 'Category variety',
                metadata: {
                  'category': categoryDoc.data()['name'],
                  'rating': product.stats.rating,
                },
              ));
              existingIds.add(product.id);
            }
          }
        }
      }

      // Sort by score and return
      fallbackRecommendations.sort((a, b) => b.score.compareTo(a.score));
      return fallbackRecommendations.take(limit).toList();
    } catch (e) {
      debugPrint('Error getting fallback recommendations: $e');
      return [];
    }
  }

  /// Clear cache
  void clearCache() {
    _recommendationCache.clear();
    _cacheExpiry.clear();
  }
}
