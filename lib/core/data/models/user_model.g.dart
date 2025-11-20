// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      displayName: json['displayName'] as String,
      profileImage: json['profileImage'] as String?,
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.customer,
      storeId: json['storeId'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      preferences:
          UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      lastLoginAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastLoginAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'displayName': instance.displayName,
      'profileImage': instance.profileImage,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'storeId': instance.storeId,
      'addresses': instance.addresses,
      'preferences': instance.preferences,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'lastLoginAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastLoginAt, const TimestampConverter().toJson),
    };

const _$UserTypeEnumMap = {
  UserType.customer: 'customer',
  UserType.vendor: 'vendor',
  UserType.admin: 'admin',
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

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String,
      district: json['district'] as String,
      postalCode: json['postalCode'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
      coordinates: _$JsonConverterFromJson<Map<String, dynamic>, GeoPoint>(
          json['coordinates'], const GeoPointConverter().fromJson),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'district': instance.district,
      'postalCode': instance.postalCode,
      'isDefault': instance.isDefault,
      'coordinates': _$JsonConverterToJson<Map<String, dynamic>, GeoPoint>(
          instance.coordinates, const GeoPointConverter().toJson),
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      language: json['language'] as String? ?? 'en',
      currency: json['currency'] as String? ?? 'LKR',
      notifications: json['notifications'] == null
          ? const NotificationSettings()
          : NotificationSettings.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'currency': instance.currency,
      'notifications': instance.notifications,
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      push: json['push'] as bool? ?? true,
      sms: json['sms'] as bool? ?? true,
      email: json['email'] as bool? ?? true,
      orderUpdates: json['orderUpdates'] as bool? ?? true,
      promotions: json['promotions'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'push': instance.push,
      'sms': instance.sms,
      'email': instance.email,
      'orderUpdates': instance.orderUpdates,
      'promotions': instance.promotions,
    };
