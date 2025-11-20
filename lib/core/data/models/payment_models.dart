// lib/core/data/models/payment_models.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_models.freezed.dart';
part 'payment_models.g.dart';

/// Payment request model
@freezed
class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required String orderId,
    required double amount,
    required String currency,
    required String customerName,
    required String customerEmail,
    required String customerPhone,
    String? description,
    Map<String, dynamic>? metadata,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}

/// Payment result model
@freezed
class PaymentResult with _$PaymentResult {
  const factory PaymentResult({
    required bool success,
    String? transactionId,
    String? paymentId,
    String? errorMessage,
    String? errorCode,
    Map<String, dynamic>? metadata,
  }) = _PaymentResult;

  factory PaymentResult.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultFromJson(json);
}

/// Refund result model
@freezed
class RefundResult with _$RefundResult {
  const factory RefundResult({
    required bool success,
    String? refundId,
    String? errorMessage,
    double? refundedAmount,
  }) = _RefundResult;

  factory RefundResult.fromJson(Map<String, dynamic> json) =>
      _$RefundResultFromJson(json);
}

/// Transaction model for storing payment history
@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String orderId,
    required String userId,
    required double amount,
    required String currency,
    required String paymentMethod,
    required String status,
    String? transactionId,
    String? paymentGateway,
    String? errorMessage,
    required DateTime createdAt,
    DateTime? completedAt,
    Map<String, dynamic>? metadata,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
