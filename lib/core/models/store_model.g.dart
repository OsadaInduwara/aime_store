// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      storeName: json['storeName'] as String,
      description: json['description'] as String,
      logo: json['logo'] as String?,
      coverImage: json['coverImage'] as String?,
      businessType: json['businessType'] as String,
      category: json['category'] as String,
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      contactInfo:
          ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
      location:
          StoreLocation.fromJson(json['location'] as Map<String, dynamic>),
      settings:
          StoreSettings.fromJson(json['settings'] as Map<String, dynamic>),
      customization: StoreCustomization.fromJson(
          json['customization'] as Map<String, dynamic>),
      stats: StoreStats.fromJson(json['stats'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      verifiedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['verifiedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'storeName': instance.storeName,
      'description': instance.description,
      'logo': instance.logo,
      'coverImage': instance.coverImage,
      'businessType': instance.businessType,
      'category': instance.category,
      'subCategories': instance.subCategories,
      'contactInfo': instance.contactInfo,
      'location': instance.location,
      'settings': instance.settings,
      'customization': instance.customization,
      'stats': instance.stats,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'verifiedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.verifiedAt, const TimestampConverter().toJson),
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

_$ContactInfoImpl _$$ContactInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContactInfoImpl(
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      whatsapp: json['whatsapp'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$$ContactInfoImplToJson(_$ContactInfoImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'whatsapp': instance.whatsapp,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
    };

_$StoreLocationImpl _$$StoreLocationImplFromJson(Map<String, dynamic> json) =>
    _$StoreLocationImpl(
      address: json['address'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      coordinates: _geoFromJson(json['coordinates'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$StoreLocationImplToJson(_$StoreLocationImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'coordinates': _geoToJson(instance.coordinates),
    };

_$StoreSettingsImpl _$$StoreSettingsImplFromJson(Map<String, dynamic> json) =>
    _$StoreSettingsImpl(
      isActive: json['isActive'] as bool? ?? true,
      acceptsOrders: json['acceptsOrders'] as bool? ?? true,
      businessHours: (json['businessHours'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, BusinessHours.fromJson(e as Map<String, dynamic>)),
      ),
      deliveryOptions: DeliveryOptions.fromJson(
          json['deliveryOptions'] as Map<String, dynamic>),
      paymentMethods: PaymentMethods.fromJson(
          json['paymentMethods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreSettingsImplToJson(_$StoreSettingsImpl instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'acceptsOrders': instance.acceptsOrders,
      'businessHours': instance.businessHours,
      'deliveryOptions': instance.deliveryOptions,
      'paymentMethods': instance.paymentMethods,
    };

_$BusinessHoursImpl _$$BusinessHoursImplFromJson(Map<String, dynamic> json) =>
    _$BusinessHoursImpl(
      open: json['open'] as String,
      close: json['close'] as String,
      isClosed: json['isClosed'] as bool? ?? false,
    );

Map<String, dynamic> _$$BusinessHoursImplToJson(_$BusinessHoursImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
      'isClosed': instance.isClosed,
    };

_$DeliveryOptionsImpl _$$DeliveryOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryOptionsImpl(
      selfPickup: json['selfPickup'] as bool? ?? true,
      homeDelivery: json['homeDelivery'] as bool? ?? true,
      islandWideDelivery: json['islandWideDelivery'] as bool? ?? false,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      freeDeliveryThreshold:
          (json['freeDeliveryThreshold'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DeliveryOptionsImplToJson(
        _$DeliveryOptionsImpl instance) =>
    <String, dynamic>{
      'selfPickup': instance.selfPickup,
      'homeDelivery': instance.homeDelivery,
      'islandWideDelivery': instance.islandWideDelivery,
      'deliveryFee': instance.deliveryFee,
      'freeDeliveryThreshold': instance.freeDeliveryThreshold,
    };

_$PaymentMethodsImpl _$$PaymentMethodsImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodsImpl(
      cashOnDelivery: json['cashOnDelivery'] as bool? ?? true,
      bankTransfer: json['bankTransfer'] as bool? ?? false,
      cardPayment: json['cardPayment'] as bool? ?? false,
      digitalWallet: json['digitalWallet'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaymentMethodsImplToJson(
        _$PaymentMethodsImpl instance) =>
    <String, dynamic>{
      'cashOnDelivery': instance.cashOnDelivery,
      'bankTransfer': instance.bankTransfer,
      'cardPayment': instance.cardPayment,
      'digitalWallet': instance.digitalWallet,
    };

_$StoreCustomizationImpl _$$StoreCustomizationImplFromJson(
        Map<String, dynamic> json) =>
    _$StoreCustomizationImpl(
      themeColor: json['themeColor'] as String? ?? '#2E7D32',
      customFields: (json['customFields'] as List<dynamic>?)
              ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoreCustomizationImplToJson(
        _$StoreCustomizationImpl instance) =>
    <String, dynamic>{
      'themeColor': instance.themeColor,
      'customFields': instance.customFields,
    };

_$StoreStatsImpl _$$StoreStatsImplFromJson(Map<String, dynamic> json) =>
    _$StoreStatsImpl(
      totalProducts: (json['totalProducts'] as num?)?.toInt() ?? 0,
      totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$StoreStatsImplToJson(_$StoreStatsImpl instance) =>
    <String, dynamic>{
      'totalProducts': instance.totalProducts,
      'totalOrders': instance.totalOrders,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'isVerified': instance.isVerified,
    };
