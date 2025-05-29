// lib/core/models/cart_model.dart
import 'package:aime_store/core/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required String productId,
    required String storeId,
    String? variantId,
    required String productName,
    required String productImage,
    String? variantName,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    Map<String, dynamic>? customizations,
    String? notes,
    @TimestampConverter() required DateTime addedAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}