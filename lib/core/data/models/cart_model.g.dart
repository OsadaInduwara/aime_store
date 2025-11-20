// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      storeId: json['storeId'] as String,
      variantId: json['variantId'] as String?,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      variantName: json['variantName'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      customizations: json['customizations'] as Map<String, dynamic>?,
      notes: json['notes'] as String?,
      addedAt:
          const TimestampConverter().fromJson(json['addedAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'storeId': instance.storeId,
      'variantId': instance.variantId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'variantName': instance.variantName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'customizations': instance.customizations,
      'notes': instance.notes,
      'addedAt': const TimestampConverter().toJson(instance.addedAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
