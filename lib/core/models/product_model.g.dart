// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      storeId: json['storeId'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      thumbnailImage: json['thumbnailImage'] as String,
      pricing: ProductPricing.fromJson(json['pricing'] as Map<String, dynamic>),
      inventory:
          ProductInventory.fromJson(json['inventory'] as Map<String, dynamic>),
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      customAttributes:
          json['customAttributes'] as Map<String, dynamic>? ?? const {},
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      searchKeywords: (json['searchKeywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      settings:
          ProductSettings.fromJson(json['settings'] as Map<String, dynamic>),
      stats: ProductStats.fromJson(json['stats'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      publishedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['publishedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeId': instance.storeId,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'images': instance.images,
      'videos': instance.videos,
      'thumbnailImage': instance.thumbnailImage,
      'pricing': instance.pricing,
      'inventory': instance.inventory,
      'variants': instance.variants,
      'customAttributes': instance.customAttributes,
      'tags': instance.tags,
      'searchKeywords': instance.searchKeywords,
      'settings': instance.settings,
      'stats': instance.stats,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'publishedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.publishedAt, const TimestampConverter().toJson),
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

_$ProductPricingImpl _$$ProductPricingImplFromJson(Map<String, dynamic> json) =>
    _$ProductPricingImpl(
      basePrice: (json['basePrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'LKR',
      priceType: $enumDecodeNullable(_$PriceTypeEnumMap, json['priceType']) ??
          PriceType.fixed,
      minimumPrice: (json['minimumPrice'] as num?)?.toDouble(),
      maximumPrice: (json['maximumPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductPricingImplToJson(
        _$ProductPricingImpl instance) =>
    <String, dynamic>{
      'basePrice': instance.basePrice,
      'salePrice': instance.salePrice,
      'currency': instance.currency,
      'priceType': _$PriceTypeEnumMap[instance.priceType]!,
      'minimumPrice': instance.minimumPrice,
      'maximumPrice': instance.maximumPrice,
    };

const _$PriceTypeEnumMap = {
  PriceType.fixed: 'fixed',
  PriceType.range: 'range',
  PriceType.custom: 'custom',
};

_$ProductInventoryImpl _$$ProductInventoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductInventoryImpl(
      trackInventory: json['trackInventory'] as bool? ?? true,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      allowBackorder: json['allowBackorder'] as bool? ?? false,
      stockStatus:
          $enumDecodeNullable(_$StockStatusEnumMap, json['stockStatus']) ??
              StockStatus.inStock,
    );

Map<String, dynamic> _$$ProductInventoryImplToJson(
        _$ProductInventoryImpl instance) =>
    <String, dynamic>{
      'trackInventory': instance.trackInventory,
      'stockQuantity': instance.stockQuantity,
      'allowBackorder': instance.allowBackorder,
      'stockStatus': _$StockStatusEnumMap[instance.stockStatus]!,
    };

const _$StockStatusEnumMap = {
  StockStatus.inStock: 'in_stock',
  StockStatus.outOfStock: 'out_of_stock',
  StockStatus.limitedStock: 'limited_stock',
};

_$ProductVariantImpl _$$ProductVariantImplFromJson(Map<String, dynamic> json) =>
    _$ProductVariantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      price: (json['price'] as num?)?.toDouble(),
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      sku: json['sku'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ProductVariantImplToJson(
        _$ProductVariantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'attributes': instance.attributes,
      'price': instance.price,
      'stockQuantity': instance.stockQuantity,
      'sku': instance.sku,
      'image': instance.image,
    };

_$ProductSettingsImpl _$$ProductSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductSettingsImpl(
      isActive: json['isActive'] as bool? ?? true,
      isFeatured: json['isFeatured'] as bool? ?? false,
      allowReviews: json['allowReviews'] as bool? ?? true,
      requiresApproval: json['requiresApproval'] as bool? ?? false,
      processingTime: json['processingTime'] as String?,
      shippingWeight: (json['shippingWeight'] as num?)?.toDouble(),
      dimensions: json['dimensions'] == null
          ? null
          : ProductDimensions.fromJson(
              json['dimensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductSettingsImplToJson(
        _$ProductSettingsImpl instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'isFeatured': instance.isFeatured,
      'allowReviews': instance.allowReviews,
      'requiresApproval': instance.requiresApproval,
      'processingTime': instance.processingTime,
      'shippingWeight': instance.shippingWeight,
      'dimensions': instance.dimensions,
    };

_$ProductDimensionsImpl _$$ProductDimensionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDimensionsImpl(
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      unit: json['unit'] as String? ?? 'cm',
    );

Map<String, dynamic> _$$ProductDimensionsImplToJson(
        _$ProductDimensionsImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'unit': instance.unit,
    };

_$ProductStatsImpl _$$ProductStatsImplFromJson(Map<String, dynamic> json) =>
    _$ProductStatsImpl(
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      orderCount: (json['orderCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      wishlistCount: (json['wishlistCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProductStatsImplToJson(_$ProductStatsImpl instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'orderCount': instance.orderCount,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'wishlistCount': instance.wishlistCount,
    };
