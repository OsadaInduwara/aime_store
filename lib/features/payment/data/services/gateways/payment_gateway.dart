// lib/core/services/payment/payment_gateway.dart

import '../../data/models/payment_models.dart';

/// Abstract payment gateway interface
/// This allows easy switching between different payment providers
/// (PayHere, Stripe, Razorpay, etc.) without changing business logic
abstract class PaymentGateway {
  /// Initialize the payment gateway
  Future<void> initialize();

  /// Create a payment intent/request
  Future<PaymentResult> createPayment(PaymentRequest request);

  /// Process a payment
  Future<PaymentResult> processPayment(PaymentRequest request);

  /// Verify a payment
  Future<bool> verifyPayment(String transactionId);

  /// Refund a payment
  Future<RefundResult> refundPayment(String transactionId, double amount);

  /// Get payment status
  Future<PaymentStatus> getPaymentStatus(String transactionId);

  /// Get supported payment methods
  List<PaymentMethod> getSupportedPaymentMethods();

  /// Clean up resources
  Future<void> dispose();
}

/// Payment methods supported
enum PaymentMethod {
  cashOnDelivery,
  creditCard,
  debitCard,
  mobileWallet,
  bankTransfer,
  upi,
}

/// Payment status
enum PaymentStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded,
}
