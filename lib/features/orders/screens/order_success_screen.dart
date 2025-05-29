// lib/features/order_success/screens/order_success_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/utils/app_constants.dart';

class OrderSuccessScreen extends StatelessWidget {
  final String? orderNumber;

  const OrderSuccessScreen({
    super.key,
    this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Animation Container
              Container(
                width: 150.w,
                height: 150.w,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer circle animation
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Inner success icon
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 50.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Success Title
              Text(
                'Order Placed Successfully!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              // Order Number (if provided)
              if (orderNumber != null) ...[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Order #$orderNumber',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],

              // Success Message
              Text(
                'Thank you for your order! We\'ll send you a confirmation email shortly and keep you updated on your order status.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8.h),

              // Additional Info
              Text(
                'You can track your order anytime in the Orders section.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 48.h),

              // Action Buttons
              Column(
                children: [
                  // Track Order Button
                  CustomButton(
                    text: 'Track Order',
                    onPressed: () => context.go('/orders'),
                    icon: Icon(Icons.track_changes, size: 20.w),
                  ),

                  SizedBox(height: 16.h),

                  // Continue Shopping Button
                  CustomButton(
                    text: 'Continue Shopping',
                    onPressed: () => context.go('/home'),
                    isOutlined: true,
                    icon: Icon(Icons.shopping_bag_outlined, size: 20.w),
                  ),
                ],
              ),

              const Spacer(),

              // Bottom Help Text
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: theme.primaryColor,
                      size: 20.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Need help? Contact our customer support team.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to help/support
                        context.push('/help');
                      },
                      child: Text(
                        'Contact',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}