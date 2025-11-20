// lib/core/services/payment/payhere_gateway.dart

import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';
import '../../data/models/payment_models.dart';
import 'payment_gateway.dart';

/// PayHere payment gateway implementation
class PayHereGateway implements PaymentGateway {
  static const String _merchantId = String.fromEnvironment(
    'PAYHERE_MERCHANT_ID',
    defaultValue: '', // Add your merchant ID here for development
  );

  static const String _merchantSecret = String.fromEnvironment(
    'PAYHERE_MERCHANT_SECRET',
    defaultValue: '', // Add your merchant secret here for development
  );

  static const bool _isSandbox = bool.fromEnvironment(
    'PAYHERE_SANDBOX',
    defaultValue: true, // Use sandbox by default
  );

  @override
  Future<void> initialize() async {
    // PayHere SDK initializes automatically
    debugPrint('PayHere Gateway initialized (Sandbox: $_isSandbox)');
  }

  @override
  Future<PaymentResult> createPayment(PaymentRequest request) async {
    // PayHere doesn't require separate payment intent creation
    // Payment is created when user initiates payment
    return const PaymentResult(
      success: true,
      paymentId: 'pending',
    );
  }

  @override
  Future<PaymentResult> processPayment(PaymentRequest request) async {
    try {
      // Create PayHere payment object
      final payment = _createPayHerePayment(request);

      // Show PayHere payment UI
      PayHere.startPayment(payment, (paymentId) {
        // Payment completed
        debugPrint('Payment completed: $paymentId');
      }, (error) {
        // Payment error
        debugPrint('Payment error: $error');
      }, () {
        // Payment dismissed
        debugPrint('Payment dismissed');
      });

      // Note: Actual result will come through callbacks
      // This is a limitation of the PayHere SDK
      return const PaymentResult(
        success: true,
        paymentId: 'processing',
      );
    } catch (e) {
      return PaymentResult(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Create PayHere payment object from request
  Map<String, dynamic> _createPayHerePayment(PaymentRequest request) {
    return {
      "sandbox": _isSandbox,
      "merchant_id": _merchantId,
      "merchant_secret": _merchantSecret,
      "notify_url": "https://your-backend.com/payhere/notify",
      "order_id": request.orderId,
      "items": request.description ?? "Order ${request.orderId}",
      "amount": request.amount,
      "currency": request.currency,
      "first_name": request.customerName.split(' ').first,
      "last_name": request.customerName.split(' ').length > 1
          ? request.customerName.split(' ').last
          : '',
      "email": request.customerEmail,
      "phone": request.customerPhone,
      "address": "",
      "city": "",
      "country": "Sri Lanka",
      "delivery_address": "",
      "delivery_city": "",
      "delivery_country": "Sri Lanka",
      "custom_1": request.metadata?['custom_1'] ?? '',
      "custom_2": request.metadata?['custom_2'] ?? '',
    };
  }

  @override
  Future<bool> verifyPayment(String transactionId) async {
    // Implement server-side verification
    // This should call your backend to verify with PayHere
    debugPrint('Verifying payment: $transactionId');
    return true;
  }

  @override
  Future<RefundResult> refundPayment(String transactionId, double amount) async {
    // PayHere refunds must be processed through merchant portal
    // or via API (requires backend implementation)
    return RefundResult(
      success: false,
      errorMessage: 'Refunds must be processed through PayHere merchant portal',
    );
  }

  @override
  Future<PaymentStatus> getPaymentStatus(String transactionId) async {
    // Implement status check via backend
    return PaymentStatus.pending;
  }

  @override
  List<PaymentMethod> getSupportedPaymentMethods() {
    return [
      PaymentMethod.creditCard,
      PaymentMethod.debitCard,
      PaymentMethod.mobileWallet,
      PaymentMethod.bankTransfer,
    ];
  }

  @override
  Future<void> dispose() async {
    // No cleanup needed for PayHere
  }
}
