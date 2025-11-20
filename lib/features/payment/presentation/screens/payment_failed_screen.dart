// lib/features/payment/presentation/screens/payment_failed_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Screen shown after payment failure
class PaymentFailedScreen extends StatelessWidget {
  final String orderId;
  final String errorMessage;

  const PaymentFailedScreen({
    super.key,
    required this.orderId,
    required this.errorMessage,
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
              // Error icon
              Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline,
                  size: 64.sp,
                  color: Colors.red.shade400,
                ),
              ),

              SizedBox(height: 32.h),

              // Error message
              Text(
                'Payment Failed',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12.h),

              Text(
                errorMessage.isEmpty
                    ? 'Something went wrong with your payment'
                    : errorMessage,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              // Tips card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.blue.shade700,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Common Issues',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    _buildTip('Check if you have sufficient balance'),
                    _buildTip('Verify your card details are correct'),
                    _buildTip('Ensure your internet connection is stable'),
                    _buildTip('Try a different payment method'),
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
                    context.pop(); // Go back to payment method selection
                  },
                  child: const Text('Try Again'),
                ),
              ),

              SizedBox(height: 12.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Implement contact support
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Contact support feature coming soon'),
                      ),
                    );
                  },
                  child: const Text('Contact Support'),
                ),
              ),

              SizedBox(height: 12.h),

              TextButton(
                onPressed: () {
                  context.go('/home');
                },
                child: const Text('Return to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 16.sp,
            color: Colors.blue.shade600,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
