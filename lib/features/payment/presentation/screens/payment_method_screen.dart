// lib/features/payment/presentation/screens/payment_method_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/payment/payment_gateway.dart';
import '../../../../core/services/payment/payment_service.dart';

/// Screen for selecting payment method
class PaymentMethodScreen extends ConsumerStatefulWidget {
  final String orderId;
  final double amount;
  final String currency;

  const PaymentMethodScreen({
    super.key,
    required this.orderId,
    required this.amount,
    required this.currency,
  });

  @override
  ConsumerState<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends ConsumerState<PaymentMethodScreen> {
  PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    final paymentService = ref.watch(paymentServiceProvider);
    final supportedMethods = paymentService.getSupportedPaymentMethods();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment Method'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Order summary
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Total',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${widget.currency} ${widget.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Payment methods list
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Text(
                  'Choose how to pay',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),

                // Cash on Delivery
                if (supportedMethods.contains(PaymentMethod.cashOnDelivery))
                  _buildPaymentMethodTile(
                    method: PaymentMethod.cashOnDelivery,
                    title: 'Cash on Delivery',
                    subtitle: 'Pay when you receive your order',
                    icon: Icons.money,
                  ),

                // Card Payment
                if (supportedMethods.contains(PaymentMethod.creditCard) ||
                    supportedMethods.contains(PaymentMethod.debitCard))
                  _buildPaymentMethodTile(
                    method: PaymentMethod.creditCard,
                    title: 'Card Payment',
                    subtitle: 'Visa, Mastercard, Amex',
                    icon: Icons.credit_card,
                  ),

                // Mobile Wallet
                if (supportedMethods.contains(PaymentMethod.mobileWallet))
                  _buildPaymentMethodTile(
                    method: PaymentMethod.mobileWallet,
                    title: 'Mobile Wallet',
                    subtitle: 'eZ Cash, Genie, mCash',
                    icon: Icons.phone_android,
                  ),

                // Bank Transfer
                if (supportedMethods.contains(PaymentMethod.bankTransfer))
                  _buildPaymentMethodTile(
                    method: PaymentMethod.bankTransfer,
                    title: 'Online Banking',
                    subtitle: 'Direct bank transfer',
                    icon: Icons.account_balance,
                  ),
              ],
            ),
          ),

          // Continue button
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _selectedMethod == null ? null : _handleContinue,
                  child: const Text('Continue'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile({
    required PaymentMethod method,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = _selectedMethod == method;

    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        leading: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade600,
            size: 24.sp,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Radio<PaymentMethod>(
          value: method,
          groupValue: _selectedMethod,
          onChanged: (value) {
            setState(() {
              _selectedMethod = value;
            });
          },
        ),
        onTap: () {
          setState(() {
            _selectedMethod = method;
          });
        },
      ),
    );
  }

  void _handleContinue() {
    if (_selectedMethod == null) return;

    if (_selectedMethod == PaymentMethod.cashOnDelivery) {
      // Navigate to order confirmation
      context.push('/payment/cod-confirm', extra: {
        'orderId': widget.orderId,
        'amount': widget.amount,
        'currency': widget.currency,
      });
    } else {
      // Navigate to payment processing
      context.push('/payment/process', extra: {
        'orderId': widget.orderId,
        'amount': widget.amount,
        'currency': widget.currency,
        'method': _selectedMethod,
      });
    }
  }
}
