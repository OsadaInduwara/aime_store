// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return _BannerModel.fromJson(json);
}

/// @nodoc
mixin _$BannerModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get actionType =>
      throw _privateConstructorUsedError; // 'product', 'category', 'store', 'external'
  bool get isActive => throw _privateConstructorUsedError;
  int get displayOrder => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerModelCopyWith<BannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerModelCopyWith<$Res> {
  factory $BannerModelCopyWith(
          BannerModel value, $Res Function(BannerModel) then) =
      _$BannerModelCopyWithImpl<$Res, BannerModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String imageUrl,
      String? actionUrl,
      String? actionType,
      bool isActive,
      int displayOrder,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? expiresAt});
}

/// @nodoc
class _$BannerModelCopyWithImpl<$Res, $Val extends BannerModel>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = null,
    Object? actionUrl = freezed,
    Object? actionType = freezed,
    Object? isActive = null,
    Object? displayOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionType: freezed == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerModelImplCopyWith<$Res>
    implements $BannerModelCopyWith<$Res> {
  factory _$$BannerModelImplCopyWith(
          _$BannerModelImpl value, $Res Function(_$BannerModelImpl) then) =
      __$$BannerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String imageUrl,
      String? actionUrl,
      String? actionType,
      bool isActive,
      int displayOrder,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? expiresAt});
}

/// @nodoc
class __$$BannerModelImplCopyWithImpl<$Res>
    extends _$BannerModelCopyWithImpl<$Res, _$BannerModelImpl>
    implements _$$BannerModelImplCopyWith<$Res> {
  __$$BannerModelImplCopyWithImpl(
      _$BannerModelImpl _value, $Res Function(_$BannerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = null,
    Object? actionUrl = freezed,
    Object? actionType = freezed,
    Object? isActive = null,
    Object? displayOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$BannerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionType: freezed == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerModelImpl implements _BannerModel {
  const _$BannerModelImpl(
      {required this.id,
      required this.title,
      this.description,
      required this.imageUrl,
      this.actionUrl,
      this.actionType,
      this.isActive = true,
      this.displayOrder = 0,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      @TimestampConverter() this.expiresAt});

  factory _$BannerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String imageUrl;
  @override
  final String? actionUrl;
  @override
  final String? actionType;
// 'product', 'category', 'store', 'external'
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int displayOrder;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  @TimestampConverter()
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'BannerModel(id: $id, title: $title, description: $description, imageUrl: $imageUrl, actionUrl: $actionUrl, actionType: $actionType, isActive: $isActive, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      actionUrl,
      actionType,
      isActive,
      displayOrder,
      createdAt,
      updatedAt,
      expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerModelImplCopyWith<_$BannerModelImpl> get copyWith =>
      __$$BannerModelImplCopyWithImpl<_$BannerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerModelImplToJson(
      this,
    );
  }
}

abstract class _BannerModel implements BannerModel {
  const factory _BannerModel(
      {required final String id,
      required final String title,
      final String? description,
      required final String imageUrl,
      final String? actionUrl,
      final String? actionType,
      final bool isActive,
      final int displayOrder,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt,
      @TimestampConverter() final DateTime? expiresAt}) = _$BannerModelImpl;

  factory _BannerModel.fromJson(Map<String, dynamic> json) =
      _$BannerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get imageUrl;
  @override
  String? get actionUrl;
  @override
  String? get actionType;
  @override // 'product', 'category', 'store', 'external'
  bool get isActive;
  @override
  int get displayOrder;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @TimestampConverter()
  DateTime? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$BannerModelImplCopyWith<_$BannerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
