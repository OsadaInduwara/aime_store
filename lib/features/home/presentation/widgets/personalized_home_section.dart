// lib/features/home/presentation/widgets/personalized_home_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/presentation/widgets/product_card.dart';
import '../../../../core/presentation/widgets/global_loading_overlay.dart';
import '../providers/recommendation_provider.dart';
import '../../../../core/data/models/user_behavior_model.dart';

/// Home section showing personalized recommendations
class PersonalizedHomeSection extends ConsumerWidget {
  const PersonalizedHomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final personalizedRecs = ref.watch(personalizedRecommendationsProvider);
    final trendingRecs = ref.watch(trendingRecommendationsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Just for You section (personalized)
        if (authState.maybeWhen(
          authenticated: (user) => true,
          profileSetupRequired: (user) => true,
          orElse: () => false,
        )) ...[
          _buildSectionHeader(context, 'Just for You', Icons.person),
          SizedBox(height: 8.h),
          SizedBox(
            height: 200.h,
            child: personalizedRecs.when(
              data: (products) {
                if (products.isEmpty) {
                  return _buildEmptyState('No personalized recommendations yet');
                }
                return _buildProductList(products, ref, 'home_personalized');
              },
              loading: () => _buildLoadingState(),
              error: (error, stack) => _buildErrorState('Failed to load recommendations'),
            ),
          ),
          SizedBox(height: 24.h),
        ],

        // Trending Now section
        _buildSectionHeader(context, 'Trending Now', Icons.trending_up),
        SizedBox(height: 8.h),
        SizedBox(
          height: 200.h,
          child: trendingRecs.when(
            data: (products) {
              if (products.isEmpty) {
                return _buildEmptyState('No trending products available');
              }
              return _buildProductList(products, ref, 'home_trending');
            },
            loading: () => _buildLoadingState(),
            error: (error, stack) => _buildErrorState('Failed to load trending products'),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Icon(icon, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              // Navigate to see all
            },
            child: const Text('See All'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(List<dynamic> products, WidgetRef ref, String section) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          width: 150.w,
          margin: EdgeInsets.only(right: 12.w),
          child: GestureDetector(
            onTap: () {
              // Track recommendation click
              _trackRecommendationClick(ref, product.id, section, index);

              // Navigate to product detail
              // Navigator.push(context, ...);
            },
            child: ProductCard(
              product: product,
              showQuickActions: false,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 150.w,
          margin: EdgeInsets.only(right: 12.w),
          child: ShimmerLoading(
            isLoading: true,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 48.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48.sp,
            color: Colors.red[400],
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(
              color: Colors.red[600],
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  void _trackRecommendationClick(WidgetRef ref, String productId, String section, int position) {
    try {
      final analytics = ref.read(recommendationAnalyticsProvider);

      // Determine recommendation type based on section
      RecommendationType recType;
      switch (section) {
        case 'home_personalized':
          recType = RecommendationType.personalized;
          break;
        case 'home_trending':
          recType = RecommendationType.trending;
          break;
        default:
          recType = RecommendationType.fallback;
      }

      analytics.trackRecommendationClick(
        productId: productId,
        recommendationType: recType,
        section: section,
        position: position,
      );
    } catch (e) {
      // Don't block UI for tracking errors
      debugPrint('Failed to track recommendation click: $e');
    }
  }
}

/// Widget for category-based recommendations
class CategoryRecommendationsSection extends ConsumerWidget {
  final String categoryId;
  final String categoryName;

  const CategoryRecommendationsSection({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryRecs = ref.watch(categoryRecommendationsProvider(categoryId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'More in $categoryName'),
        SizedBox(height: 8.h),
        SizedBox(
          height: 200.h,
          child: categoryRecs.when(
            data: (products) {
              if (products.isEmpty) {
                return _buildEmptyState();
              }
              return _buildProductList(products, ref);
            },
            loading: () => _buildLoadingState(),
            error: (error, stack) => _buildErrorState(),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildProductList(List<dynamic> products, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          width: 150.w,
          margin: EdgeInsets.only(right: 12.w),
          child: GestureDetector(
            onTap: () {
              // Track category recommendation click
              final analytics = ref.read(recommendationAnalyticsProvider);
              analytics.trackRecommendationClick(
                productId: product.id,
                recommendationType: RecommendationType.categoryBased,
                section: 'category_$categoryId',
                position: index,
              );

              // Navigate to product detail
            },
            child: ProductCard(
              product: product,
              showQuickActions: false,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return const CompactLoadingIndicator(message: 'Loading recommendations...');
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text('No recommendations available'),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: Text('Failed to load recommendations'),
    );
  }
}