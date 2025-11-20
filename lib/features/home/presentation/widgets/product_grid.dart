// lib/features/home/widgets/product_grid.dart - USING REAL PROVIDERS
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/providers/products_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/product_card.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(featuredProductsProvider);
    final theme = Theme.of(context);

    return productsAsync.when(
      loading: () => SliverToBoxAdapter(
        child: SizedBox(
          height: 200.h,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Container(
          height: 200.h,
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48.w,
                color: Colors.grey,
              ),
              SizedBox(height: 16.h),
              Text(
                'Failed to load products',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.h),
              ElevatedButton(
                onPressed: () => ref.refresh(featuredProductsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (products) {
        if (products.isEmpty) {
          return SliverToBoxAdapter(
            child: Container(
              height: 200.h,
              padding: EdgeInsets.all(AppConstants.defaultPadding.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_outlined,
                    size: 48.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No products available',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppConstants.productsGridCrossAxisCount,
              childAspectRatio: AppConstants.productCardAspectRatio,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
              childCount: products.length,
            ),
          ),
        );
      },
    );
  }
}
