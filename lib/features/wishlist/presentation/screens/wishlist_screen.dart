// lib/features/wishlist/screens/wishlist_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/providers/wishlist_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/product_card.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../l10n/app_localizations.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistAsync = ref.watch(wishlistProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
      ),
      body: wishlistAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_outline,
                    size: 80.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Your wishlist is empty',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Save items you like to view them later',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    text: 'Start Shopping',
                    onPressed: () => context.go('/home'),
                    width: 200.w,
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding.w),
            child: MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppConstants.productsGridCrossAxisCount,
              ),
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ProductCard(product: items[index]);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading wishlist'),
        ),
      ),
    );
  }
}
