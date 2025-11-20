import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart'; // for TimestampConverter

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    required String orderNumber,
    required String customerId,
    required String storeId,
    required List<OrderItem> items,
    required OrderPricing pricing,
    required CustomerInfo customer,
    required DeliveryInfo delivery,
    required PaymentInfo payment,
    required String status,
    @Default([]) List<StatusHistory> statusHistory,
    String? customerNotes,
    String? vendorNotes,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    @TimestampConverter() DateTime? confirmedAt,
    @TimestampConverter() DateTime? shippedAt,
    @TimestampConverter() DateTime? deliveredAt,
    @TimestampConverter() DateTime? cancelledAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required String productName,
    required String productImage,
    String? variantId,
    String? variantName,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    Map<String, dynamic>? customizations,
    String? notes,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

@freezed
class OrderPricing with _$OrderPricing {
  const factory OrderPricing({
    required double subtotal,
    required double deliveryFee,
    @Default(0.0) double discount,
    @Default(0.0) double tax,
    required double total,
    @Default('LKR') String currency,
  }) = _OrderPricing;

  factory OrderPricing.fromJson(Map<String, dynamic> json) => _$OrderPricingFromJson(json);
}

@freezed
class CustomerInfo with _$CustomerInfo {
  const factory CustomerInfo({
    required String name,
    required String phoneNumber,
    String? email,
  }) = _CustomerInfo;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => _$CustomerInfoFromJson(json);
}

@freezed
class DeliveryInfo with _$DeliveryInfo {
  const factory DeliveryInfo({
    required String type, // 'self_pickup' | 'home_delivery'
    Address? address,
    @TimestampConverter() DateTime? scheduledDate,
    String? scheduledTime,
    String? instructions,
  }) = _DeliveryInfo;

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => _$DeliveryInfoFromJson(json);
}

@freezed
class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo({
    required String method,
    required String status,
    String? transactionId,
    @TimestampConverter() DateTime? paidAt,
    String? refundId,
    Map<String, dynamic>? gatewayResponse,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => _$PaymentInfoFromJson(json);
}

@freezed
class StatusHistory with _$StatusHistory {
  const factory StatusHistory({
    required String status,
    @TimestampConverter() required DateTime timestamp,
    String? note,
    required String updatedBy,
  }) = _StatusHistory;

  factory StatusHistory.fromJson(Map<String, dynamic> json) => _$StatusHistoryFromJson(json);
}

enum OrderStatus {
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}
