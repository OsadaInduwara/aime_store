// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequest {
  String get orderId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerEmail => throw _privateConstructorUsedError;
  String get customerPhone => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestCopyWith<PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCopyWith<$Res> {
  factory $PaymentRequestCopyWith(
          PaymentRequest value, $Res Function(PaymentRequest) then) =
      _$PaymentRequestCopyWithImpl<$Res, PaymentRequest>;
  @useResult
  $Res call(
      {String orderId,
      double amount,
      String currency,
      String customerName,
      String customerEmail,
      String customerPhone,
      String? description,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res, $Val extends PaymentRequest>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? amount = null,
    Object? currency = null,
    Object? customerName = null,
    Object? customerEmail = null,
    Object? customerPhone = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerEmail: null == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentRequestImplCopyWith<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  factory _$$PaymentRequestImplCopyWith(_$PaymentRequestImpl value,
          $Res Function(_$PaymentRequestImpl) then) =
      __$$PaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      double amount,
      String currency,
      String customerName,
      String customerEmail,
      String customerPhone,
      String? description,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PaymentRequestImplCopyWithImpl<$Res>
    extends _$PaymentRequestCopyWithImpl<$Res, _$PaymentRequestImpl>
    implements _$$PaymentRequestImplCopyWith<$Res> {
  __$$PaymentRequestImplCopyWithImpl(
      _$PaymentRequestImpl _value, $Res Function(_$PaymentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? amount = null,
    Object? currency = null,
    Object? customerName = null,
    Object? customerEmail = null,
    Object? customerPhone = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$PaymentRequestImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerEmail: null == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentRequestImpl implements _PaymentRequest {
  const _$PaymentRequestImpl(
      {required this.orderId,
      required this.amount,
      required this.currency,
      required this.customerName,
      required this.customerEmail,
      required this.customerPhone,
      this.description,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$PaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRequestImplFromJson(json);

  @override
  final String orderId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String customerName;
  @override
  final String customerEmail;
  @override
  final String customerPhone;
  @override
  final String? description;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentRequest(orderId: $orderId, amount: $amount, currency: $currency, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone, description: $description, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      amount,
      currency,
      customerName,
      customerEmail,
      customerPhone,
      description,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      __$$PaymentRequestImplCopyWithImpl<_$PaymentRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _PaymentRequest implements PaymentRequest {
  const factory _PaymentRequest(
      {required final String orderId,
      required final double amount,
      required final String currency,
      required final String customerName,
      required final String customerEmail,
      required final String customerPhone,
      final String? description,
      final Map<String, dynamic>? metadata}) = _$PaymentRequestImpl;

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$PaymentRequestImpl.fromJson;

  @override
  String get orderId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get customerName;
  @override
  String get customerEmail;
  @override
  String get customerPhone;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentResult _$PaymentResultFromJson(Map<String, dynamic> json) {
  return _PaymentResult.fromJson(json);
}

/// @nodoc
mixin _$PaymentResult {
  bool get success => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get errorCode => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentResultCopyWith<PaymentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResultCopyWith<$Res> {
  factory $PaymentResultCopyWith(
          PaymentResult value, $Res Function(PaymentResult) then) =
      _$PaymentResultCopyWithImpl<$Res, PaymentResult>;
  @useResult
  $Res call(
      {bool success,
      String? transactionId,
      String? paymentId,
      String? errorMessage,
      String? errorCode,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PaymentResultCopyWithImpl<$Res, $Val extends PaymentResult>
    implements $PaymentResultCopyWith<$Res> {
  _$PaymentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? transactionId = freezed,
    Object? paymentId = freezed,
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentResultImplCopyWith<$Res>
    implements $PaymentResultCopyWith<$Res> {
  factory _$$PaymentResultImplCopyWith(
          _$PaymentResultImpl value, $Res Function(_$PaymentResultImpl) then) =
      __$$PaymentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String? transactionId,
      String? paymentId,
      String? errorMessage,
      String? errorCode,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PaymentResultImplCopyWithImpl<$Res>
    extends _$PaymentResultCopyWithImpl<$Res, _$PaymentResultImpl>
    implements _$$PaymentResultImplCopyWith<$Res> {
  __$$PaymentResultImplCopyWithImpl(
      _$PaymentResultImpl _value, $Res Function(_$PaymentResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? transactionId = freezed,
    Object? paymentId = freezed,
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$PaymentResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentResultImpl implements _PaymentResult {
  const _$PaymentResultImpl(
      {required this.success,
      this.transactionId,
      this.paymentId,
      this.errorMessage,
      this.errorCode,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$PaymentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentResultImplFromJson(json);

  @override
  final bool success;
  @override
  final String? transactionId;
  @override
  final String? paymentId;
  @override
  final String? errorMessage;
  @override
  final String? errorCode;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentResult(success: $success, transactionId: $transactionId, paymentId: $paymentId, errorMessage: $errorMessage, errorCode: $errorCode, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      transactionId,
      paymentId,
      errorMessage,
      errorCode,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResultImplCopyWith<_$PaymentResultImpl> get copyWith =>
      __$$PaymentResultImplCopyWithImpl<_$PaymentResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentResultImplToJson(
      this,
    );
  }
}

abstract class _PaymentResult implements PaymentResult {
  const factory _PaymentResult(
      {required final bool success,
      final String? transactionId,
      final String? paymentId,
      final String? errorMessage,
      final String? errorCode,
      final Map<String, dynamic>? metadata}) = _$PaymentResultImpl;

  factory _PaymentResult.fromJson(Map<String, dynamic> json) =
      _$PaymentResultImpl.fromJson;

  @override
  bool get success;
  @override
  String? get transactionId;
  @override
  String? get paymentId;
  @override
  String? get errorMessage;
  @override
  String? get errorCode;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PaymentResultImplCopyWith<_$PaymentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefundResult _$RefundResultFromJson(Map<String, dynamic> json) {
  return _RefundResult.fromJson(json);
}

/// @nodoc
mixin _$RefundResult {
  bool get success => throw _privateConstructorUsedError;
  String? get refundId => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  double? get refundedAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefundResultCopyWith<RefundResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundResultCopyWith<$Res> {
  factory $RefundResultCopyWith(
          RefundResult value, $Res Function(RefundResult) then) =
      _$RefundResultCopyWithImpl<$Res, RefundResult>;
  @useResult
  $Res call(
      {bool success,
      String? refundId,
      String? errorMessage,
      double? refundedAmount});
}

/// @nodoc
class _$RefundResultCopyWithImpl<$Res, $Val extends RefundResult>
    implements $RefundResultCopyWith<$Res> {
  _$RefundResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? refundId = freezed,
    Object? errorMessage = freezed,
    Object? refundedAmount = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      refundId: freezed == refundId
          ? _value.refundId
          : refundId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      refundedAmount: freezed == refundedAmount
          ? _value.refundedAmount
          : refundedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefundResultImplCopyWith<$Res>
    implements $RefundResultCopyWith<$Res> {
  factory _$$RefundResultImplCopyWith(
          _$RefundResultImpl value, $Res Function(_$RefundResultImpl) then) =
      __$$RefundResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String? refundId,
      String? errorMessage,
      double? refundedAmount});
}

/// @nodoc
class __$$RefundResultImplCopyWithImpl<$Res>
    extends _$RefundResultCopyWithImpl<$Res, _$RefundResultImpl>
    implements _$$RefundResultImplCopyWith<$Res> {
  __$$RefundResultImplCopyWithImpl(
      _$RefundResultImpl _value, $Res Function(_$RefundResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? refundId = freezed,
    Object? errorMessage = freezed,
    Object? refundedAmount = freezed,
  }) {
    return _then(_$RefundResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      refundId: freezed == refundId
          ? _value.refundId
          : refundId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      refundedAmount: freezed == refundedAmount
          ? _value.refundedAmount
          : refundedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundResultImpl implements _RefundResult {
  const _$RefundResultImpl(
      {required this.success,
      this.refundId,
      this.errorMessage,
      this.refundedAmount});

  factory _$RefundResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundResultImplFromJson(json);

  @override
  final bool success;
  @override
  final String? refundId;
  @override
  final String? errorMessage;
  @override
  final double? refundedAmount;

  @override
  String toString() {
    return 'RefundResult(success: $success, refundId: $refundId, errorMessage: $errorMessage, refundedAmount: $refundedAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.refundId, refundId) ||
                other.refundId == refundId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.refundedAmount, refundedAmount) ||
                other.refundedAmount == refundedAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, refundId, errorMessage, refundedAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundResultImplCopyWith<_$RefundResultImpl> get copyWith =>
      __$$RefundResultImplCopyWithImpl<_$RefundResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundResultImplToJson(
      this,
    );
  }
}

abstract class _RefundResult implements RefundResult {
  const factory _RefundResult(
      {required final bool success,
      final String? refundId,
      final String? errorMessage,
      final double? refundedAmount}) = _$RefundResultImpl;

  factory _RefundResult.fromJson(Map<String, dynamic> json) =
      _$RefundResultImpl.fromJson;

  @override
  bool get success;
  @override
  String? get refundId;
  @override
  String? get errorMessage;
  @override
  double? get refundedAmount;
  @override
  @JsonKey(ignore: true)
  _$$RefundResultImplCopyWith<_$RefundResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get paymentGateway => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String userId,
      double amount,
      String currency,
      String paymentMethod,
      String status,
      String? transactionId,
      String? paymentGateway,
      String? errorMessage,
      DateTime createdAt,
      DateTime? completedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? userId = null,
    Object? amount = null,
    Object? currency = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? transactionId = freezed,
    Object? paymentGateway = freezed,
    Object? errorMessage = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGateway: freezed == paymentGateway
          ? _value.paymentGateway
          : paymentGateway // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String userId,
      double amount,
      String currency,
      String paymentMethod,
      String status,
      String? transactionId,
      String? paymentGateway,
      String? errorMessage,
      DateTime createdAt,
      DateTime? completedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? userId = null,
    Object? amount = null,
    Object? currency = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? transactionId = freezed,
    Object? paymentGateway = freezed,
    Object? errorMessage = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$TransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGateway: freezed == paymentGateway
          ? _value.paymentGateway
          : paymentGateway // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {required this.id,
      required this.orderId,
      required this.userId,
      required this.amount,
      required this.currency,
      required this.paymentMethod,
      required this.status,
      this.transactionId,
      this.paymentGateway,
      this.errorMessage,
      required this.createdAt,
      this.completedAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String userId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String paymentMethod;
  @override
  final String status;
  @override
  final String? transactionId;
  @override
  final String? paymentGateway;
  @override
  final String? errorMessage;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'TransactionModel(id: $id, orderId: $orderId, userId: $userId, amount: $amount, currency: $currency, paymentMethod: $paymentMethod, status: $status, transactionId: $transactionId, paymentGateway: $paymentGateway, errorMessage: $errorMessage, createdAt: $createdAt, completedAt: $completedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      userId,
      amount,
      currency,
      paymentMethod,
      status,
      transactionId,
      paymentGateway,
      errorMessage,
      createdAt,
      completedAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
      {required final String id,
      required final String orderId,
      required final String userId,
      required final double amount,
      required final String currency,
      required final String paymentMethod,
      required final String status,
      final String? transactionId,
      final String? paymentGateway,
      final String? errorMessage,
      required final DateTime createdAt,
      final DateTime? completedAt,
      final Map<String, dynamic>? metadata}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get userId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get paymentMethod;
  @override
  String get status;
  @override
  String? get transactionId;
  @override
  String? get paymentGateway;
  @override
  String? get errorMessage;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
