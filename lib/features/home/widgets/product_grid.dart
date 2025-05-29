// lib/features/home/widgets/product_grid.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/providers/products_provider.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/product_card.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(featuredProductsProvider);

    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return SizedBox(
            height: 200.h,
            child: Center(
              child: Text(
                'No products found',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
          child: MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppConstants.productsGridCrossAxisCount,
            ),
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        );
      },
      loading: () => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
        child: MasonryGridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppConstants.productsGridCrossAxisCount,
          ),
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
              ),
            );
          },
        ),
      ),
      error: (error, stack) => SizedBox(
        height: 200.h,
        child: Center(
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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}