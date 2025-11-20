// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  String? get variantName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customizations =>
      throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get addedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String storeId,
      String? variantId,
      String productName,
      String productImage,
      String? variantName,
      int quantity,
      double unitPrice,
      double totalPrice,
      Map<String, dynamic>? customizations,
      String? notes,
      @TimestampConverter() DateTime addedAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? storeId = null,
    Object? variantId = freezed,
    Object? productName = null,
    Object? productImage = null,
    Object? variantName = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? customizations = freezed,
    Object? notes = freezed,
    Object? addedAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      variantName: freezed == variantName
          ? _value.variantName
          : variantName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String storeId,
      String? variantId,
      String productName,
      String productImage,
      String? variantName,
      int quantity,
      double unitPrice,
      double totalPrice,
      Map<String, dynamic>? customizations,
      String? notes,
      @TimestampConverter() DateTime addedAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? storeId = null,
    Object? variantId = freezed,
    Object? productName = null,
    Object? productImage = null,
    Object? variantName = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? customizations = freezed,
    Object? notes = freezed,
    Object? addedAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CartItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      variantName: freezed == variantName
          ? _value.variantName
          : variantName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      customizations: freezed == customizations
          ? _value._customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {required this.id,
      required this.productId,
      required this.storeId,
      this.variantId,
      required this.productName,
      required this.productImage,
      this.variantName,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      final Map<String, dynamic>? customizations,
      this.notes,
      @TimestampConverter() required this.addedAt,
      @TimestampConverter() required this.updatedAt})
      : _customizations = customizations;

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String storeId;
  @override
  final String? variantId;
  @override
  final String productName;
  @override
  final String productImage;
  @override
  final String? variantName;
  @override
  final int quantity;
  @override
  final double unitPrice;
  @override
  final double totalPrice;
  final Map<String, dynamic>? _customizations;
  @override
  Map<String, dynamic>? get customizations {
    final value = _customizations;
    if (value == null) return null;
    if (_customizations is EqualUnmodifiableMapView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? notes;
  @override
  @TimestampConverter()
  final DateTime addedAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CartItem(id: $id, productId: $productId, storeId: $storeId, variantId: $variantId, productName: $productName, productImage: $productImage, variantName: $variantName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, customizations: $customizations, notes: $notes, addedAt: $addedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.variantName, variantName) ||
                other.variantName == variantName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality()
                .equals(other._customizations, _customizations) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      storeId,
      variantId,
      productName,
      productImage,
      variantName,
      quantity,
      unitPrice,
      totalPrice,
      const DeepCollectionEquality().hash(_customizations),
      notes,
      addedAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
          {required final String id,
          required final String productId,
          required final String storeId,
          final String? variantId,
          required final String productName,
          required final String productImage,
          final String? variantName,
          required final int quantity,
          required final double unitPrice,
          required final double totalPrice,
          final Map<String, dynamic>? customizations,
          final String? notes,
          @TimestampConverter() required final DateTime addedAt,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  String get storeId;
  @override
  String? get variantId;
  @override
  String get productName;
  @override
  String get productImage;
  @override
  String? get variantName;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  double get totalPrice;
  @override
  Map<String, dynamic>? get customizations;
  @override
  String? get notes;
  @override
  @TimestampConverter()
  DateTime get addedAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
