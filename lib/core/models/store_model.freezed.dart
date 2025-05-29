// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  String get businessType => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get subCategories => throw _privateConstructorUsedError;
  ContactInfo get contactInfo => throw _privateConstructorUsedError;
  StoreLocation get location => throw _privateConstructorUsedError;
  StoreSettings get settings => throw _privateConstructorUsedError;
  StoreCustomization get customization => throw _privateConstructorUsedError;
  StoreStats get stats => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get verifiedAt => throw _privateConstructorUsedError;

  /// Serializes this StoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String storeName,
      String description,
      String? logo,
      String? coverImage,
      String businessType,
      String category,
      List<String> subCategories,
      ContactInfo contactInfo,
      StoreLocation location,
      StoreSettings settings,
      StoreCustomization customization,
      StoreStats stats,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? verifiedAt});

  $ContactInfoCopyWith<$Res> get contactInfo;
  $StoreLocationCopyWith<$Res> get location;
  $StoreSettingsCopyWith<$Res> get settings;
  $StoreCustomizationCopyWith<$Res> get customization;
  $StoreStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? storeName = null,
    Object? description = null,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? businessType = null,
    Object? category = null,
    Object? subCategories = null,
    Object? contactInfo = null,
    Object? location = null,
    Object? settings = null,
    Object? customization = null,
    Object? stats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategories: null == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactInfo: null == contactInfo
          ? _value.contactInfo
          : contactInfo // ignore: cast_nullable_to_non_nullable
              as ContactInfo,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as StoreLocation,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as StoreSettings,
      customization: null == customization
          ? _value.customization
          : customization // ignore: cast_nullable_to_non_nullable
              as StoreCustomization,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StoreStats,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactInfoCopyWith<$Res> get contactInfo {
    return $ContactInfoCopyWith<$Res>(_value.contactInfo, (value) {
      return _then(_value.copyWith(contactInfo: value) as $Val);
    });
  }

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoreLocationCopyWith<$Res> get location {
    return $StoreLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoreSettingsCopyWith<$Res> get settings {
    return $StoreSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoreCustomizationCopyWith<$Res> get customization {
    return $StoreCustomizationCopyWith<$Res>(_value.customization, (value) {
      return _then(_value.copyWith(customization: value) as $Val);
    });
  }

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoreStatsCopyWith<$Res> get stats {
    return $StoreStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreModelImplCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$StoreModelImplCopyWith(
          _$StoreModelImpl value, $Res Function(_$StoreModelImpl) then) =
      __$$StoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String storeName,
      String description,
      String? logo,
      String? coverImage,
      String businessType,
      String category,
      List<String> subCategories,
      ContactInfo contactInfo,
      StoreLocation location,
      StoreSettings settings,
      StoreCustomization customization,
      StoreStats stats,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? verifiedAt});

  @override
  $ContactInfoCopyWith<$Res> get contactInfo;
  @override
  $StoreLocationCopyWith<$Res> get location;
  @override
  $StoreSettingsCopyWith<$Res> get settings;
  @override
  $StoreCustomizationCopyWith<$Res> get customization;
  @override
  $StoreStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$StoreModelImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreModelImpl>
    implements _$$StoreModelImplCopyWith<$Res> {
  __$$StoreModelImplCopyWithImpl(
      _$StoreModelImpl _value, $Res Function(_$StoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? storeName = null,
    Object? description = null,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? businessType = null,
    Object? category = null,
    Object? subCategories = null,
    Object? contactInfo = null,
    Object? location = null,
    Object? settings = null,
    Object? customization = null,
    Object? stats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(_$StoreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategories: null == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactInfo: null == contactInfo
          ? _value.contactInfo
          : contactInfo // ignore: cast_nullable_to_non_nullable
              as ContactInfo,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as StoreLocation,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as StoreSettings,
      customization: null == customization
          ? _value.customization
          : customization // ignore: cast_nullable_to_non_nullable
              as StoreCustomization,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StoreStats,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreModelImpl implements _StoreModel {
  const _$StoreModelImpl(
      {required this.id,
      required this.ownerId,
      required this.storeName,
      required this.description,
      this.logo,
      this.coverImage,
      required this.businessType,
      required this.category,
      final List<String> subCategories = const [],
      required this.contactInfo,
      required this.location,
      required this.settings,
      required this.customization,
      required this.stats,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      @TimestampConverter() this.verifiedAt})
      : _subCategories = subCategories;

  factory _$StoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreModelImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String storeName;
  @override
  final String description;
  @override
  final String? logo;
  @override
  final String? coverImage;
  @override
  final String businessType;
  @override
  final String category;
  final List<String> _subCategories;
  @override
  @JsonKey()
  List<String> get subCategories {
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategories);
  }

  @override
  final ContactInfo contactInfo;
  @override
  final StoreLocation location;
  @override
  final StoreSettings settings;
  @override
  final StoreCustomization customization;
  @override
  final StoreStats stats;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  @TimestampConverter()
  final DateTime? verifiedAt;

  @override
  String toString() {
    return 'StoreModel(id: $id, ownerId: $ownerId, storeName: $storeName, description: $description, logo: $logo, coverImage: $coverImage, businessType: $businessType, category: $category, subCategories: $subCategories, contactInfo: $contactInfo, location: $location, settings: $settings, customization: $customization, stats: $stats, createdAt: $createdAt, updatedAt: $updatedAt, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.businessType, businessType) ||
                other.businessType == businessType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories) &&
            (identical(other.contactInfo, contactInfo) ||
                other.contactInfo == contactInfo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.customization, customization) ||
                other.customization == customization) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      storeName,
      description,
      logo,
      coverImage,
      businessType,
      category,
      const DeepCollectionEquality().hash(_subCategories),
      contactInfo,
      location,
      settings,
      customization,
      stats,
      createdAt,
      updatedAt,
      verifiedAt);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      __$$StoreModelImplCopyWithImpl<_$StoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreModelImplToJson(
      this,
    );
  }
}

abstract class _StoreModel implements StoreModel {
  const factory _StoreModel(
      {required final String id,
      required final String ownerId,
      required final String storeName,
      required final String description,
      final String? logo,
      final String? coverImage,
      required final String businessType,
      required final String category,
      final List<String> subCategories,
      required final ContactInfo contactInfo,
      required final StoreLocation location,
      required final StoreSettings settings,
      required final StoreCustomization customization,
      required final StoreStats stats,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt,
      @TimestampConverter() final DateTime? verifiedAt}) = _$StoreModelImpl;

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$StoreModelImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get storeName;
  @override
  String get description;
  @override
  String? get logo;
  @override
  String? get coverImage;
  @override
  String get businessType;
  @override
  String get category;
  @override
  List<String> get subCategories;
  @override
  ContactInfo get contactInfo;
  @override
  StoreLocation get location;
  @override
  StoreSettings get settings;
  @override
  StoreCustomization get customization;
  @override
  StoreStats get stats;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @TimestampConverter()
  DateTime? get verifiedAt;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

/// @nodoc
mixin _$ContactInfo {
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get whatsapp => throw _privateConstructorUsedError;
  String? get facebook => throw _privateConstructorUsedError;
  String? get instagram => throw _privateConstructorUsedError;

  /// Serializes this ContactInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
          ContactInfo value, $Res Function(ContactInfo) then) =
      _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call(
      {String phoneNumber,
      String? email,
      String? whatsapp,
      String? facebook,
      String? instagram});
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? whatsapp = freezed,
    Object? facebook = freezed,
    Object? instagram = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
          _$ContactInfoImpl value, $Res Function(_$ContactInfoImpl) then) =
      __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String? email,
      String? whatsapp,
      String? facebook,
      String? instagram});
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
      _$ContactInfoImpl _value, $Res Function(_$ContactInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? whatsapp = freezed,
    Object? facebook = freezed,
    Object? instagram = freezed,
  }) {
    return _then(_$ContactInfoImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl(
      {required this.phoneNumber,
      this.email,
      this.whatsapp,
      this.facebook,
      this.instagram});

  factory _$ContactInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String? email;
  @override
  final String? whatsapp;
  @override
  final String? facebook;
  @override
  final String? instagram;

  @override
  String toString() {
    return 'ContactInfo(phoneNumber: $phoneNumber, email: $email, whatsapp: $whatsapp, facebook: $facebook, instagram: $instagram)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, phoneNumber, email, whatsapp, facebook, instagram);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoImplToJson(
      this,
    );
  }
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo(
      {required final String phoneNumber,
      final String? email,
      final String? whatsapp,
      final String? facebook,
      final String? instagram}) = _$ContactInfoImpl;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$ContactInfoImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  String? get whatsapp;
  @override
  String? get facebook;
  @override
  String? get instagram;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreLocation _$StoreLocationFromJson(Map<String, dynamic> json) {
  return _StoreLocation.fromJson(json);
}

/// @nodoc
mixin _$StoreLocation {
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
  GeoPoint? get coordinates => throw _privateConstructorUsedError;

  /// Serializes this StoreLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreLocationCopyWith<StoreLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreLocationCopyWith<$Res> {
  factory $StoreLocationCopyWith(
          StoreLocation value, $Res Function(StoreLocation) then) =
      _$StoreLocationCopyWithImpl<$Res, StoreLocation>;
  @useResult
  $Res call(
      {String address,
      String city,
      String district,
      @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
      GeoPoint? coordinates});
}

/// @nodoc
class _$StoreLocationCopyWithImpl<$Res, $Val extends StoreLocation>
    implements $StoreLocationCopyWith<$Res> {
  _$StoreLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? district = null,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreLocationImplCopyWith<$Res>
    implements $StoreLocationCopyWith<$Res> {
  factory _$$StoreLocationImplCopyWith(
          _$StoreLocationImpl value, $Res Function(_$StoreLocationImpl) then) =
      __$$StoreLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String city,
      String district,
      @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
      GeoPoint? coordinates});
}

/// @nodoc
class __$$StoreLocationImplCopyWithImpl<$Res>
    extends _$StoreLocationCopyWithImpl<$Res, _$StoreLocationImpl>
    implements _$$StoreLocationImplCopyWith<$Res> {
  __$$StoreLocationImplCopyWithImpl(
      _$StoreLocationImpl _value, $Res Function(_$StoreLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? district = null,
    Object? coordinates = freezed,
  }) {
    return _then(_$StoreLocationImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreLocationImpl implements _StoreLocation {
  const _$StoreLocationImpl(
      {required this.address,
      required this.city,
      required this.district,
      @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson) this.coordinates});

  factory _$StoreLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreLocationImplFromJson(json);

  @override
  final String address;
  @override
  final String city;
  @override
  final String district;
  @override
  @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
  final GeoPoint? coordinates;

  @override
  String toString() {
    return 'StoreLocation(address: $address, city: $city, district: $district, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreLocationImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, city, district, coordinates);

  /// Create a copy of StoreLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreLocationImplCopyWith<_$StoreLocationImpl> get copyWith =>
      __$$StoreLocationImplCopyWithImpl<_$StoreLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreLocationImplToJson(
      this,
    );
  }
}

abstract class _StoreLocation implements StoreLocation {
  const factory _StoreLocation(
      {required final String address,
      required final String city,
      required final String district,
      @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
      final GeoPoint? coordinates}) = _$StoreLocationImpl;

  factory _StoreLocation.fromJson(Map<String, dynamic> json) =
      _$StoreLocationImpl.fromJson;

  @override
  String get address;
  @override
  String get city;
  @override
  String get district;
  @override
  @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
  GeoPoint? get coordinates;

  /// Create a copy of StoreLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreLocationImplCopyWith<_$StoreLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreSettings _$StoreSettingsFromJson(Map<String, dynamic> json) {
  return _StoreSettings.fromJson(json);
}

/// @nodoc
mixin _$StoreSettings {
  bool get isActive => throw _privateConstructorUsedError;
  bool get acceptsOrders => throw _privateConstructorUsedError;
  Map<String, BusinessHours> get businessHours =>
      throw _privateConstructorUsedError;
  DeliveryOptions get deliveryOptions => throw _privateConstructorUsedError;
  PaymentMethods get paymentMethods => throw _privateConstructorUsedError;

  /// Serializes this StoreSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreSettingsCopyWith<StoreSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreSettingsCopyWith<$Res> {
  factory $StoreSettingsCopyWith(
          StoreSettings value, $Res Function(StoreSettings) then) =
      _$StoreSettingsCopyWithImpl<$Res, StoreSettings>;
  @useResult
  $Res call(
      {bool isActive,
      bool acceptsOrders,
      Map<String, BusinessHours> businessHours,
      DeliveryOptions deliveryOptions,
      PaymentMethods paymentMethods});

  $DeliveryOptionsCopyWith<$Res> get deliveryOptions;
  $PaymentMethodsCopyWith<$Res> get paymentMethods;
}

/// @nodoc
class _$StoreSettingsCopyWithImpl<$Res, $Val extends StoreSettings>
    implements $StoreSettingsCopyWith<$Res> {
  _$StoreSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? acceptsOrders = null,
    Object? businessHours = null,
    Object? deliveryOptions = null,
    Object? paymentMethods = null,
  }) {
    return _then(_value.copyWith(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptsOrders: null == acceptsOrders
          ? _value.acceptsOrders
          : acceptsOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      businessHours: null == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as Map<String, BusinessHours>,
      deliveryOptions: null == deliveryOptions
          ? _value.deliveryOptions
          : deliveryOptions // ignore: cast_nullable_to_non_nullable
              as DeliveryOptions,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as PaymentMethods,
    ) as $Val);
  }

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOptionsCopyWith<$Res> get deliveryOptions {
    return $DeliveryOptionsCopyWith<$Res>(_value.deliveryOptions, (value) {
      return _then(_value.copyWith(deliveryOptions: value) as $Val);
    });
  }

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodsCopyWith<$Res> get paymentMethods {
    return $PaymentMethodsCopyWith<$Res>(_value.paymentMethods, (value) {
      return _then(_value.copyWith(paymentMethods: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreSettingsImplCopyWith<$Res>
    implements $StoreSettingsCopyWith<$Res> {
  factory _$$StoreSettingsImplCopyWith(
          _$StoreSettingsImpl value, $Res Function(_$StoreSettingsImpl) then) =
      __$$StoreSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isActive,
      bool acceptsOrders,
      Map<String, BusinessHours> businessHours,
      DeliveryOptions deliveryOptions,
      PaymentMethods paymentMethods});

  @override
  $DeliveryOptionsCopyWith<$Res> get deliveryOptions;
  @override
  $PaymentMethodsCopyWith<$Res> get paymentMethods;
}

/// @nodoc
class __$$StoreSettingsImplCopyWithImpl<$Res>
    extends _$StoreSettingsCopyWithImpl<$Res, _$StoreSettingsImpl>
    implements _$$StoreSettingsImplCopyWith<$Res> {
  __$$StoreSettingsImplCopyWithImpl(
      _$StoreSettingsImpl _value, $Res Function(_$StoreSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? acceptsOrders = null,
    Object? businessHours = null,
    Object? deliveryOptions = null,
    Object? paymentMethods = null,
  }) {
    return _then(_$StoreSettingsImpl(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptsOrders: null == acceptsOrders
          ? _value.acceptsOrders
          : acceptsOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      businessHours: null == businessHours
          ? _value._businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as Map<String, BusinessHours>,
      deliveryOptions: null == deliveryOptions
          ? _value.deliveryOptions
          : deliveryOptions // ignore: cast_nullable_to_non_nullable
              as DeliveryOptions,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as PaymentMethods,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreSettingsImpl implements _StoreSettings {
  const _$StoreSettingsImpl(
      {this.isActive = true,
      this.acceptsOrders = true,
      required final Map<String, BusinessHours> businessHours,
      required this.deliveryOptions,
      required this.paymentMethods})
      : _businessHours = businessHours;

  factory _$StoreSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool acceptsOrders;
  final Map<String, BusinessHours> _businessHours;
  @override
  Map<String, BusinessHours> get businessHours {
    if (_businessHours is EqualUnmodifiableMapView) return _businessHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_businessHours);
  }

  @override
  final DeliveryOptions deliveryOptions;
  @override
  final PaymentMethods paymentMethods;

  @override
  String toString() {
    return 'StoreSettings(isActive: $isActive, acceptsOrders: $acceptsOrders, businessHours: $businessHours, deliveryOptions: $deliveryOptions, paymentMethods: $paymentMethods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreSettingsImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.acceptsOrders, acceptsOrders) ||
                other.acceptsOrders == acceptsOrders) &&
            const DeepCollectionEquality()
                .equals(other._businessHours, _businessHours) &&
            (identical(other.deliveryOptions, deliveryOptions) ||
                other.deliveryOptions == deliveryOptions) &&
            (identical(other.paymentMethods, paymentMethods) ||
                other.paymentMethods == paymentMethods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isActive,
      acceptsOrders,
      const DeepCollectionEquality().hash(_businessHours),
      deliveryOptions,
      paymentMethods);

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreSettingsImplCopyWith<_$StoreSettingsImpl> get copyWith =>
      __$$StoreSettingsImplCopyWithImpl<_$StoreSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreSettingsImplToJson(
      this,
    );
  }
}

abstract class _StoreSettings implements StoreSettings {
  const factory _StoreSettings(
      {final bool isActive,
      final bool acceptsOrders,
      required final Map<String, BusinessHours> businessHours,
      required final DeliveryOptions deliveryOptions,
      required final PaymentMethods paymentMethods}) = _$StoreSettingsImpl;

  factory _StoreSettings.fromJson(Map<String, dynamic> json) =
      _$StoreSettingsImpl.fromJson;

  @override
  bool get isActive;
  @override
  bool get acceptsOrders;
  @override
  Map<String, BusinessHours> get businessHours;
  @override
  DeliveryOptions get deliveryOptions;
  @override
  PaymentMethods get paymentMethods;

  /// Create a copy of StoreSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreSettingsImplCopyWith<_$StoreSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BusinessHours _$BusinessHoursFromJson(Map<String, dynamic> json) {
  return _BusinessHours.fromJson(json);
}

/// @nodoc
mixin _$BusinessHours {
  String get open => throw _privateConstructorUsedError;
  String get close => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;

  /// Serializes this BusinessHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessHoursCopyWith<BusinessHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessHoursCopyWith<$Res> {
  factory $BusinessHoursCopyWith(
          BusinessHours value, $Res Function(BusinessHours) then) =
      _$BusinessHoursCopyWithImpl<$Res, BusinessHours>;
  @useResult
  $Res call({String open, String close, bool isClosed});
}

/// @nodoc
class _$BusinessHoursCopyWithImpl<$Res, $Val extends BusinessHours>
    implements $BusinessHoursCopyWith<$Res> {
  _$BusinessHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? close = null,
    Object? isClosed = null,
  }) {
    return _then(_value.copyWith(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessHoursImplCopyWith<$Res>
    implements $BusinessHoursCopyWith<$Res> {
  factory _$$BusinessHoursImplCopyWith(
          _$BusinessHoursImpl value, $Res Function(_$BusinessHoursImpl) then) =
      __$$BusinessHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String open, String close, bool isClosed});
}

/// @nodoc
class __$$BusinessHoursImplCopyWithImpl<$Res>
    extends _$BusinessHoursCopyWithImpl<$Res, _$BusinessHoursImpl>
    implements _$$BusinessHoursImplCopyWith<$Res> {
  __$$BusinessHoursImplCopyWithImpl(
      _$BusinessHoursImpl _value, $Res Function(_$BusinessHoursImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? close = null,
    Object? isClosed = null,
  }) {
    return _then(_$BusinessHoursImpl(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as String,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessHoursImpl implements _BusinessHours {
  const _$BusinessHoursImpl(
      {required this.open, required this.close, this.isClosed = false});

  factory _$BusinessHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessHoursImplFromJson(json);

  @override
  final String open;
  @override
  final String close;
  @override
  @JsonKey()
  final bool isClosed;

  @override
  String toString() {
    return 'BusinessHours(open: $open, close: $close, isClosed: $isClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessHoursImpl &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, open, close, isClosed);

  /// Create a copy of BusinessHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessHoursImplCopyWith<_$BusinessHoursImpl> get copyWith =>
      __$$BusinessHoursImplCopyWithImpl<_$BusinessHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessHoursImplToJson(
      this,
    );
  }
}

abstract class _BusinessHours implements BusinessHours {
  const factory _BusinessHours(
      {required final String open,
      required final String close,
      final bool isClosed}) = _$BusinessHoursImpl;

  factory _BusinessHours.fromJson(Map<String, dynamic> json) =
      _$BusinessHoursImpl.fromJson;

  @override
  String get open;
  @override
  String get close;
  @override
  bool get isClosed;

  /// Create a copy of BusinessHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessHoursImplCopyWith<_$BusinessHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryOptions _$DeliveryOptionsFromJson(Map<String, dynamic> json) {
  return _DeliveryOptions.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOptions {
  bool get selfPickup => throw _privateConstructorUsedError;
  bool get homeDelivery => throw _privateConstructorUsedError;
  bool get islandWideDelivery => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double? get freeDeliveryThreshold => throw _privateConstructorUsedError;

  /// Serializes this DeliveryOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryOptionsCopyWith<DeliveryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOptionsCopyWith<$Res> {
  factory $DeliveryOptionsCopyWith(
          DeliveryOptions value, $Res Function(DeliveryOptions) then) =
      _$DeliveryOptionsCopyWithImpl<$Res, DeliveryOptions>;
  @useResult
  $Res call(
      {bool selfPickup,
      bool homeDelivery,
      bool islandWideDelivery,
      double deliveryFee,
      double? freeDeliveryThreshold});
}

/// @nodoc
class _$DeliveryOptionsCopyWithImpl<$Res, $Val extends DeliveryOptions>
    implements $DeliveryOptionsCopyWith<$Res> {
  _$DeliveryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selfPickup = null,
    Object? homeDelivery = null,
    Object? islandWideDelivery = null,
    Object? deliveryFee = null,
    Object? freeDeliveryThreshold = freezed,
  }) {
    return _then(_value.copyWith(
      selfPickup: null == selfPickup
          ? _value.selfPickup
          : selfPickup // ignore: cast_nullable_to_non_nullable
              as bool,
      homeDelivery: null == homeDelivery
          ? _value.homeDelivery
          : homeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      islandWideDelivery: null == islandWideDelivery
          ? _value.islandWideDelivery
          : islandWideDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      freeDeliveryThreshold: freezed == freeDeliveryThreshold
          ? _value.freeDeliveryThreshold
          : freeDeliveryThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryOptionsImplCopyWith<$Res>
    implements $DeliveryOptionsCopyWith<$Res> {
  factory _$$DeliveryOptionsImplCopyWith(_$DeliveryOptionsImpl value,
          $Res Function(_$DeliveryOptionsImpl) then) =
      __$$DeliveryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool selfPickup,
      bool homeDelivery,
      bool islandWideDelivery,
      double deliveryFee,
      double? freeDeliveryThreshold});
}

/// @nodoc
class __$$DeliveryOptionsImplCopyWithImpl<$Res>
    extends _$DeliveryOptionsCopyWithImpl<$Res, _$DeliveryOptionsImpl>
    implements _$$DeliveryOptionsImplCopyWith<$Res> {
  __$$DeliveryOptionsImplCopyWithImpl(
      _$DeliveryOptionsImpl _value, $Res Function(_$DeliveryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selfPickup = null,
    Object? homeDelivery = null,
    Object? islandWideDelivery = null,
    Object? deliveryFee = null,
    Object? freeDeliveryThreshold = freezed,
  }) {
    return _then(_$DeliveryOptionsImpl(
      selfPickup: null == selfPickup
          ? _value.selfPickup
          : selfPickup // ignore: cast_nullable_to_non_nullable
              as bool,
      homeDelivery: null == homeDelivery
          ? _value.homeDelivery
          : homeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      islandWideDelivery: null == islandWideDelivery
          ? _value.islandWideDelivery
          : islandWideDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      freeDeliveryThreshold: freezed == freeDeliveryThreshold
          ? _value.freeDeliveryThreshold
          : freeDeliveryThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryOptionsImpl implements _DeliveryOptions {
  const _$DeliveryOptionsImpl(
      {this.selfPickup = true,
      this.homeDelivery = true,
      this.islandWideDelivery = false,
      this.deliveryFee = 0.0,
      this.freeDeliveryThreshold});

  factory _$DeliveryOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryOptionsImplFromJson(json);

  @override
  @JsonKey()
  final bool selfPickup;
  @override
  @JsonKey()
  final bool homeDelivery;
  @override
  @JsonKey()
  final bool islandWideDelivery;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  final double? freeDeliveryThreshold;

  @override
  String toString() {
    return 'DeliveryOptions(selfPickup: $selfPickup, homeDelivery: $homeDelivery, islandWideDelivery: $islandWideDelivery, deliveryFee: $deliveryFee, freeDeliveryThreshold: $freeDeliveryThreshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryOptionsImpl &&
            (identical(other.selfPickup, selfPickup) ||
                other.selfPickup == selfPickup) &&
            (identical(other.homeDelivery, homeDelivery) ||
                other.homeDelivery == homeDelivery) &&
            (identical(other.islandWideDelivery, islandWideDelivery) ||
                other.islandWideDelivery == islandWideDelivery) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.freeDeliveryThreshold, freeDeliveryThreshold) ||
                other.freeDeliveryThreshold == freeDeliveryThreshold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selfPickup, homeDelivery,
      islandWideDelivery, deliveryFee, freeDeliveryThreshold);

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryOptionsImplCopyWith<_$DeliveryOptionsImpl> get copyWith =>
      __$$DeliveryOptionsImplCopyWithImpl<_$DeliveryOptionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryOptionsImplToJson(
      this,
    );
  }
}

abstract class _DeliveryOptions implements DeliveryOptions {
  const factory _DeliveryOptions(
      {final bool selfPickup,
      final bool homeDelivery,
      final bool islandWideDelivery,
      final double deliveryFee,
      final double? freeDeliveryThreshold}) = _$DeliveryOptionsImpl;

  factory _DeliveryOptions.fromJson(Map<String, dynamic> json) =
      _$DeliveryOptionsImpl.fromJson;

  @override
  bool get selfPickup;
  @override
  bool get homeDelivery;
  @override
  bool get islandWideDelivery;
  @override
  double get deliveryFee;
  @override
  double? get freeDeliveryThreshold;

  /// Create a copy of DeliveryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryOptionsImplCopyWith<_$DeliveryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethods _$PaymentMethodsFromJson(Map<String, dynamic> json) {
  return _PaymentMethods.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethods {
  bool get cashOnDelivery => throw _privateConstructorUsedError;
  bool get bankTransfer => throw _privateConstructorUsedError;
  bool get cardPayment => throw _privateConstructorUsedError;
  bool get digitalWallet => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethods to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethods
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodsCopyWith<PaymentMethods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsCopyWith<$Res> {
  factory $PaymentMethodsCopyWith(
          PaymentMethods value, $Res Function(PaymentMethods) then) =
      _$PaymentMethodsCopyWithImpl<$Res, PaymentMethods>;
  @useResult
  $Res call(
      {bool cashOnDelivery,
      bool bankTransfer,
      bool cardPayment,
      bool digitalWallet});
}

/// @nodoc
class _$PaymentMethodsCopyWithImpl<$Res, $Val extends PaymentMethods>
    implements $PaymentMethodsCopyWith<$Res> {
  _$PaymentMethodsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethods
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashOnDelivery = null,
    Object? bankTransfer = null,
    Object? cardPayment = null,
    Object? digitalWallet = null,
  }) {
    return _then(_value.copyWith(
      cashOnDelivery: null == cashOnDelivery
          ? _value.cashOnDelivery
          : cashOnDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      bankTransfer: null == bankTransfer
          ? _value.bankTransfer
          : bankTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      cardPayment: null == cardPayment
          ? _value.cardPayment
          : cardPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      digitalWallet: null == digitalWallet
          ? _value.digitalWallet
          : digitalWallet // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodsImplCopyWith<$Res>
    implements $PaymentMethodsCopyWith<$Res> {
  factory _$$PaymentMethodsImplCopyWith(_$PaymentMethodsImpl value,
          $Res Function(_$PaymentMethodsImpl) then) =
      __$$PaymentMethodsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool cashOnDelivery,
      bool bankTransfer,
      bool cardPayment,
      bool digitalWallet});
}

/// @nodoc
class __$$PaymentMethodsImplCopyWithImpl<$Res>
    extends _$PaymentMethodsCopyWithImpl<$Res, _$PaymentMethodsImpl>
    implements _$$PaymentMethodsImplCopyWith<$Res> {
  __$$PaymentMethodsImplCopyWithImpl(
      _$PaymentMethodsImpl _value, $Res Function(_$PaymentMethodsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethods
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashOnDelivery = null,
    Object? bankTransfer = null,
    Object? cardPayment = null,
    Object? digitalWallet = null,
  }) {
    return _then(_$PaymentMethodsImpl(
      cashOnDelivery: null == cashOnDelivery
          ? _value.cashOnDelivery
          : cashOnDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      bankTransfer: null == bankTransfer
          ? _value.bankTransfer
          : bankTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      cardPayment: null == cardPayment
          ? _value.cardPayment
          : cardPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      digitalWallet: null == digitalWallet
          ? _value.digitalWallet
          : digitalWallet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodsImpl implements _PaymentMethods {
  const _$PaymentMethodsImpl(
      {this.cashOnDelivery = true,
      this.bankTransfer = false,
      this.cardPayment = false,
      this.digitalWallet = false});

  factory _$PaymentMethodsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodsImplFromJson(json);

  @override
  @JsonKey()
  final bool cashOnDelivery;
  @override
  @JsonKey()
  final bool bankTransfer;
  @override
  @JsonKey()
  final bool cardPayment;
  @override
  @JsonKey()
  final bool digitalWallet;

  @override
  String toString() {
    return 'PaymentMethods(cashOnDelivery: $cashOnDelivery, bankTransfer: $bankTransfer, cardPayment: $cardPayment, digitalWallet: $digitalWallet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsImpl &&
            (identical(other.cashOnDelivery, cashOnDelivery) ||
                other.cashOnDelivery == cashOnDelivery) &&
            (identical(other.bankTransfer, bankTransfer) ||
                other.bankTransfer == bankTransfer) &&
            (identical(other.cardPayment, cardPayment) ||
                other.cardPayment == cardPayment) &&
            (identical(other.digitalWallet, digitalWallet) ||
                other.digitalWallet == digitalWallet));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, cashOnDelivery, bankTransfer, cardPayment, digitalWallet);

  /// Create a copy of PaymentMethods
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsImplCopyWith<_$PaymentMethodsImpl> get copyWith =>
      __$$PaymentMethodsImplCopyWithImpl<_$PaymentMethodsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodsImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethods implements PaymentMethods {
  const factory _PaymentMethods(
      {final bool cashOnDelivery,
      final bool bankTransfer,
      final bool cardPayment,
      final bool digitalWallet}) = _$PaymentMethodsImpl;

  factory _PaymentMethods.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodsImpl.fromJson;

  @override
  bool get cashOnDelivery;
  @override
  bool get bankTransfer;
  @override
  bool get cardPayment;
  @override
  bool get digitalWallet;

  /// Create a copy of PaymentMethods
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsImplCopyWith<_$PaymentMethodsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreCustomization _$StoreCustomizationFromJson(Map<String, dynamic> json) {
  return _StoreCustomization.fromJson(json);
}

/// @nodoc
mixin _$StoreCustomization {
  String get themeColor => throw _privateConstructorUsedError;
  List<CustomField> get customFields => throw _privateConstructorUsedError;

  /// Serializes this StoreCustomization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreCustomizationCopyWith<StoreCustomization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCustomizationCopyWith<$Res> {
  factory $StoreCustomizationCopyWith(
          StoreCustomization value, $Res Function(StoreCustomization) then) =
      _$StoreCustomizationCopyWithImpl<$Res, StoreCustomization>;
  @useResult
  $Res call({String themeColor, List<CustomField> customFields});
}

/// @nodoc
class _$StoreCustomizationCopyWithImpl<$Res, $Val extends StoreCustomization>
    implements $StoreCustomizationCopyWith<$Res> {
  _$StoreCustomizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeColor = null,
    Object? customFields = null,
  }) {
    return _then(_value.copyWith(
      themeColor: null == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String,
      customFields: null == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as List<CustomField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreCustomizationImplCopyWith<$Res>
    implements $StoreCustomizationCopyWith<$Res> {
  factory _$$StoreCustomizationImplCopyWith(_$StoreCustomizationImpl value,
          $Res Function(_$StoreCustomizationImpl) then) =
      __$$StoreCustomizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String themeColor, List<CustomField> customFields});
}

/// @nodoc
class __$$StoreCustomizationImplCopyWithImpl<$Res>
    extends _$StoreCustomizationCopyWithImpl<$Res, _$StoreCustomizationImpl>
    implements _$$StoreCustomizationImplCopyWith<$Res> {
  __$$StoreCustomizationImplCopyWithImpl(_$StoreCustomizationImpl _value,
      $Res Function(_$StoreCustomizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeColor = null,
    Object? customFields = null,
  }) {
    return _then(_$StoreCustomizationImpl(
      themeColor: null == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String,
      customFields: null == customFields
          ? _value._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as List<CustomField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreCustomizationImpl implements _StoreCustomization {
  const _$StoreCustomizationImpl(
      {this.themeColor = '#2E7D32',
      final List<CustomField> customFields = const []})
      : _customFields = customFields;

  factory _$StoreCustomizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreCustomizationImplFromJson(json);

  @override
  @JsonKey()
  final String themeColor;
  final List<CustomField> _customFields;
  @override
  @JsonKey()
  List<CustomField> get customFields {
    if (_customFields is EqualUnmodifiableListView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customFields);
  }

  @override
  String toString() {
    return 'StoreCustomization(themeColor: $themeColor, customFields: $customFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreCustomizationImpl &&
            (identical(other.themeColor, themeColor) ||
                other.themeColor == themeColor) &&
            const DeepCollectionEquality()
                .equals(other._customFields, _customFields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeColor,
      const DeepCollectionEquality().hash(_customFields));

  /// Create a copy of StoreCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreCustomizationImplCopyWith<_$StoreCustomizationImpl> get copyWith =>
      __$$StoreCustomizationImplCopyWithImpl<_$StoreCustomizationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreCustomizationImplToJson(
      this,
    );
  }
}

abstract class _StoreCustomization implements StoreCustomization {
  const factory _StoreCustomization(
      {final String themeColor,
      final List<CustomField> customFields}) = _$StoreCustomizationImpl;

  factory _StoreCustomization.fromJson(Map<String, dynamic> json) =
      _$StoreCustomizationImpl.fromJson;

  @override
  String get themeColor;
  @override
  List<CustomField> get customFields;

  /// Create a copy of StoreCustomization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreCustomizationImplCopyWith<_$StoreCustomizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreStats _$StoreStatsFromJson(Map<String, dynamic> json) {
  return _StoreStats.fromJson(json);
}

/// @nodoc
mixin _$StoreStats {
  int get totalProducts => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this StoreStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreStatsCopyWith<StoreStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreStatsCopyWith<$Res> {
  factory $StoreStatsCopyWith(
          StoreStats value, $Res Function(StoreStats) then) =
      _$StoreStatsCopyWithImpl<$Res, StoreStats>;
  @useResult
  $Res call(
      {int totalProducts,
      int totalOrders,
      double rating,
      int reviewCount,
      bool isVerified});
}

/// @nodoc
class _$StoreStatsCopyWithImpl<$Res, $Val extends StoreStats>
    implements $StoreStatsCopyWith<$Res> {
  _$StoreStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? totalOrders = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreStatsImplCopyWith<$Res>
    implements $StoreStatsCopyWith<$Res> {
  factory _$$StoreStatsImplCopyWith(
          _$StoreStatsImpl value, $Res Function(_$StoreStatsImpl) then) =
      __$$StoreStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalProducts,
      int totalOrders,
      double rating,
      int reviewCount,
      bool isVerified});
}

/// @nodoc
class __$$StoreStatsImplCopyWithImpl<$Res>
    extends _$StoreStatsCopyWithImpl<$Res, _$StoreStatsImpl>
    implements _$$StoreStatsImplCopyWith<$Res> {
  __$$StoreStatsImplCopyWithImpl(
      _$StoreStatsImpl _value, $Res Function(_$StoreStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? totalOrders = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? isVerified = null,
  }) {
    return _then(_$StoreStatsImpl(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreStatsImpl implements _StoreStats {
  const _$StoreStatsImpl(
      {this.totalProducts = 0,
      this.totalOrders = 0,
      this.rating = 0.0,
      this.reviewCount = 0,
      this.isVerified = false});

  factory _$StoreStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalProducts;
  @override
  @JsonKey()
  final int totalOrders;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'StoreStats(totalProducts: $totalProducts, totalOrders: $totalOrders, rating: $rating, reviewCount: $reviewCount, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreStatsImpl &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalProducts, totalOrders, rating, reviewCount, isVerified);

  /// Create a copy of StoreStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreStatsImplCopyWith<_$StoreStatsImpl> get copyWith =>
      __$$StoreStatsImplCopyWithImpl<_$StoreStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreStatsImplToJson(
      this,
    );
  }
}

abstract class _StoreStats implements StoreStats {
  const factory _StoreStats(
      {final int totalProducts,
      final int totalOrders,
      final double rating,
      final int reviewCount,
      final bool isVerified}) = _$StoreStatsImpl;

  factory _StoreStats.fromJson(Map<String, dynamic> json) =
      _$StoreStatsImpl.fromJson;

  @override
  int get totalProducts;
  @override
  int get totalOrders;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  bool get isVerified;

  /// Create a copy of StoreStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreStatsImplCopyWith<_$StoreStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
