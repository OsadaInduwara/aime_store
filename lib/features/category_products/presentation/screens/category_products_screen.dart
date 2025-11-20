// lib/features/category_products/screens/category_products_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/presentation/providers/category_products_provider.dart';
import '../../../../core/presentation/providers/products_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/product_card.dart';

class CategoryProductsScreen extends ConsumerStatefulWidget {
  final String categoryId;

  const CategoryProductsScreen({
    super.key,
    required this.categoryId,
  });

  @override
  ConsumerState<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends ConsumerState<CategoryProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryProductsProvider(widget.categoryId).notifier).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(categoryProductsProvider(widget.categoryId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Show filter options
            },
            icon: const Icon(Icons.filter_list),
          ),
          IconButton(
            onPressed: () {
              // Show sort options
            },
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: productsAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 80.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No products found',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Check back later for new products',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
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
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Error loading products'),
              ElevatedButton(
                onPressed: () => ref.refresh(categoryProductsProvider(widget.categoryId)),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
