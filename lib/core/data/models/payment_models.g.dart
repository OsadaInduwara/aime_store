// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentRequestImpl _$$PaymentRequestImplFromJson(Map<String, dynamic> json) =>
    _$PaymentRequestImpl(
      orderId: json['orderId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      customerName: json['customerName'] as String,
      customerEmail: json['customerEmail'] as String,
      customerPhone: json['customerPhone'] as String,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentRequestImplToJson(
        _$PaymentRequestImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'amount': instance.amount,
      'currency': instance.currency,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'customerPhone': instance.customerPhone,
      'description': instance.description,
      'metadata': instance.metadata,
    };

_$PaymentResultImpl _$$PaymentResultImplFromJson(Map<String, dynamic> json) =>
    _$PaymentResultImpl(
      success: json['success'] as bool,
      transactionId: json['transactionId'] as String?,
      paymentId: json['paymentId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentResultImplToJson(_$PaymentResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'transactionId': instance.transactionId,
      'paymentId': instance.paymentId,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'metadata': instance.metadata,
    };

_$RefundResultImpl _$$RefundResultImplFromJson(Map<String, dynamic> json) =>
    _$RefundResultImpl(
      success: json['success'] as bool,
      refundId: json['refundId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      refundedAmount: (json['refundedAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RefundResultImplToJson(_$RefundResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'refundId': instance.refundId,
      'errorMessage': instance.errorMessage,
      'refundedAmount': instance.refundedAmount,
    };

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      paymentMethod: json['paymentMethod'] as String,
      status: json['status'] as String,
      transactionId: json['transactionId'] as String?,
      paymentGateway: json['paymentGateway'] as String?,
      errorMessage: json['errorMessage'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'userId': instance.userId,
      'amount': instance.amount,
      'currency': instance.currency,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'transactionId': instance.transactionId,
      'paymentGateway': instance.paymentGateway,
      'errorMessage': instance.errorMessage,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };
