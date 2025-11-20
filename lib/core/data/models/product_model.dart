import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart'; // for TimestampConverter

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String storeId,
    required String categoryId,
    required String name,
    required String description,
    String? shortDescription,
    @Default([]) List<String> images,
    @Default([]) List<String> videos,
    required String thumbnailImage,
    required ProductPricing pricing,
    required ProductInventory inventory,
    @Default([]) List<ProductVariant> variants,
    @Default({}) Map<String, dynamic> customAttributes,
    @Default([]) List<String> tags,
    @Default([]) List<String> searchKeywords,
    required ProductSettings settings,
    required ProductStats stats,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    @TimestampConverter() DateTime? publishedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ProductPricing with _$ProductPricing {
  const factory ProductPricing({
    required double basePrice,
    double? salePrice,
    @Default('LKR') String currency,
    @Default(PriceType.fixed) PriceType priceType,
    double? minimumPrice,
    double? maximumPrice,
  }) = _ProductPricing;

  factory ProductPricing.fromJson(Map<String, dynamic> json) => _$ProductPricingFromJson(json);
}

@freezed
class ProductInventory with _$ProductInventory {
  const factory ProductInventory({
    @Default(true) bool trackInventory,
    int? stockQuantity,
    @Default(false) bool allowBackorder,
    @Default(StockStatus.inStock) StockStatus stockStatus,
  }) = _ProductInventory;

  factory ProductInventory.fromJson(Map<String, dynamic> json) => _$ProductInventoryFromJson(json);
}

@freezed
class ProductVariant with _$ProductVariant {
  const factory ProductVariant({
    required String id,
    required String name,
    @Default({}) Map<String, String> attributes,
    double? price,
    int? stockQuantity,
    String? sku,
    String? image,
  }) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);
}

@freezed
class ProductSettings with _$ProductSettings {
  const factory ProductSettings({
    @Default(true) bool isActive,
    @Default(false) bool isFeatured,
    @Default(true) bool allowReviews,
    @Default(false) bool requiresApproval,
    String? processingTime,
    double? shippingWeight,
    ProductDimensions? dimensions,
  }) = _ProductSettings;

  factory ProductSettings.fromJson(Map<String, dynamic> json) => _$ProductSettingsFromJson(json);
}

@freezed
class ProductDimensions with _$ProductDimensions {
  const factory ProductDimensions({
    double? length,
    double? width,
    double? height,
    @Default('cm') String unit,
  }) = _ProductDimensions;

  factory ProductDimensions.fromJson(Map<String, dynamic> json) => _$ProductDimensionsFromJson(json);
}

@freezed
class ProductStats with _$ProductStats {
  const factory ProductStats({
    @Default(0) int viewCount,
    @Default(0) int orderCount,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    @Default(0) int wishlistCount,
  }) = _ProductStats;

  factory ProductStats.fromJson(Map<String, dynamic> json) => _$ProductStatsFromJson(json);
}

enum PriceType {
  @JsonValue('fixed')
  fixed,
  @JsonValue('range')
  range,
  @JsonValue('custom')
  custom,
}

enum StockStatus {
  @JsonValue('in_stock')
  inStock,
  @JsonValue('out_of_stock')
  outOfStock,
  @JsonValue('limited_stock')
  limitedStock,
}
