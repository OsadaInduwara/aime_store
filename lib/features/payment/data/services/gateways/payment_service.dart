// lib/core/services/payment/payment_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/payment_models.dart';
import 'payment_gateway.dart';
import 'payhere_gateway.dart';

/// Payment service provider
/// This is the main entry point for all payment operations
final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService();
});

/// Payment service that manages payment operations
/// Uses dependency injection to allow easy switching of payment gateways
class PaymentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final PaymentGateway _gateway;

  PaymentService({PaymentGateway? gateway}) {
    // Use provided gateway or default to PayHere
    _gateway = gateway ?? PayHereGateway();
    _gateway.initialize();
  }

  /// Switch payment gateway at runtime
  void switchGateway(PaymentGateway newGateway) {
    _gateway.dispose();
    // _gateway = newGateway; // Uncomment when you want to switch
    newGateway.initialize();
  }

  /// Process a payment
  Future<PaymentResult> processPayment(PaymentRequest request) async {
    try {
      // Create transaction record
      final transaction = await _createTransaction(request);

      // Process payment through gateway
      final result = await _gateway.processPayment(request);

      // Update transaction with result
      await _updateTransaction(
        transaction.id,
        result.success ? 'completed' : 'failed',
        transactionId: result.transactionId,
        errorMessage: result.errorMessage,
      );

      return result;
    } catch (e) {
      return PaymentResult(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Process cash on delivery (no gateway needed)
  Future<PaymentResult> processCashOnDelivery(PaymentRequest request) async {
    try {
      // Create transaction record
      final transaction = await _createTransaction(
        request,
        paymentMethod: 'cash_on_delivery',
      );

      // Update transaction as pending (will be completed on delivery)
      await _updateTransaction(transaction.id, 'pending');

      return PaymentResult(
        success: true,
        transactionId: transaction.id,
        paymentId: 'COD-${transaction.id}',
      );
    } catch (e) {
      return PaymentResult(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Verify payment
  Future<bool> verifyPayment(String transactionId) async {
    return await _gateway.verifyPayment(transactionId);
  }

  /// Refund payment
  Future<RefundResult> refundPayment(String transactionId, double amount) async {
    final result = await _gateway.refundPayment(transactionId, amount);

    if (result.success) {
      // Update transaction status
      await _updateTransaction(transactionId, 'refunded');
    }

    return result;
  }

  /// Get payment status
  Future<PaymentStatus> getPaymentStatus(String transactionId) async {
    return await _gateway.getPaymentStatus(transactionId);
  }

  /// Get supported payment methods
  List<PaymentMethod> getSupportedPaymentMethods() {
    return [
      PaymentMethod.cashOnDelivery,
      ..._gateway.getSupportedPaymentMethods(),
    ];
  }

  /// Get transaction history for a user
  Future<List<TransactionModel>> getTransactionHistory(String userId) async {
    final snapshot = await _firestore
        .collection('transactions')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => TransactionModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// Get transaction by ID
  Future<TransactionModel?> getTransaction(String transactionId) async {
    final doc = await _firestore.collection('transactions').doc(transactionId).get();

    if (!doc.exists) return null;

    return TransactionModel.fromJson({...doc.data()!, 'id': doc.id});
  }

  /// Create transaction record in Firestore
  Future<TransactionModel> _createTransaction(
    PaymentRequest request, {
    String paymentMethod = 'card',
  }) async {
    final transaction = TransactionModel(
      id: '', // Will be set by Firestore
      orderId: request.orderId,
      userId: request.metadata?['userId'] ?? '',
      amount: request.amount,
      currency: request.currency,
      paymentMethod: paymentMethod,
      status: 'pending',
      paymentGateway: _gateway is PayHereGateway ? 'payhere' : 'unknown',
      createdAt: DateTime.now(),
      metadata: request.metadata,
    );

    final docRef = await _firestore.collection('transactions').add(
          transaction.toJson()..remove('id'),
        );

    return transaction.copyWith(id: docRef.id);
  }

  /// Update transaction status
  Future<void> _updateTransaction(
    String transactionId,
    String status, {
    String? transactionId,
    String? errorMessage,
  }) async {
    final updates = {
      'status': status,
      if (transactionId != null) 'transactionId': transactionId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (status == 'completed' || status == 'failed')
        'completedAt': FieldValue.serverTimestamp(),
    };

    await _firestore.collection('transactions').doc(transactionId).update(updates);
  }

  /// Dispose resources
  void dispose() {
    _gateway.dispose();
  }
}
