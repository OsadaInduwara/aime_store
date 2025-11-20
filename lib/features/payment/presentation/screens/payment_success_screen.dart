// lib/features/payment/presentation/screens/payment_success_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

/// Screen shown after successful payment
class PaymentSuccessScreen extends StatelessWidget {
  final String orderId;
  final String transactionId;
  final double amount;
  final String currency;

  const PaymentSuccessScreen({
    super.key,
    required this.orderId,
    required this.transactionId,
    required this.amount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success animation
              Lottie.asset(
                'assets/animations/success.json',
                width: 200.w,
                height: 200.h,
                repeat: false,
              ),

              SizedBox(height: 32.h),

              // Success message
              Text(
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12.h),

              Text(
                'Your order has been placed successfully',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              // Order details card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Order ID', orderId),
                    Divider(height: 24.h),
                    _buildDetailRow('Transaction ID', transactionId),
                    Divider(height: 24.h),
                    _buildDetailRow(
                      'Amount Paid',
                      '$currency ${amount.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Action buttons
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/orders/$orderId');
                  },
                  child: const Text('View Order'),
                ),
              ),

              SizedBox(height: 12.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: OutlinedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  child: const Text('Continue Shopping'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
