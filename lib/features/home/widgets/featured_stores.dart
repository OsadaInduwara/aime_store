// lib/features/home/widgets/featured_stores.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/stores_provider.dart';
import '../../../core/utils/app_constants.dart';

class FeaturedStores extends ConsumerWidget {
  const FeaturedStores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storesAsync = ref.watch(featuredStoresProvider);
    final theme = Theme.of(context);

    return storesAsync.when(
      data: (stores) {
        return SizedBox(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];

              return GestureDetector(
                onTap: () => context.push('/store/${store.id}'),
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.only(right: 12.w),
                  child: Column(
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.primaryColor.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: store.logo ?? '',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: theme.primaryColor.withOpacity(0.1),
                              child: Icon(
                                Icons.store,
                                color: theme.primaryColor,
                                size: 32.w,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: theme.primaryColor.withOpacity(0.1),
                              child: Icon(
                                Icons.store,
                                color: theme.primaryColor,
                                size: 32.w,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        store.storeName,
                        style: theme.textTheme.bodySmall?.copyWith(
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
        height: 120.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 100.w,
              margin: EdgeInsets.only(right: 12.w),
              child: Column(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 80.w,
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
}