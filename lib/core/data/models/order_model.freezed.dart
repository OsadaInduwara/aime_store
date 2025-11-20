// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  OrderPricing get pricing => throw _privateConstructorUsedError;
  CustomerInfo get customer => throw _privateConstructorUsedError;
  DeliveryInfo get delivery => throw _privateConstructorUsedError;
  PaymentInfo get payment => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<StatusHistory> get statusHistory => throw _privateConstructorUsedError;
  String? get customerNotes => throw _privateConstructorUsedError;
  String? get vendorNotes => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get shippedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get cancelledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String storeId,
      List<OrderItem> items,
      OrderPricing pricing,
      CustomerInfo customer,
      DeliveryInfo delivery,
      PaymentInfo payment,
      String status,
      List<StatusHistory> statusHistory,
      String? customerNotes,
      String? vendorNotes,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? confirmedAt,
      @TimestampConverter() DateTime? shippedAt,
      @TimestampConverter() DateTime? deliveredAt,
      @TimestampConverter() DateTime? cancelledAt});

  $OrderPricingCopyWith<$Res> get pricing;
  $CustomerInfoCopyWith<$Res> get customer;
  $DeliveryInfoCopyWith<$Res> get delivery;
  $PaymentInfoCopyWith<$Res> get payment;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? storeId = null,
    Object? items = null,
    Object? pricing = null,
    Object? customer = null,
    Object? delivery = null,
    Object? payment = null,
    Object? status = null,
    Object? statusHistory = null,
    Object? customerNotes = freezed,
    Object? vendorNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? confirmedAt = freezed,
    Object? shippedAt = freezed,
    Object? deliveredAt = freezed,
    Object? cancelledAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as OrderPricing,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as DeliveryInfo,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<StatusHistory>,
      customerNotes: freezed == customerNotes
          ? _value.customerNotes
          : customerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorNotes: freezed == vendorNotes
          ? _value.vendorNotes
          : vendorNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippedAt: freezed == shippedAt
          ? _value.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderPricingCopyWith<$Res> get pricing {
    return $OrderPricingCopyWith<$Res>(_value.pricing, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerInfoCopyWith<$Res> get customer {
    return $CustomerInfoCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryInfoCopyWith<$Res> get delivery {
    return $DeliveryInfoCopyWith<$Res>(_value.delivery, (value) {
      return _then(_value.copyWith(delivery: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get payment {
    return $PaymentInfoCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerId,
      String storeId,
      List<OrderItem> items,
      OrderPricing pricing,
      CustomerInfo customer,
      DeliveryInfo delivery,
      PaymentInfo payment,
      String status,
      List<StatusHistory> statusHistory,
      String? customerNotes,
      String? vendorNotes,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? confirmedAt,
      @TimestampConverter() DateTime? shippedAt,
      @TimestampConverter() DateTime? deliveredAt,
      @TimestampConverter() DateTime? cancelledAt});

  @override
  $OrderPricingCopyWith<$Res> get pricing;
  @override
  $CustomerInfoCopyWith<$Res> get customer;
  @override
  $DeliveryInfoCopyWith<$Res> get delivery;
  @override
  $PaymentInfoCopyWith<$Res> get payment;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerId = null,
    Object? storeId = null,
    Object? items = null,
    Object? pricing = null,
    Object? customer = null,
    Object? delivery = null,
    Object? payment = null,
    Object? status = null,
    Object? statusHistory = null,
    Object? customerNotes = freezed,
    Object? vendorNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? confirmedAt = freezed,
    Object? shippedAt = freezed,
    Object? deliveredAt = freezed,
    Object? cancelledAt = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as OrderPricing,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as DeliveryInfo,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusHistory: null == statusHistory
          ? _value._statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<StatusHistory>,
      customerNotes: freezed == customerNotes
          ? _value.customerNotes
          : customerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorNotes: freezed == vendorNotes
          ? _value.vendorNotes
          : vendorNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippedAt: freezed == shippedAt
          ? _value.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      required this.orderNumber,
      required this.customerId,
      required this.storeId,
      required final List<OrderItem> items,
      required this.pricing,
      required this.customer,
      required this.delivery,
      required this.payment,
      required this.status,
      final List<StatusHistory> statusHistory = const [],
      this.customerNotes,
      this.vendorNotes,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      @TimestampConverter() this.confirmedAt,
      @TimestampConverter() this.shippedAt,
      @TimestampConverter() this.deliveredAt,
      @TimestampConverter() this.cancelledAt})
      : _items = items,
        _statusHistory = statusHistory;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String customerId;
  @override
  final String storeId;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final OrderPricing pricing;
  @override
  final CustomerInfo customer;
  @override
  final DeliveryInfo delivery;
  @override
  final PaymentInfo payment;
  @override
  final String status;
  final List<StatusHistory> _statusHistory;
  @override
  @JsonKey()
  List<StatusHistory> get statusHistory {
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusHistory);
  }

  @override
  final String? customerNotes;
  @override
  final String? vendorNotes;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  @TimestampConverter()
  final DateTime? confirmedAt;
  @override
  @TimestampConverter()
  final DateTime? shippedAt;
  @override
  @TimestampConverter()
  final DateTime? deliveredAt;
  @override
  @TimestampConverter()
  final DateTime? cancelledAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, customerId: $customerId, storeId: $storeId, items: $items, pricing: $pricing, customer: $customer, delivery: $delivery, payment: $payment, status: $status, statusHistory: $statusHistory, customerNotes: $customerNotes, vendorNotes: $vendorNotes, createdAt: $createdAt, updatedAt: $updatedAt, confirmedAt: $confirmedAt, shippedAt: $shippedAt, deliveredAt: $deliveredAt, cancelledAt: $cancelledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._statusHistory, _statusHistory) &&
            (identical(other.customerNotes, customerNotes) ||
                other.customerNotes == customerNotes) &&
            (identical(other.vendorNotes, vendorNotes) ||
                other.vendorNotes == vendorNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.shippedAt, shippedAt) ||
                other.shippedAt == shippedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderNumber,
        customerId,
        storeId,
        const DeepCollectionEquality().hash(_items),
        pricing,
        customer,
        delivery,
        payment,
        status,
        const DeepCollectionEquality().hash(_statusHistory),
        customerNotes,
        vendorNotes,
        createdAt,
        updatedAt,
        confirmedAt,
        shippedAt,
        deliveredAt,
        cancelledAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final String id,
      required final String orderNumber,
      required final String customerId,
      required final String storeId,
      required final List<OrderItem> items,
      required final OrderPricing pricing,
      required final CustomerInfo customer,
      required final DeliveryInfo delivery,
      required final PaymentInfo payment,
      required final String status,
      final List<StatusHistory> statusHistory,
      final String? customerNotes,
      final String? vendorNotes,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt,
      @TimestampConverter() final DateTime? confirmedAt,
      @TimestampConverter() final DateTime? shippedAt,
      @TimestampConverter() final DateTime? deliveredAt,
      @TimestampConverter() final DateTime? cancelledAt}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get orderNumber;
  @override
  String get customerId;
  @override
  String get storeId;
  @override
  List<OrderItem> get items;
  @override
  OrderPricing get pricing;
  @override
  CustomerInfo get customer;
  @override
  DeliveryInfo get delivery;
  @override
  PaymentInfo get payment;
  @override
  String get status;
  @override
  List<StatusHistory> get statusHistory;
  @override
  String? get customerNotes;
  @override
  String? get vendorNotes;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @TimestampConverter()
  DateTime? get confirmedAt;
  @override
  @TimestampConverter()
  DateTime? get shippedAt;
  @override
  @TimestampConverter()
  DateTime? get deliveredAt;
  @override
  @TimestampConverter()
  DateTime? get cancelledAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  String? get variantName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customizations =>
      throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String? variantId,
      String? variantName,
      int quantity,
      double unitPrice,
      double totalPrice,
      Map<String, dynamic>? customizations,
      String? notes});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? variantId = freezed,
    Object? variantName = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? customizations = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String? variantId,
      String? variantName,
      int quantity,
      double unitPrice,
      double totalPrice,
      Map<String, dynamic>? customizations,
      String? notes});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? variantId = freezed,
    Object? variantName = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? customizations = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$OrderItemImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.productId,
      required this.productName,
      required this.productImage,
      this.variantId,
      this.variantName,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      final Map<String, dynamic>? customizations,
      this.notes})
      : _customizations = customizations;

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String productId;
  @override
  final String productName;
  @override
  final String productImage;
  @override
  final String? variantId;
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
  String toString() {
    return 'OrderItem(productId: $productId, productName: $productName, productImage: $productImage, variantId: $variantId, variantName: $variantName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, customizations: $customizations, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
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
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      productImage,
      variantId,
      variantName,
      quantity,
      unitPrice,
      totalPrice,
      const DeepCollectionEquality().hash(_customizations),
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String productId,
      required final String productName,
      required final String productImage,
      final String? variantId,
      final String? variantName,
      required final int quantity,
      required final double unitPrice,
      required final double totalPrice,
      final Map<String, dynamic>? customizations,
      final String? notes}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get productId;
  @override
  String get productName;
  @override
  String get productImage;
  @override
  String? get variantId;
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
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderPricing _$OrderPricingFromJson(Map<String, dynamic> json) {
  return _OrderPricing.fromJson(json);
}

/// @nodoc
mixin _$OrderPricing {
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPricingCopyWith<OrderPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPricingCopyWith<$Res> {
  factory $OrderPricingCopyWith(
          OrderPricing value, $Res Function(OrderPricing) then) =
      _$OrderPricingCopyWithImpl<$Res, OrderPricing>;
  @useResult
  $Res call(
      {double subtotal,
      double deliveryFee,
      double discount,
      double tax,
      double total,
      String currency});
}

/// @nodoc
class _$OrderPricingCopyWithImpl<$Res, $Val extends OrderPricing>
    implements $OrderPricingCopyWith<$Res> {
  _$OrderPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? tax = null,
    Object? total = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPricingImplCopyWith<$Res>
    implements $OrderPricingCopyWith<$Res> {
  factory _$$OrderPricingImplCopyWith(
          _$OrderPricingImpl value, $Res Function(_$OrderPricingImpl) then) =
      __$$OrderPricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double subtotal,
      double deliveryFee,
      double discount,
      double tax,
      double total,
      String currency});
}

/// @nodoc
class __$$OrderPricingImplCopyWithImpl<$Res>
    extends _$OrderPricingCopyWithImpl<$Res, _$OrderPricingImpl>
    implements _$$OrderPricingImplCopyWith<$Res> {
  __$$OrderPricingImplCopyWithImpl(
      _$OrderPricingImpl _value, $Res Function(_$OrderPricingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? tax = null,
    Object? total = null,
    Object? currency = null,
  }) {
    return _then(_$OrderPricingImpl(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPricingImpl implements _OrderPricing {
  const _$OrderPricingImpl(
      {required this.subtotal,
      required this.deliveryFee,
      this.discount = 0.0,
      this.tax = 0.0,
      required this.total,
      this.currency = 'LKR'});

  factory _$OrderPricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPricingImplFromJson(json);

  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double tax;
  @override
  final double total;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'OrderPricing(subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, tax: $tax, total: $total, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPricingImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, subtotal, deliveryFee, discount, tax, total, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPricingImplCopyWith<_$OrderPricingImpl> get copyWith =>
      __$$OrderPricingImplCopyWithImpl<_$OrderPricingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPricingImplToJson(
      this,
    );
  }
}

abstract class _OrderPricing implements OrderPricing {
  const factory _OrderPricing(
      {required final double subtotal,
      required final double deliveryFee,
      final double discount,
      final double tax,
      required final double total,
      final String currency}) = _$OrderPricingImpl;

  factory _OrderPricing.fromJson(Map<String, dynamic> json) =
      _$OrderPricingImpl.fromJson;

  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get discount;
  @override
  double get tax;
  @override
  double get total;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$OrderPricingImplCopyWith<_$OrderPricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) {
  return _CustomerInfo.fromJson(json);
}

/// @nodoc
mixin _$CustomerInfo {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInfoCopyWith<CustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInfoCopyWith<$Res> {
  factory $CustomerInfoCopyWith(
          CustomerInfo value, $Res Function(CustomerInfo) then) =
      _$CustomerInfoCopyWithImpl<$Res, CustomerInfo>;
  @useResult
  $Res call({String name, String phoneNumber, String? email});
}

/// @nodoc
class _$CustomerInfoCopyWithImpl<$Res, $Val extends CustomerInfo>
    implements $CustomerInfoCopyWith<$Res> {
  _$CustomerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInfoImplCopyWith<$Res>
    implements $CustomerInfoCopyWith<$Res> {
  factory _$$CustomerInfoImplCopyWith(
          _$CustomerInfoImpl value, $Res Function(_$CustomerInfoImpl) then) =
      __$$CustomerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phoneNumber, String? email});
}

/// @nodoc
class __$$CustomerInfoImplCopyWithImpl<$Res>
    extends _$CustomerInfoCopyWithImpl<$Res, _$CustomerInfoImpl>
    implements _$$CustomerInfoImplCopyWith<$Res> {
  __$$CustomerInfoImplCopyWithImpl(
      _$CustomerInfoImpl _value, $Res Function(_$CustomerInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
  }) {
    return _then(_$CustomerInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInfoImpl implements _CustomerInfo {
  const _$CustomerInfoImpl(
      {required this.name, required this.phoneNumber, this.email});

  factory _$CustomerInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String? email;

  @override
  String toString() {
    return 'CustomerInfo(name: $name, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInfoImplCopyWith<_$CustomerInfoImpl> get copyWith =>
      __$$CustomerInfoImplCopyWithImpl<_$CustomerInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInfoImplToJson(
      this,
    );
  }
}

abstract class _CustomerInfo implements CustomerInfo {
  const factory _CustomerInfo(
      {required final String name,
      required final String phoneNumber,
      final String? email}) = _$CustomerInfoImpl;

  factory _CustomerInfo.fromJson(Map<String, dynamic> json) =
      _$CustomerInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInfoImplCopyWith<_$CustomerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) {
  return _DeliveryInfo.fromJson(json);
}

/// @nodoc
mixin _$DeliveryInfo {
  String get type =>
      throw _privateConstructorUsedError; // 'self_pickup' | 'home_delivery'
  Address? get address => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get scheduledDate => throw _privateConstructorUsedError;
  String? get scheduledTime => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryInfoCopyWith<DeliveryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryInfoCopyWith<$Res> {
  factory $DeliveryInfoCopyWith(
          DeliveryInfo value, $Res Function(DeliveryInfo) then) =
      _$DeliveryInfoCopyWithImpl<$Res, DeliveryInfo>;
  @useResult
  $Res call(
      {String type,
      Address? address,
      @TimestampConverter() DateTime? scheduledDate,
      String? scheduledTime,
      String? instructions});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$DeliveryInfoCopyWithImpl<$Res, $Val extends DeliveryInfo>
    implements $DeliveryInfoCopyWith<$Res> {
  _$DeliveryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = freezed,
    Object? scheduledDate = freezed,
    Object? scheduledTime = freezed,
    Object? instructions = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryInfoImplCopyWith<$Res>
    implements $DeliveryInfoCopyWith<$Res> {
  factory _$$DeliveryInfoImplCopyWith(
          _$DeliveryInfoImpl value, $Res Function(_$DeliveryInfoImpl) then) =
      __$$DeliveryInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      Address? address,
      @TimestampConverter() DateTime? scheduledDate,
      String? scheduledTime,
      String? instructions});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$DeliveryInfoImplCopyWithImpl<$Res>
    extends _$DeliveryInfoCopyWithImpl<$Res, _$DeliveryInfoImpl>
    implements _$$DeliveryInfoImplCopyWith<$Res> {
  __$$DeliveryInfoImplCopyWithImpl(
      _$DeliveryInfoImpl _value, $Res Function(_$DeliveryInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = freezed,
    Object? scheduledDate = freezed,
    Object? scheduledTime = freezed,
    Object? instructions = freezed,
  }) {
    return _then(_$DeliveryInfoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryInfoImpl implements _DeliveryInfo {
  const _$DeliveryInfoImpl(
      {required this.type,
      this.address,
      @TimestampConverter() this.scheduledDate,
      this.scheduledTime,
      this.instructions});

  factory _$DeliveryInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryInfoImplFromJson(json);

  @override
  final String type;
// 'self_pickup' | 'home_delivery'
  @override
  final Address? address;
  @override
  @TimestampConverter()
  final DateTime? scheduledDate;
  @override
  final String? scheduledTime;
  @override
  final String? instructions;

  @override
  String toString() {
    return 'DeliveryInfo(type: $type, address: $address, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryInfoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, address, scheduledDate, scheduledTime, instructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryInfoImplCopyWith<_$DeliveryInfoImpl> get copyWith =>
      __$$DeliveryInfoImplCopyWithImpl<_$DeliveryInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryInfoImplToJson(
      this,
    );
  }
}

abstract class _DeliveryInfo implements DeliveryInfo {
  const factory _DeliveryInfo(
      {required final String type,
      final Address? address,
      @TimestampConverter() final DateTime? scheduledDate,
      final String? scheduledTime,
      final String? instructions}) = _$DeliveryInfoImpl;

  factory _DeliveryInfo.fromJson(Map<String, dynamic> json) =
      _$DeliveryInfoImpl.fromJson;

  @override
  String get type;
  @override // 'self_pickup' | 'home_delivery'
  Address? get address;
  @override
  @TimestampConverter()
  DateTime? get scheduledDate;
  @override
  String? get scheduledTime;
  @override
  String? get instructions;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryInfoImplCopyWith<_$DeliveryInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfo {
  String get method => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get paidAt => throw _privateConstructorUsedError;
  String? get refundId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get gatewayResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call(
      {String method,
      String status,
      String? transactionId,
      @TimestampConverter() DateTime? paidAt,
      String? refundId,
      Map<String, dynamic>? gatewayResponse});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? status = null,
    Object? transactionId = freezed,
    Object? paidAt = freezed,
    Object? refundId = freezed,
    Object? gatewayResponse = freezed,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refundId: freezed == refundId
          ? _value.refundId
          : refundId // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayResponse: freezed == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentInfoImplCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$PaymentInfoImplCopyWith(
          _$PaymentInfoImpl value, $Res Function(_$PaymentInfoImpl) then) =
      __$$PaymentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String method,
      String status,
      String? transactionId,
      @TimestampConverter() DateTime? paidAt,
      String? refundId,
      Map<String, dynamic>? gatewayResponse});
}

/// @nodoc
class __$$PaymentInfoImplCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$PaymentInfoImpl>
    implements _$$PaymentInfoImplCopyWith<$Res> {
  __$$PaymentInfoImplCopyWithImpl(
      _$PaymentInfoImpl _value, $Res Function(_$PaymentInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? status = null,
    Object? transactionId = freezed,
    Object? paidAt = freezed,
    Object? refundId = freezed,
    Object? gatewayResponse = freezed,
  }) {
    return _then(_$PaymentInfoImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refundId: freezed == refundId
          ? _value.refundId
          : refundId // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayResponse: freezed == gatewayResponse
          ? _value._gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInfoImpl implements _PaymentInfo {
  const _$PaymentInfoImpl(
      {required this.method,
      required this.status,
      this.transactionId,
      @TimestampConverter() this.paidAt,
      this.refundId,
      final Map<String, dynamic>? gatewayResponse})
      : _gatewayResponse = gatewayResponse;

  factory _$PaymentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoImplFromJson(json);

  @override
  final String method;
  @override
  final String status;
  @override
  final String? transactionId;
  @override
  @TimestampConverter()
  final DateTime? paidAt;
  @override
  final String? refundId;
  final Map<String, dynamic>? _gatewayResponse;
  @override
  Map<String, dynamic>? get gatewayResponse {
    final value = _gatewayResponse;
    if (value == null) return null;
    if (_gatewayResponse is EqualUnmodifiableMapView) return _gatewayResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentInfo(method: $method, status: $status, transactionId: $transactionId, paidAt: $paidAt, refundId: $refundId, gatewayResponse: $gatewayResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.refundId, refundId) ||
                other.refundId == refundId) &&
            const DeepCollectionEquality()
                .equals(other._gatewayResponse, _gatewayResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, method, status, transactionId,
      paidAt, refundId, const DeepCollectionEquality().hash(_gatewayResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      __$$PaymentInfoImplCopyWithImpl<_$PaymentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  const factory _PaymentInfo(
      {required final String method,
      required final String status,
      final String? transactionId,
      @TimestampConverter() final DateTime? paidAt,
      final String? refundId,
      final Map<String, dynamic>? gatewayResponse}) = _$PaymentInfoImpl;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoImpl.fromJson;

  @override
  String get method;
  @override
  String get status;
  @override
  String? get transactionId;
  @override
  @TimestampConverter()
  DateTime? get paidAt;
  @override
  String? get refundId;
  @override
  Map<String, dynamic>? get gatewayResponse;
  @override
  @JsonKey(ignore: true)
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusHistory _$StatusHistoryFromJson(Map<String, dynamic> json) {
  return _StatusHistory.fromJson(json);
}

/// @nodoc
mixin _$StatusHistory {
  String get status => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusHistoryCopyWith<StatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusHistoryCopyWith<$Res> {
  factory $StatusHistoryCopyWith(
          StatusHistory value, $Res Function(StatusHistory) then) =
      _$StatusHistoryCopyWithImpl<$Res, StatusHistory>;
  @useResult
  $Res call(
      {String status,
      @TimestampConverter() DateTime timestamp,
      String? note,
      String updatedBy});
}

/// @nodoc
class _$StatusHistoryCopyWithImpl<$Res, $Val extends StatusHistory>
    implements $StatusHistoryCopyWith<$Res> {
  _$StatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? updatedBy = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusHistoryImplCopyWith<$Res>
    implements $StatusHistoryCopyWith<$Res> {
  factory _$$StatusHistoryImplCopyWith(
          _$StatusHistoryImpl value, $Res Function(_$StatusHistoryImpl) then) =
      __$$StatusHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      @TimestampConverter() DateTime timestamp,
      String? note,
      String updatedBy});
}

/// @nodoc
class __$$StatusHistoryImplCopyWithImpl<$Res>
    extends _$StatusHistoryCopyWithImpl<$Res, _$StatusHistoryImpl>
    implements _$$StatusHistoryImplCopyWith<$Res> {
  __$$StatusHistoryImplCopyWithImpl(
      _$StatusHistoryImpl _value, $Res Function(_$StatusHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? updatedBy = null,
  }) {
    return _then(_$StatusHistoryImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusHistoryImpl implements _StatusHistory {
  const _$StatusHistoryImpl(
      {required this.status,
      @TimestampConverter() required this.timestamp,
      this.note,
      required this.updatedBy});

  factory _$StatusHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusHistoryImplFromJson(json);

  @override
  final String status;
  @override
  @TimestampConverter()
  final DateTime timestamp;
  @override
  final String? note;
  @override
  final String updatedBy;

  @override
  String toString() {
    return 'StatusHistory(status: $status, timestamp: $timestamp, note: $note, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusHistoryImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, timestamp, note, updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusHistoryImplCopyWith<_$StatusHistoryImpl> get copyWith =>
      __$$StatusHistoryImplCopyWithImpl<_$StatusHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusHistoryImplToJson(
      this,
    );
  }
}

abstract class _StatusHistory implements StatusHistory {
  const factory _StatusHistory(
      {required final String status,
      @TimestampConverter() required final DateTime timestamp,
      final String? note,
      required final String updatedBy}) = _$StatusHistoryImpl;

  factory _StatusHistory.fromJson(Map<String, dynamic> json) =
      _$StatusHistoryImpl.fromJson;

  @override
  String get status;
  @override
  @TimestampConverter()
  DateTime get timestamp;
  @override
  String? get note;
  @override
  String get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$StatusHistoryImplCopyWith<_$StatusHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
