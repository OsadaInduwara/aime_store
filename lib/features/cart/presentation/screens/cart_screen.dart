// lib/features/cart/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/models/cart_model.dart';
import '../../../../core/presentation/providers/cart_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../l10n/app_localizations.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.cart),
        centerTitle: true,
      ),
      body: cartAsync.when(
        data: (cartItems) {
          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Your cart is empty',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Add some products to get started',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
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

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(AppConstants.defaultPadding.w),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return _CartItemCard(item: item);
                  },
                ),
              ),
              _buildCartSummary(context, cartItems, l10n, theme),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading cart'),
        ),
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, List<CartItem> items, AppLocalizations l10n, ThemeData theme) {
    final subtotal = items.fold<double>(0, (sum, item) => sum + item.totalPrice);
    final delivery = 0.0; // Calculate delivery fee
    final total = subtotal + delivery;

    return Container(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: theme.textTheme.bodyLarge),
                Text(
                  CurrencyFormatter.formatLegacy(subtotal),
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery', style: theme.textTheme.bodyLarge),
                Text(
                  delivery == 0 ? 'Free' : CurrencyFormatter.formatLegacy(delivery),
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  CurrencyFormatter.formatLegacy(total),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            CustomButton(
              text: 'Proceed to Checkout',
              onPressed: () => context.push('/checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItemCard extends ConsumerWidget {
  final CartItem item;

  const _CartItemCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              item.productImage,
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80.w,
                height: 80.w,
                color: Colors.grey[200],
                child: const Icon(Icons.error),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.variantName != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    item.variantName!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ],
                SizedBox(height: 8.h),
                Text(
                  CurrencyFormatter.formatLegacy(item.unitPrice),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Quantity Controls
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.dividerColor),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => ref.read(cartProvider.notifier).updateQuantity(
                        item.id,
                        item.quantity - 1,
                      ),
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        child: const Icon(Icons.remove, size: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        item.quantity.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => ref.read(cartProvider.notifier).updateQuantity(
                        item.id,
                        item.quantity + 1,
                      ),
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => ref.read(cartProvider.notifier).removeItem(item.id),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
