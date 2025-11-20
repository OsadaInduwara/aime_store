// lib/core/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/product_model.dart';
import '../../constants/app_constants.dart';
import '../../utils/currency_formatter.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.push('/product/${product.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppConstants.borderRadius.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.thumbnailImage,
                    width: double.infinity,
                    height: 150.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 150.h,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 150.h,
                      color: Colors.grey[200],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),

                // Wishlist Button
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 18.w,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ),

                // Discount Badge
                if (product.pricing.salePrice != null)
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        '${_calculateDiscountPercentage()}% OFF',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 4.h),

                  // Store Name
                  Text(
                    'Store Name', // TODO: Get from store provider
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Price
                  Row(
                    children: [
                      Text(
                        CurrencyFormatter.format(
                          product.pricing.salePrice ?? product.pricing.basePrice,
                        ),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),

                      if (product.pricing.salePrice != null) ...[
                        SizedBox(width: 8.w),
                        Text(
                          CurrencyFormatter.formatLegacy(product.pricing.basePrice),
                          style: theme.textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ],
                  ),

                  SizedBox(height: 8.h),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16.w,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        product.stats.rating.toStringAsFixed(1),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' (${product.stats.reviewCount})',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _calculateDiscountPercentage() {
    if (product.pricing.salePrice == null) return 0;

    final discount = product.pricing.basePrice - product.pricing.salePrice!;
    return ((discount / product.pricing.basePrice) * 100).round();
  }
}
