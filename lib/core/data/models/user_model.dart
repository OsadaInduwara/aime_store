// lib/core/models/user_model.dart - FREEZED VERSION
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Converts Firestore `Timestamp` ↔ Dart `DateTime`
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp ts) => ts.toDate();

  @override
  Timestamp toJson(DateTime dt) => Timestamp.fromDate(dt);
}

/// Converts a JSON map `{ "latitude":…, "longitude":… }` ↔ Firestore `GeoPoint`
class GeoPointConverter implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) => GeoPoint(
    json['latitude'] as double,
    json['longitude'] as double,
  );

  @override
  Map<String, dynamic> toJson(GeoPoint geo) => {
    'latitude': geo.latitude,
    'longitude': geo.longitude,
  };
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String phoneNumber,
    String? email,
    required String displayName,
    String? profileImage,
    @Default(UserType.customer) UserType userType,
    String? storeId, // Link to store document for vendors
    @Default([]) List<Address> addresses,
    required UserPreferences preferences,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    @TimestampConverter() DateTime? lastLoginAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required String id,
    required String label,
    required String fullName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String district,
    required String postalCode,
    @Default(false) bool isDefault,
    @GeoPointConverter() GeoPoint? coordinates,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default('en') String language,
    @Default('LKR') String currency,
    @Default(NotificationSettings()) NotificationSettings notifications,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool push,
    @Default(true) bool sms,
    @Default(true) bool email,
    @Default(true) bool orderUpdates,
    @Default(false) bool promotions,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);
}

enum UserType {
  @JsonValue('customer')
  customer,
  @JsonValue('vendor')
  vendor,
  @JsonValue('admin')
  admin,
}
