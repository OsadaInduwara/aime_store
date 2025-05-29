// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      orderNumber: json['orderNumber'] as String,
      customerId: json['customerId'] as String,
      storeId: json['storeId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricing: OrderPricing.fromJson(json['pricing'] as Map<String, dynamic>),
      customer: CustomerInfo.fromJson(json['customer'] as Map<String, dynamic>),
      delivery: DeliveryInfo.fromJson(json['delivery'] as Map<String, dynamic>),
      payment: PaymentInfo.fromJson(json['payment'] as Map<String, dynamic>),
      status: json['status'] as String,
      statusHistory: (json['statusHistory'] as List<dynamic>?)
              ?.map((e) => StatusHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      customerNotes: json['customerNotes'] as String?,
      vendorNotes: json['vendorNotes'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      confirmedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['confirmedAt'], const TimestampConverter().fromJson),
      shippedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['shippedAt'], const TimestampConverter().fromJson),
      deliveredAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['deliveredAt'], const TimestampConverter().fromJson),
      cancelledAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['cancelledAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'customerId': instance.customerId,
      'storeId': instance.storeId,
      'items': instance.items,
      'pricing': instance.pricing,
      'customer': instance.customer,
      'delivery': instance.delivery,
      'payment': instance.payment,
      'status': instance.status,
      'statusHistory': instance.statusHistory,
      'customerNotes': instance.customerNotes,
      'vendorNotes': instance.vendorNotes,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'confirmedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.confirmedAt, const TimestampConverter().toJson),
      'shippedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.shippedAt, const TimestampConverter().toJson),
      'deliveredAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.deliveredAt, const TimestampConverter().toJson),
      'cancelledAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.cancelledAt, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      variantId: json['variantId'] as String?,
      variantName: json['variantName'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      customizations: json['customizations'] as Map<String, dynamic>?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'variantId': instance.variantId,
      'variantName': instance.variantName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'customizations': instance.customizations,
      'notes': instance.notes,
    };

_$OrderPricingImpl _$$OrderPricingImplFromJson(Map<String, dynamic> json) =>
    _$OrderPricingImpl(
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'LKR',
    );

Map<String, dynamic> _$$OrderPricingImplToJson(_$OrderPricingImpl instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'discount': instance.discount,
      'tax': instance.tax,
      'total': instance.total,
      'currency': instance.currency,
    };

_$CustomerInfoImpl _$$CustomerInfoImplFromJson(Map<String, dynamic> json) =>
    _$CustomerInfoImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CustomerInfoImplToJson(_$CustomerInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };

_$DeliveryInfoImpl _$$DeliveryInfoImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryInfoImpl(
      type: json['type'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      scheduledDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['scheduledDate'], const TimestampConverter().fromJson),
      scheduledTime: json['scheduledTime'] as String?,
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$$DeliveryInfoImplToJson(_$DeliveryInfoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'address': instance.address,
      'scheduledDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.scheduledDate, const TimestampConverter().toJson),
      'scheduledTime': instance.scheduledTime,
      'instructions': instance.instructions,
    };

_$PaymentInfoImpl _$$PaymentInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentInfoImpl(
      method: json['method'] as String,
      status: json['status'] as String,
      transactionId: json['transactionId'] as String?,
      paidAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['paidAt'], const TimestampConverter().fromJson),
      refundId: json['refundId'] as String?,
      gatewayResponse: json['gatewayResponse'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentInfoImplToJson(_$PaymentInfoImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'status': instance.status,
      'transactionId': instance.transactionId,
      'paidAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.paidAt, const TimestampConverter().toJson),
      'refundId': instance.refundId,
      'gatewayResponse': instance.gatewayResponse,
    };

_$StatusHistoryImpl _$$StatusHistoryImplFromJson(Map<String, dynamic> json) =>
    _$StatusHistoryImpl(
      status: json['status'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
      note: json['note'] as String?,
      updatedBy: json['updatedBy'] as String,
    );

Map<String, dynamic> _$$StatusHistoryImplToJson(_$StatusHistoryImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'note': instance.note,
      'updatedBy': instance.updatedBy,
    };
