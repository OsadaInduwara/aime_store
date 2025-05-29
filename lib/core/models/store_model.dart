import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'category_model.dart';
import 'user_model.dart'; // for TimestampConverter

part 'store_model.freezed.dart';
part 'store_model.g.dart';

GeoPoint? _geoFromJson(Map<String, dynamic>? m) =>
    m == null ? null : GeoPoint(m['latitude'] as double, m['longitude'] as double);
Map<String, dynamic>? _geoToJson(GeoPoint? gp) =>
    gp == null ? null : {'latitude': gp.latitude, 'longitude': gp.longitude};

@freezed
class StoreModel with _$StoreModel {
  const factory StoreModel({
    required String id,
    required String ownerId,
    required String storeName,
    required String description,
    String? logo,
    String? coverImage,
    required String businessType,
    required String category,
    @Default([]) List<String> subCategories,
    required ContactInfo contactInfo,
    required StoreLocation location,
    required StoreSettings settings,
    required StoreCustomization customization,
    required StoreStats stats,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    @TimestampConverter() DateTime? verifiedAt,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

@freezed
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    required String phoneNumber,
    String? email,
    String? whatsapp,
    String? facebook,
    String? instagram,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
}

@freezed
class StoreLocation with _$StoreLocation {
  const factory StoreLocation({
    required String address,
    required String city,
    required String district,
    @JsonKey(fromJson: _geoFromJson, toJson: _geoToJson)
    GeoPoint? coordinates,
  }) = _StoreLocation;

  factory StoreLocation.fromJson(Map<String, dynamic> json) =>
      _$StoreLocationFromJson(json);
}

@freezed
class StoreSettings with _$StoreSettings {
  const factory StoreSettings({
    @Default(true) bool isActive,
    @Default(true) bool acceptsOrders,
    required Map<String, BusinessHours> businessHours,
    required DeliveryOptions deliveryOptions,
    required PaymentMethods paymentMethods,
  }) = _StoreSettings;

  factory StoreSettings.fromJson(Map<String, dynamic> json) =>
      _$StoreSettingsFromJson(json);
}

@freezed
class BusinessHours with _$BusinessHours {
  const factory BusinessHours({
    required String open,
    required String close,
    @Default(false) bool isClosed,
  }) = _BusinessHours;

  factory BusinessHours.fromJson(Map<String, dynamic> json) =>
      _$BusinessHoursFromJson(json);
}

@freezed
class DeliveryOptions with _$DeliveryOptions {
  const factory DeliveryOptions({
    @Default(true) bool selfPickup,
    @Default(true) bool homeDelivery,
    @Default(false) bool islandWideDelivery,
    @Default(0.0) double deliveryFee,
    double? freeDeliveryThreshold,
  }) = _DeliveryOptions;

  factory DeliveryOptions.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOptionsFromJson(json);
}

@freezed
class PaymentMethods with _$PaymentMethods {
  const factory PaymentMethods({
    @Default(true) bool cashOnDelivery,
    @Default(false) bool bankTransfer,
    @Default(false) bool cardPayment,
    @Default(false) bool digitalWallet,
  }) = _PaymentMethods;

  factory PaymentMethods.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsFromJson(json);
}

@freezed
class StoreCustomization with _$StoreCustomization {
  const factory StoreCustomization({
    @Default('#2E7D32') String themeColor,
    @Default([]) List<CustomField> customFields,
  }) = _StoreCustomization;

  factory StoreCustomization.fromJson(Map<String, dynamic> json) =>
      _$StoreCustomizationFromJson(json);
}

@freezed
class StoreStats with _$StoreStats {
  const factory StoreStats({
    @Default(0) int totalProducts,
    @Default(0) int totalOrders,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    @Default(false) bool isVerified,
  }) = _StoreStats;

  factory StoreStats.fromJson(Map<String, dynamic> json) =>
      _$StoreStatsFromJson(json);
}
