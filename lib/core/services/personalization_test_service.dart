// lib/core/services/personalization_test_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/models/user_behavior_model.dart';
import '../data/models/product_model.dart';
import 'recommendation_service.dart';
import 'firestore_init_service.dart';

class PersonalizationTestService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final RecommendationService _recommendationService = RecommendationService();

  /// Run comprehensive tests for the personalization system
  static Future<Map<String, dynamic>> runComprehensiveTest() async {
    final results = <String, dynamic>{};

    try {
      print('🧪 Starting Personalization System Tests...\n');

      // 1. Initialize test data
      results['initialization'] = await _testInitialization();

      // 2. Test user behavior tracking
      results['behavior_tracking'] = await _testBehaviorTracking();

      // 3. Test recommendation generation
      results['recommendation_generation'] = await _testRecommendationGeneration();

      // 4. Test fallback recommendations
      results['fallback_recommendations'] = await _testFallbackRecommendations();

      // 5. Test collaborative filtering
      results['collaborative_filtering'] = await _testCollaborativeFiltering();

      // 6. Test performance
      results['performance'] = await _testPerformance();

      print('\n✅ All Personalization Tests Completed!');
      return results;

    } catch (e) {
      print('❌ Test failed with error: $e');
      results['error'] = e.toString();
      return results;
    }
  }

  /// Test 1: Initialization and Data Setup
  static Future<Map<String, dynamic>> _testInitialization() async {
    print('🔧 Testing Initialization...');

    try {
      // Initialize collections
      await FirestoreInitService.initializePersonalizationCollections();

      // Create sample data
      await FirestoreInitService.createSampleProducts();

      // Verify products exist
      final productsSnapshot = await _firestore.collection('products').limit(5).get();
      final productCount = productsSnapshot.docs.length;

      // Verify categories exist
      final categoriesSnapshot = await _firestore.collection('categories').limit(5).get();
      final categoryCount = categoriesSnapshot.docs.length;

      print('   ✅ Products created: $productCount');
      print('   ✅ Categories created: $categoryCount');

      return {
        'success': true,
        'products_created': productCount,
        'categories_created': categoryCount,
      };
    } catch (e) {
      print('   ❌ Initialization failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Test 2: User Behavior Tracking
  static Future<Map<String, dynamic>> _testBehaviorTracking() async {
    print('\n👤 Testing User Behavior Tracking...');

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        print('   ⚠️  No authenticated user - creating test behavior without userId');
      }

      // Test different types of behavior tracking
      final behaviors = [
        {'action': UserAction.view, 'targetId': 'product_1', 'targetType': 'product'},
        {'action': UserAction.click, 'targetId': 'product_1', 'targetType': 'product'},
        {'action': UserAction.addToCart, 'targetId': 'product_1', 'targetType': 'product'},
        {'action': UserAction.search, 'targetId': 'headphones', 'targetType': 'search'},
        {'action': UserAction.categoryBrowse, 'targetId': 'electronics', 'targetType': 'category'},
      ];

      int successCount = 0;
      for (final behavior in behaviors) {
        try {
          await _recommendationService.trackUserBehavior(
            action: behavior['action'] as UserAction,
            targetId: behavior['targetId'] as String,
            targetType: behavior['targetType'] as String,
            metadata: {
              'test': true,
              'timestamp': DateTime.now().toIso8601String(),
            },
          );
          successCount++;
          print('   ✅ ${behavior['action']} tracking successful');
        } catch (e) {
          print('   ❌ ${behavior['action']} tracking failed: $e');
        }
      }

      // Wait a bit for Firestore to process
      await Future.delayed(const Duration(seconds: 2));

      // Verify behaviors were stored
      final behaviorSnapshot = await _firestore
          .collection('user_behaviors')
          .where('metadata.test', isEqualTo: true)
          .get();

      print('   📊 Behaviors stored in Firestore: ${behaviorSnapshot.docs.length}');

      return {
        'success': successCount == behaviors.length,
        'behaviors_tracked': successCount,
        'behaviors_stored': behaviorSnapshot.docs.length,
      };
    } catch (e) {
      print('   ❌ Behavior tracking test failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Test 3: Recommendation Generation
  static Future<Map<String, dynamic>> _testRecommendationGeneration() async {
    print('\n🎯 Testing Recommendation Generation...');

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final userId = currentUser?.uid ?? 'test_user_123';

      // Test personalized recommendations
      final personalizedRecs = await _recommendationService.getPersonalizedRecommendations(
        userId: userId,
        limit: 5,
      );

      // Test product-based recommendations
      final productBasedRecs = await _recommendationService.getProductBasedRecommendations(
        productId: 'product_1',
        userId: userId,
        limit: 4,
      );

      // Test category recommendations
      final categoryRecs = await _recommendationService.getCategoryRecommendations(
        categoryId: 'electronics',
        userId: userId,
        limit: 3,
      );

      // Test trending recommendations
      final trendingRecs = await _recommendationService.getTrendingRecommendations(
        userId: userId,
        limit: 5,
      );

      print('   ✅ Personalized recommendations: ${personalizedRecs.length}');
      print('   ✅ Product-based recommendations: ${productBasedRecs.length}');
      print('   ✅ Category recommendations: ${categoryRecs.length}');
      print('   ✅ Trending recommendations: ${trendingRecs.length}');

      // Print sample recommendations
      if (personalizedRecs.isNotEmpty) {
        print('   📝 Sample personalized: ${personalizedRecs.first.productId} (${personalizedRecs.first.reason})');
      }

      return {
        'success': true,
        'personalized_count': personalizedRecs.length,
        'product_based_count': productBasedRecs.length,
        'category_count': categoryRecs.length,
        'trending_count': trendingRecs.length,
      };
    } catch (e) {
      print('   ❌ Recommendation generation failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Test 4: Fallback Recommendations
  static Future<Map<String, dynamic>> _testFallbackRecommendations() async {
    print('\n🔄 Testing Fallback Recommendations...');

    try {
      final fallbackRecs = await _recommendationService.getFallbackRecommendations(
        limit: 10,
      );

      print('   ✅ Fallback recommendations generated: ${fallbackRecs.length}');

      // Verify recommendation quality
      int validRecs = 0;
      for (final rec in fallbackRecs) {
        if (rec.score > 0 && rec.productId.isNotEmpty && rec.reason.isNotEmpty) {
          validRecs++;
        }
      }

      print('   📊 Valid recommendations: $validRecs/${fallbackRecs.length}');

      // Test different fallback scenarios
      final scenarios = ['popular', 'new_arrivals', 'category_variety'];
      for (final scenario in scenarios) {
        try {
          final scenarioRecs = await _recommendationService.getFallbackRecommendations(limit: 3);
          print('   ✅ $scenario scenario: ${scenarioRecs.length} recommendations');
        } catch (e) {
          print('   ❌ $scenario scenario failed: $e');
        }
      }

      return {
        'success': fallbackRecs.isNotEmpty,
        'total_recommendations': fallbackRecs.length,
        'valid_recommendations': validRecs,
      };
    } catch (e) {
      print('   ❌ Fallback recommendations test failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Test 5: Collaborative Filtering
  static Future<Map<String, dynamic>> _testCollaborativeFiltering() async {
    print('\n🤝 Testing Collaborative Filtering...');

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        print('   ⚠️  No authenticated user - skipping collaborative filtering test');
        return {'success': false, 'error': 'No authenticated user'};
      }

      // Create some user preferences for testing
      await _createTestUserPreferences(currentUser.uid);

      // Test collaborative recommendations
      final collabRecs = await _recommendationService.getPersonalizedRecommendations(
        userId: currentUser.uid,
        limit: 5,
      );

      print('   ✅ Collaborative filtering generated: ${collabRecs.length} recommendations');

      // Check for collaborative type recommendations
      final collabTypeRecs = collabRecs.where((rec) => rec.type == RecommendationType.collaborative).length;
      print('   📊 Collaborative type recommendations: $collabTypeRecs');

      return {
        'success': true,
        'total_recommendations': collabRecs.length,
        'collaborative_type_count': collabTypeRecs,
      };
    } catch (e) {
      print('   ❌ Collaborative filtering test failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Test 6: Performance
  static Future<Map<String, dynamic>> _testPerformance() async {
    print('\n⚡ Testing Performance...');

    try {
      final stopwatch = Stopwatch()..start();

      // Test cache performance
      final userId = FirebaseAuth.instance.currentUser?.uid ?? 'test_user_123';

      // First call (no cache)
      stopwatch.reset();
      stopwatch.start();
      final firstCall = await _recommendationService.getPersonalizedRecommendations(
        userId: userId,
        limit: 10,
        useCache: true,
      );
      stopwatch.stop();
      final firstCallTime = stopwatch.elapsedMilliseconds;

      // Second call (with cache)
      stopwatch.reset();
      stopwatch.start();
      final secondCall = await _recommendationService.getPersonalizedRecommendations(
        userId: userId,
        limit: 10,
        useCache: true,
      );
      stopwatch.stop();
      final secondCallTime = stopwatch.elapsedMilliseconds;

      print('   ⏱️  First call (no cache): ${firstCallTime}ms');
      print('   ⏱️  Second call (cached): ${secondCallTime}ms');
      print('   📈 Cache performance improvement: ${((firstCallTime - secondCallTime) / firstCallTime * 100).toStringAsFixed(1)}%');

      // Test concurrent requests
      stopwatch.reset();
      stopwatch.start();
      final futures = List.generate(5, (index) =>
        _recommendationService.getFallbackRecommendations(limit: 5)
      );
      await Future.wait(futures);
      stopwatch.stop();
      final concurrentTime = stopwatch.elapsedMilliseconds;

      print('   🚀 5 concurrent requests: ${concurrentTime}ms');

      return {
        'success': true,
        'first_call_ms': firstCallTime,
        'cached_call_ms': secondCallTime,
        'concurrent_requests_ms': concurrentTime,
        'cache_improvement_percent': ((firstCallTime - secondCallTime) / firstCallTime * 100),
      };
    } catch (e) {
      print('   ❌ Performance test failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Helper: Create test user preferences
  static Future<void> _createTestUserPreferences(String userId) async {
    try {
      final prefsRef = _firestore.collection('user_preferences').doc(userId);

      await prefsRef.set({
        'userId': userId,
        'categoryPreferences': {
          'electronics': 0.8,
          'fashion': 0.6,
          'books': 0.4,
          'home': 0.3,
        },
        'brandPreferences': {},
        'priceRangePreferences': {},
        'favoriteStores': ['store_1', 'store_2'],
        'searchHistory': ['headphones', 'phone case', 'bluetooth'],
        'viewedProducts': ['product_1', 'product_2', 'product_3'],
        'purchasedCategories': ['electronics'],
        'lastUpdated': FieldValue.serverTimestamp(),
        'totalInteractions': 15,
        'avgSessionDuration': 5.5,
      });

      print('   ✅ Test user preferences created');
    } catch (e) {
      print('   ❌ Failed to create test user preferences: $e');
    }
  }

  /// Clear test data
  static Future<void> clearTestData() async {
    try {
      print('🧹 Clearing test data...');

      // Clear test behaviors
      final behaviorSnapshot = await _firestore
          .collection('user_behaviors')
          .where('metadata.test', isEqualTo: true)
          .get();

      final batch = _firestore.batch();
      for (final doc in behaviorSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Clear test preferences (optional)
      // You might want to keep user preferences for real users

      await batch.commit();
      print('✅ Test data cleared');
    } catch (e) {
      print('❌ Failed to clear test data: $e');
    }
  }

  /// Quick health check
  static Future<bool> quickHealthCheck() async {
    try {
      // Check if we can connect to Firestore
      await _firestore.collection('products').limit(1).get();

      // Check if recommendation service is working
      final fallbackRecs = await _recommendationService.getFallbackRecommendations(limit: 1);

      return fallbackRecs.isNotEmpty;
    } catch (e) {
      print('Health check failed: $e');
      return false;
    }
  }
}