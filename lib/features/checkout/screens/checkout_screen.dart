// lib/features/checkout/screens/checkout_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/address_provider.dart';
import '../../../core/providers/cart_provider.dart';
import '../../../core/providers/checkout_provider.dart';
import '../../../core/models/cart_model.dart';
import '../../../core/models/user_model.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../l10n/app_localizations.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String _selectedPaymentMethod = 'cash_on_delivery';
  String? _selectedAddressId;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartAsync = ref.watch(cartProvider);
    final addressesAsync = ref.watch(addressesProvider);
    final checkoutState = ref.watch(checkoutProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
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
                    size: 64.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Your cart is empty',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context.go('/home'),
                    child: const Text('Continue Shopping'),
                  ),
                ],
              ),
            );
          }

          final subtotal = cartItems.fold<double>(0, (sum, item) => sum + item.totalPrice);
          const deliveryFee = 0.0;
          final total = subtotal + deliveryFee;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(AppConstants.defaultPadding.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Items
                      _buildOrderSummary(cartItems, theme),

                      SizedBox(height: 24.h),

                      // Delivery Address
                      _buildDeliverySection(addressesAsync, theme),

                      SizedBox(height: 24.h),

                      // Payment Method
                      _buildPaymentSection(theme),

                      SizedBox(height: 24.h),

                      // Order Notes
                      _buildNotesSection(theme),

                      SizedBox(height: 24.h),

                      // Price Summary
                      _buildPriceSummary(subtotal, deliveryFee, total, theme),
                    ],
                  ),
                ),
              ),
              _buildBottomSheet(context, ref, checkoutState),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.w, color: Colors.grey),
              SizedBox(height: 16.h),
              Text('Error loading cart'),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => ref.refresh(cartProvider),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(List<CartItem> items, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${items.length} item${items.length > 1 ? 's' : ''}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...items.map((item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.network(
                    item.productImage,
                    width: 50.w,
                    height: 50.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 50.w,
                      height: 50.w,
                      color: Colors.grey[200],
                      child: const Icon(Icons.error, size: 20),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (item.variantName != null) ...[
                        SizedBox(height: 2.h),
                        Text(
                          item.variantName!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                      SizedBox(height: 4.h),
                      Text(
                        'Qty: ${item.quantity}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      CurrencyFormatter.format(item.totalPrice),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (item.quantity > 1) ...[
                      SizedBox(height: 2.h),
                      Text(
                        '${CurrencyFormatter.format(item.unitPrice)} each',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildDeliverySection(AsyncValue<List<Address>> addressesAsync, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Address',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () => context.push('/addresses'),
                child: const Text('Change'),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          addressesAsync.when(
            data: (addresses) {
              if (addresses.isEmpty) {
                return Column(
                  children: [
                    Icon(
                      Icons.location_off_outlined,
                      size: 32.w,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8.h),
                    const Text('No addresses saved'),
                    SizedBox(height: 8.h),
                    TextButton(
                      onPressed: () => context.push('/add-address'),
                      child: const Text('Add Address'),
                    ),
                  ],
                );
              }

              final defaultAddress = addresses.firstWhere(
                    (addr) => addr.isDefault,
                orElse: () => addresses.first,
              );
              _selectedAddressId = defaultAddress.id;

              return Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: theme.primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.w,
                          color: theme.primaryColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          defaultAddress.label,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (defaultAddress.isDefault) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'Default',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      defaultAddress.fullName,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      defaultAddress.phoneNumber,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${defaultAddress.addressLine1}${defaultAddress.addressLine2 != null ? ', ${defaultAddress.addressLine2}' : ''}',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      '${defaultAddress.city}, ${defaultAddress.district} ${defaultAddress.postalCode}',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) => Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 32.w),
                  SizedBox(height: 8.h),
                  const Text('Error loading addresses'),
                  TextButton(
                    onPressed: () => ref.refresh(addressesProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection(ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _PaymentMethodTile(
            title: 'Cash on Delivery',
            subtitle: 'Pay when you receive the order',
            icon: Icons.money,
            value: 'cash_on_delivery',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
          ),
          _PaymentMethodTile(
            title: 'Bank Transfer',
            subtitle: 'Transfer to our bank account',
            icon: Icons.account_balance,
            value: 'bank_transfer',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
          ),
          _PaymentMethodTile(
            title: 'Card Payment',
            subtitle: 'Pay with credit/debit card',
            icon: Icons.credit_card,
            value: 'card_payment',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection(ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Notes (Optional)',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Add any special instructions for your order...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              contentPadding: EdgeInsets.all(12.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummary(double subtotal, double deliveryFee, double total, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: theme.textTheme.bodyLarge),
              Text(
                CurrencyFormatter.format(subtotal),
                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee', style: theme.textTheme.bodyLarge),
              Text(
                deliveryFee == 0 ? 'Free' : CurrencyFormatter.format(deliveryFee),
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: deliveryFee == 0 ? Colors.green : null,
                ),
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
                CurrencyFormatter.format(total),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, WidgetRef ref, AsyncValue<bool> checkoutState) {
    final theme = Theme.of(context);

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
        child: CustomButton(
          text: 'Place Order',
          onPressed: _selectedAddressId != null ? () => _placeOrder(ref) : null,
          isLoading: checkoutState.isLoading,
        ),
      ),
    );
  }

  Future<void> _placeOrder(WidgetRef ref) async {
    try {
      await ref.read(checkoutProvider.notifier).placeOrder(
        addressId: _selectedAddressId!,
        paymentMethod: _selectedPaymentMethod,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      );

      if (mounted) {
        context.go('/order-success');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to place order: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const _PaymentMethodTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = value == groupValue;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? theme.primaryColor : theme.dividerColor,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8.r),
        color: isSelected ? theme.primaryColor.withOpacity(0.05) : null,
      ),
      child: RadioListTile<String>(
        title: Row(
          children: [
            Icon(
              icon,
              size: 20.w,
              color: isSelected ? theme.primaryColor : theme.textTheme.bodySmall?.color,
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        activeColor: theme.primaryColor,
      ),
    );
  }
}