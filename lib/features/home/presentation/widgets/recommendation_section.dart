// lib/features/home/presentation/widgets/recommendation_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/models/product_model.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/recommendation_provider.dart';
import '../../../../core/presentation/widgets/product_card.dart';
import '../../../../core/data/models/user_behavior_model.dart';

class RecommendationSection extends ConsumerWidget {
  final String title;
  final FutureProvider<List<ProductModel>> provider;
  final RecommendationSectionType? section;
  final VoidCallback? onSeeAll;

  const RecommendationSection({
    super.key,
    required this.title,
    required this.provider,
    this.section,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationsAsync = ref.watch(provider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (onSeeAll != null)
                TextButton(
                  onPressed: onSeeAll,
                  child: Text(l10n.seeAll),
                ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

        // Recommendations List
        recommendationsAsync.when(
          loading: () => _buildLoadingShimmer(),
          error: (error, stack) => _buildErrorWidget(context, error),
          data: (products) => products.isEmpty
              ? _buildEmptyWidget(context)
              : _buildProductsList(context, ref, products),
        ),
      ],
    );
  }

  Widget _buildLoadingShimmer() {
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 160.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, Object error) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 32.w,
            ),
            SizedBox(height: 8.h),
            Text(
              'Failed to load recommendations',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 32.w,
            ),
            SizedBox(height: 8.h),
            Text(
              'No recommendations available',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList(BuildContext context, WidgetRef ref, List<ProductModel> products) {
    final behaviorTracker = ref.read(userBehaviorTrackerProvider);

    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            width: 160.w,
            margin: EdgeInsets.only(right: 12.w),
            child: ProductCard(
              product: product,
              onTap: () {
                // Track recommendation click
                if (section != null) {
                  final analytics = ref.read(recommendationAnalyticsProvider);
                  analytics.trackRecommendationClick(
                    productId: product.id,
                    recommendationType: _getRecommendationType(),
                    section: section!.id,
                    position: index,
                  );
                }

                // Track product view
                behaviorTracker.trackProductClick(
                  product.id,
                  metadata: {
                    'source': 'recommendation',
                    'section': section?.id ?? 'unknown',
                    'position': index,
                  },
                );

                // Navigate to product detail
                context.push('/product/${product.id}');
              },
            ),
          );
        },
      ),
    );
  }

  RecommendationType _getRecommendationType() {
    if (provider == personalizedRecommendationsProvider) {
      return RecommendationType.personalized;
    } else if (provider == trendingRecommendationsProvider) {
      return RecommendationType.trending;
    } else if (provider == recentlyViewedProvider) {
      return RecommendationType.recentlyViewed;
    }
    return RecommendationType.fallback;
  }
}

// Specialized recommendation sections
class PersonalizedRecommendationSection extends ConsumerWidget {
  const PersonalizedRecommendationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return RecommendationSection(
      title: l10n.justForYou,
      provider: personalizedRecommendationsProvider,
      section: RecommendationSectionType.personalizedHome,
      onSeeAll: () {
        // TODO: Navigate to personalized recommendations page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('More personalized recommendations coming soon!')),
        );
      },
    );
  }
}

class TrendingRecommendationSection extends ConsumerWidget {
  const TrendingRecommendationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return RecommendationSection(
      title: l10n.trendingNow,
      provider: trendingRecommendationsProvider,
      section: RecommendationSectionType.trendingHome,
      onSeeAll: () {
        // TODO: Navigate to trending page
        context.push('/trending');
      },
    );
  }
}

class RecentlyViewedSection extends ConsumerWidget {
  const RecentlyViewedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return RecommendationSection(
      title: l10n.recentlyViewed,
      provider: recentlyViewedProvider,
      section: RecommendationSectionType.recentlyViewed,
    );
  }
}
