// lib/core/widgets/empty_states.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Empty state widget
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.sp,
              color: Colors.grey[400],
            ),
            SizedBox(height: 24.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              message,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Empty cart state
class EmptyCartState extends StatelessWidget {
  final VoidCallback? onShopNow;

  const EmptyCartState({super.key, this.onShopNow});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.shopping_cart_outlined,
      title: 'Your Cart is Empty',
      message: 'Add items to your cart to see them here',
      actionLabel: 'Shop Now',
      onAction: onShopNow,
    );
  }
}

/// Empty orders state
class EmptyOrdersState extends StatelessWidget {
  final VoidCallback? onShopNow;

  const EmptyOrdersState({super.key, this.onShopNow});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.receipt_long_outlined,
      title: 'No Orders Yet',
      message: 'You haven\'t placed any orders yet',
      actionLabel: 'Start Shopping',
      onAction: onShopNow,
    );
  }
}

/// No search results state
class NoSearchResultsState extends StatelessWidget {
  final String query;

  const NoSearchResultsState({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.search_off,
      title: 'No Results Found',
      message: 'We couldn\'t find any results for "$query"',
    );
  }
}

/// Empty wishlist state
class EmptyWishlistState extends StatelessWidget {
  final VoidCallback? onBrowse;

  const EmptyWishlistState({super.key, this.onBrowse});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.favorite_border,
      title: 'Your Wishlist is Empty',
      message: 'Save items you like to your wishlist',
      actionLabel: 'Browse Products',
      onAction: onBrowse,
    );
  }
}
