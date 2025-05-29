// lib/features/home/widgets/category_chip_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/categories_provider.dart';
import '../../../core/utils/app_constants.dart';

class CategoryChipList extends ConsumerWidget {
  const CategoryChipList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(topCategoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        return SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return GestureDetector(
                onTap: () => context.push('/category/${category.id}'),
                child: Container(
                  width: 80.w,
                  margin: EdgeInsets.only(right: 12.w),
                  child: Column(
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getCategoryIcon(category.name),
                          color: Theme.of(context).primaryColor,
                          size: 28.w,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        category.name,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      loading: () => SizedBox(
        height: 100.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              width: 80.w,
              margin: EdgeInsets.only(right: 12.w),
              child: Column(
                children: [
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 60.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      error: (error, stack) => const SizedBox.shrink(),
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'electronics':
        return Icons.phone_android;
      case 'fashion':
        return Icons.checkroom;
      case 'home':
        return Icons.home_outlined;
      case 'beauty':
        return Icons.face;
      case 'sports':
        return Icons.sports_soccer;
      case 'books':
        return Icons.menu_book;
      case 'food':
        return Icons.restaurant;
      case 'cakes':
        return Icons.cake;
      case 'crafts':
        return Icons.palette;
      default:
        return Icons.category;
    }
  }
}