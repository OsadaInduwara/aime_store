// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get videos => throw _privateConstructorUsedError;
  String get thumbnailImage => throw _privateConstructorUsedError;
  ProductPricing get pricing => throw _privateConstructorUsedError;
  ProductInventory get inventory => throw _privateConstructorUsedError;
  List<ProductVariant> get variants => throw _privateConstructorUsedError;
  Map<String, dynamic> get customAttributes =>
      throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get searchKeywords => throw _privateConstructorUsedError;
  ProductSettings get settings => throw _privateConstructorUsedError;
  ProductStats get stats => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get publishedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String storeId,
      String categoryId,
      String name,
      String description,
      String? shortDescription,
      List<String> images,
      List<String> videos,
      String thumbnailImage,
      ProductPricing pricing,
      ProductInventory inventory,
      List<ProductVariant> variants,
      Map<String, dynamic> customAttributes,
      List<String> tags,
      List<String> searchKeywords,
      ProductSettings settings,
      ProductStats stats,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? publishedAt});

  $ProductPricingCopyWith<$Res> get pricing;
  $ProductInventoryCopyWith<$Res> get inventory;
  $ProductSettingsCopyWith<$Res> get settings;
  $ProductStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storeId = null,
    Object? categoryId = null,
    Object? name = null,
    Object? description = null,
    Object? shortDescription = freezed,
    Object? images = null,
    Object? videos = null,
    Object? thumbnailImage = null,
    Object? pricing = null,
    Object? inventory = null,
    Object? variants = null,
    Object? customAttributes = null,
    Object? tags = null,
    Object? searchKeywords = null,
    Object? settings = null,
    Object? stats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as ProductPricing,
      inventory: null == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as ProductInventory,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariant>,
      customAttributes: null == customAttributes
          ? _value.customAttributes
          : customAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKeywords: null == searchKeywords
          ? _value.searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ProductSettings,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ProductStats,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductPricingCopyWith<$Res> get pricing {
    return $ProductPricingCopyWith<$Res>(_value.pricing, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductInventoryCopyWith<$Res> get inventory {
    return $ProductInventoryCopyWith<$Res>(_value.inventory, (value) {
      return _then(_value.copyWith(inventory: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductSettingsCopyWith<$Res> get settings {
    return $ProductSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductStatsCopyWith<$Res> get stats {
    return $ProductStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String storeId,
      String categoryId,
      String name,
      String description,
      String? shortDescription,
      List<String> images,
      List<String> videos,
      String thumbnailImage,
      ProductPricing pricing,
      ProductInventory inventory,
      List<ProductVariant> variants,
      Map<String, dynamic> customAttributes,
      List<String> tags,
      List<String> searchKeywords,
      ProductSettings settings,
      ProductStats stats,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      @TimestampConverter() DateTime? publishedAt});

  @override
  $ProductPricingCopyWith<$Res> get pricing;
  @override
  $ProductInventoryCopyWith<$Res> get inventory;
  @override
  $ProductSettingsCopyWith<$Res> get settings;
  @override
  $ProductStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storeId = null,
    Object? categoryId = null,
    Object? name = null,
    Object? description = null,
    Object? shortDescription = freezed,
    Object? images = null,
    Object? videos = null,
    Object? thumbnailImage = null,
    Object? pricing = null,
    Object? inventory = null,
    Object? variants = null,
    Object? customAttributes = null,
    Object? tags = null,
    Object? searchKeywords = null,
    Object? settings = null,
    Object? stats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as ProductPricing,
      inventory: null == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as ProductInventory,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariant>,
      customAttributes: null == customAttributes
          ? _value._customAttributes
          : customAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKeywords: null == searchKeywords
          ? _value._searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ProductSettings,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ProductStats,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      required this.storeId,
      required this.categoryId,
      required this.name,
      required this.description,
      this.shortDescription,
      final List<String> images = const [],
      final List<String> videos = const [],
      required this.thumbnailImage,
      required this.pricing,
      required this.inventory,
      final List<ProductVariant> variants = const [],
      final Map<String, dynamic> customAttributes = const {},
      final List<String> tags = const [],
      final List<String> searchKeywords = const [],
      required this.settings,
      required this.stats,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      @TimestampConverter() this.publishedAt})
      : _images = images,
        _videos = videos,
        _variants = variants,
        _customAttributes = customAttributes,
        _tags = tags,
        _searchKeywords = searchKeywords;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String id;
  @override
  final String storeId;
  @override
  final String categoryId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? shortDescription;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _videos;
  @override
  @JsonKey()
  List<String> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  final String thumbnailImage;
  @override
  final ProductPricing pricing;
  @override
  final ProductInventory inventory;
  final List<ProductVariant> _variants;
  @override
  @JsonKey()
  List<ProductVariant> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final Map<String, dynamic> _customAttributes;
  @override
  @JsonKey()
  Map<String, dynamic> get customAttributes {
    if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customAttributes);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _searchKeywords;
  @override
  @JsonKey()
  List<String> get searchKeywords {
    if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeywords);
  }

  @override
  final ProductSettings settings;
  @override
  final ProductStats stats;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  @TimestampConverter()
  final DateTime? publishedAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, storeId: $storeId, categoryId: $categoryId, name: $name, description: $description, shortDescription: $shortDescription, images: $images, videos: $videos, thumbnailImage: $thumbnailImage, pricing: $pricing, inventory: $inventory, variants: $variants, customAttributes: $customAttributes, tags: $tags, searchKeywords: $searchKeywords, settings: $settings, stats: $stats, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.inventory, inventory) ||
                other.inventory == inventory) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality()
                .equals(other._customAttributes, _customAttributes) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._searchKeywords, _searchKeywords) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        storeId,
        categoryId,
        name,
        description,
        shortDescription,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_videos),
        thumbnailImage,
        pricing,
        inventory,
        const DeepCollectionEquality().hash(_variants),
        const DeepCollectionEquality().hash(_customAttributes),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_searchKeywords),
        settings,
        stats,
        createdAt,
        updatedAt,
        publishedAt
      ]);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final String id,
      required final String storeId,
      required final String categoryId,
      required final String name,
      required final String description,
      final String? shortDescription,
      final List<String> images,
      final List<String> videos,
      required final String thumbnailImage,
      required final ProductPricing pricing,
      required final ProductInventory inventory,
      final List<ProductVariant> variants,
      final Map<String, dynamic> customAttributes,
      final List<String> tags,
      final List<String> searchKeywords,
      required final ProductSettings settings,
      required final ProductStats stats,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt,
      @TimestampConverter() final DateTime? publishedAt}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get id;
  @override
  String get storeId;
  @override
  String get categoryId;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get shortDescription;
  @override
  List<String> get images;
  @override
  List<String> get videos;
  @override
  String get thumbnailImage;
  @override
  ProductPricing get pricing;
  @override
  ProductInventory get inventory;
  @override
  List<ProductVariant> get variants;
  @override
  Map<String, dynamic> get customAttributes;
  @override
  List<String> get tags;
  @override
  List<String> get searchKeywords;
  @override
  ProductSettings get settings;
  @override
  ProductStats get stats;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @TimestampConverter()
  DateTime? get publishedAt;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductPricing _$ProductPricingFromJson(Map<String, dynamic> json) {
  return _ProductPricing.fromJson(json);
}

/// @nodoc
mixin _$ProductPricing {
  double get basePrice => throw _privateConstructorUsedError;
  double? get salePrice => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PriceType get priceType => throw _privateConstructorUsedError;
  double? get minimumPrice => throw _privateConstructorUsedError;
  double? get maximumPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductPricing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPricingCopyWith<ProductPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPricingCopyWith<$Res> {
  factory $ProductPricingCopyWith(
          ProductPricing value, $Res Function(ProductPricing) then) =
      _$ProductPricingCopyWithImpl<$Res, ProductPricing>;
  @useResult
  $Res call(
      {double basePrice,
      double? salePrice,
      String currency,
      PriceType priceType,
      double? minimumPrice,
      double? maximumPrice});
}

/// @nodoc
class _$ProductPricingCopyWithImpl<$Res, $Val extends ProductPricing>
    implements $ProductPricingCopyWith<$Res> {
  _$ProductPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePrice = null,
    Object? salePrice = freezed,
    Object? currency = null,
    Object? priceType = null,
    Object? minimumPrice = freezed,
    Object? maximumPrice = freezed,
  }) {
    return _then(_value.copyWith(
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceType,
      minimumPrice: freezed == minimumPrice
          ? _value.minimumPrice
          : minimumPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumPrice: freezed == maximumPrice
          ? _value.maximumPrice
          : maximumPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPricingImplCopyWith<$Res>
    implements $ProductPricingCopyWith<$Res> {
  factory _$$ProductPricingImplCopyWith(_$ProductPricingImpl value,
          $Res Function(_$ProductPricingImpl) then) =
      __$$ProductPricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double basePrice,
      double? salePrice,
      String currency,
      PriceType priceType,
      double? minimumPrice,
      double? maximumPrice});
}

/// @nodoc
class __$$ProductPricingImplCopyWithImpl<$Res>
    extends _$ProductPricingCopyWithImpl<$Res, _$ProductPricingImpl>
    implements _$$ProductPricingImplCopyWith<$Res> {
  __$$ProductPricingImplCopyWithImpl(
      _$ProductPricingImpl _value, $Res Function(_$ProductPricingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePrice = null,
    Object? salePrice = freezed,
    Object? currency = null,
    Object? priceType = null,
    Object? minimumPrice = freezed,
    Object? maximumPrice = freezed,
  }) {
    return _then(_$ProductPricingImpl(
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceType,
      minimumPrice: freezed == minimumPrice
          ? _value.minimumPrice
          : minimumPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumPrice: freezed == maximumPrice
          ? _value.maximumPrice
          : maximumPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductPricingImpl implements _ProductPricing {
  const _$ProductPricingImpl(
      {required this.basePrice,
      this.salePrice,
      this.currency = 'LKR',
      this.priceType = PriceType.fixed,
      this.minimumPrice,
      this.maximumPrice});

  factory _$ProductPricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPricingImplFromJson(json);

  @override
  final double basePrice;
  @override
  final double? salePrice;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final PriceType priceType;
  @override
  final double? minimumPrice;
  @override
  final double? maximumPrice;

  @override
  String toString() {
    return 'ProductPricing(basePrice: $basePrice, salePrice: $salePrice, currency: $currency, priceType: $priceType, minimumPrice: $minimumPrice, maximumPrice: $maximumPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPricingImpl &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.minimumPrice, minimumPrice) ||
                other.minimumPrice == minimumPrice) &&
            (identical(other.maximumPrice, maximumPrice) ||
                other.maximumPrice == maximumPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, basePrice, salePrice, currency,
      priceType, minimumPrice, maximumPrice);

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPricingImplCopyWith<_$ProductPricingImpl> get copyWith =>
      __$$ProductPricingImplCopyWithImpl<_$ProductPricingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPricingImplToJson(
      this,
    );
  }
}

abstract class _ProductPricing implements ProductPricing {
  const factory _ProductPricing(
      {required final double basePrice,
      final double? salePrice,
      final String currency,
      final PriceType priceType,
      final double? minimumPrice,
      final double? maximumPrice}) = _$ProductPricingImpl;

  factory _ProductPricing.fromJson(Map<String, dynamic> json) =
      _$ProductPricingImpl.fromJson;

  @override
  double get basePrice;
  @override
  double? get salePrice;
  @override
  String get currency;
  @override
  PriceType get priceType;
  @override
  double? get minimumPrice;
  @override
  double? get maximumPrice;

  /// Create a copy of ProductPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPricingImplCopyWith<_$ProductPricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductInventory _$ProductInventoryFromJson(Map<String, dynamic> json) {
  return _ProductInventory.fromJson(json);
}

/// @nodoc
mixin _$ProductInventory {
  bool get trackInventory => throw _privateConstructorUsedError;
  int? get stockQuantity => throw _privateConstructorUsedError;
  bool get allowBackorder => throw _privateConstructorUsedError;
  StockStatus get stockStatus => throw _privateConstructorUsedError;

  /// Serializes this ProductInventory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductInventory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductInventoryCopyWith<ProductInventory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductInventoryCopyWith<$Res> {
  factory $ProductInventoryCopyWith(
          ProductInventory value, $Res Function(ProductInventory) then) =
      _$ProductInventoryCopyWithImpl<$Res, ProductInventory>;
  @useResult
  $Res call(
      {bool trackInventory,
      int? stockQuantity,
      bool allowBackorder,
      StockStatus stockStatus});
}

/// @nodoc
class _$ProductInventoryCopyWithImpl<$Res, $Val extends ProductInventory>
    implements $ProductInventoryCopyWith<$Res> {
  _$ProductInventoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductInventory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackInventory = null,
    Object? stockQuantity = freezed,
    Object? allowBackorder = null,
    Object? stockStatus = null,
  }) {
    return _then(_value.copyWith(
      trackInventory: null == trackInventory
          ? _value.trackInventory
          : trackInventory // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      allowBackorder: null == allowBackorder
          ? _value.allowBackorder
          : allowBackorder // ignore: cast_nullable_to_non_nullable
              as bool,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as StockStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductInventoryImplCopyWith<$Res>
    implements $ProductInventoryCopyWith<$Res> {
  factory _$$ProductInventoryImplCopyWith(_$ProductInventoryImpl value,
          $Res Function(_$ProductInventoryImpl) then) =
      __$$ProductInventoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool trackInventory,
      int? stockQuantity,
      bool allowBackorder,
      StockStatus stockStatus});
}

/// @nodoc
class __$$ProductInventoryImplCopyWithImpl<$Res>
    extends _$ProductInventoryCopyWithImpl<$Res, _$ProductInventoryImpl>
    implements _$$ProductInventoryImplCopyWith<$Res> {
  __$$ProductInventoryImplCopyWithImpl(_$ProductInventoryImpl _value,
      $Res Function(_$ProductInventoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductInventory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackInventory = null,
    Object? stockQuantity = freezed,
    Object? allowBackorder = null,
    Object? stockStatus = null,
  }) {
    return _then(_$ProductInventoryImpl(
      trackInventory: null == trackInventory
          ? _value.trackInventory
          : trackInventory // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      allowBackorder: null == allowBackorder
          ? _value.allowBackorder
          : allowBackorder // ignore: cast_nullable_to_non_nullable
              as bool,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as StockStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductInventoryImpl implements _ProductInventory {
  const _$ProductInventoryImpl(
      {this.trackInventory = true,
      this.stockQuantity,
      this.allowBackorder = false,
      this.stockStatus = StockStatus.inStock});

  factory _$ProductInventoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductInventoryImplFromJson(json);

  @override
  @JsonKey()
  final bool trackInventory;
  @override
  final int? stockQuantity;
  @override
  @JsonKey()
  final bool allowBackorder;
  @override
  @JsonKey()
  final StockStatus stockStatus;

  @override
  String toString() {
    return 'ProductInventory(trackInventory: $trackInventory, stockQuantity: $stockQuantity, allowBackorder: $allowBackorder, stockStatus: $stockStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductInventoryImpl &&
            (identical(other.trackInventory, trackInventory) ||
                other.trackInventory == trackInventory) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.allowBackorder, allowBackorder) ||
                other.allowBackorder == allowBackorder) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, trackInventory, stockQuantity, allowBackorder, stockStatus);

  /// Create a copy of ProductInventory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductInventoryImplCopyWith<_$ProductInventoryImpl> get copyWith =>
      __$$ProductInventoryImplCopyWithImpl<_$ProductInventoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductInventoryImplToJson(
      this,
    );
  }
}

abstract class _ProductInventory implements ProductInventory {
  const factory _ProductInventory(
      {final bool trackInventory,
      final int? stockQuantity,
      final bool allowBackorder,
      final StockStatus stockStatus}) = _$ProductInventoryImpl;

  factory _ProductInventory.fromJson(Map<String, dynamic> json) =
      _$ProductInventoryImpl.fromJson;

  @override
  bool get trackInventory;
  @override
  int? get stockQuantity;
  @override
  bool get allowBackorder;
  @override
  StockStatus get stockStatus;

  /// Create a copy of ProductInventory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductInventoryImplCopyWith<_$ProductInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) {
  return _ProductVariant.fromJson(json);
}

/// @nodoc
mixin _$ProductVariant {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<String, String> get attributes => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get stockQuantity => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this ProductVariant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductVariantCopyWith<ProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCopyWith<$Res> {
  factory $ProductVariantCopyWith(
          ProductVariant value, $Res Function(ProductVariant) then) =
      _$ProductVariantCopyWithImpl<$Res, ProductVariant>;
  @useResult
  $Res call(
      {String id,
      String name,
      Map<String, String> attributes,
      double? price,
      int? stockQuantity,
      String? sku,
      String? image});
}

/// @nodoc
class _$ProductVariantCopyWithImpl<$Res, $Val extends ProductVariant>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? attributes = null,
    Object? price = freezed,
    Object? stockQuantity = freezed,
    Object? sku = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantImplCopyWith<$Res>
    implements $ProductVariantCopyWith<$Res> {
  factory _$$ProductVariantImplCopyWith(_$ProductVariantImpl value,
          $Res Function(_$ProductVariantImpl) then) =
      __$$ProductVariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Map<String, String> attributes,
      double? price,
      int? stockQuantity,
      String? sku,
      String? image});
}

/// @nodoc
class __$$ProductVariantImplCopyWithImpl<$Res>
    extends _$ProductVariantCopyWithImpl<$Res, _$ProductVariantImpl>
    implements _$$ProductVariantImplCopyWith<$Res> {
  __$$ProductVariantImplCopyWithImpl(
      _$ProductVariantImpl _value, $Res Function(_$ProductVariantImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? attributes = null,
    Object? price = freezed,
    Object? stockQuantity = freezed,
    Object? sku = freezed,
    Object? image = freezed,
  }) {
    return _then(_$ProductVariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantImpl implements _ProductVariant {
  const _$ProductVariantImpl(
      {required this.id,
      required this.name,
      final Map<String, String> attributes = const {},
      this.price,
      this.stockQuantity,
      this.sku,
      this.image})
      : _attributes = attributes;

  factory _$ProductVariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final Map<String, String> _attributes;
  @override
  @JsonKey()
  Map<String, String> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  final double? price;
  @override
  final int? stockQuantity;
  @override
  final String? sku;
  @override
  final String? image;

  @override
  String toString() {
    return 'ProductVariant(id: $id, name: $name, attributes: $attributes, price: $price, stockQuantity: $stockQuantity, sku: $sku, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_attributes),
      price,
      stockQuantity,
      sku,
      image);

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantImplCopyWith<_$ProductVariantImpl> get copyWith =>
      __$$ProductVariantImplCopyWithImpl<_$ProductVariantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantImplToJson(
      this,
    );
  }
}

abstract class _ProductVariant implements ProductVariant {
  const factory _ProductVariant(
      {required final String id,
      required final String name,
      final Map<String, String> attributes,
      final double? price,
      final int? stockQuantity,
      final String? sku,
      final String? image}) = _$ProductVariantImpl;

  factory _ProductVariant.fromJson(Map<String, dynamic> json) =
      _$ProductVariantImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Map<String, String> get attributes;
  @override
  double? get price;
  @override
  int? get stockQuantity;
  @override
  String? get sku;
  @override
  String? get image;

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductVariantImplCopyWith<_$ProductVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductSettings _$ProductSettingsFromJson(Map<String, dynamic> json) {
  return _ProductSettings.fromJson(json);
}

/// @nodoc
mixin _$ProductSettings {
  bool get isActive => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  bool get allowReviews => throw _privateConstructorUsedError;
  bool get requiresApproval => throw _privateConstructorUsedError;
  String? get processingTime => throw _privateConstructorUsedError;
  double? get shippingWeight => throw _privateConstructorUsedError;
  ProductDimensions? get dimensions => throw _privateConstructorUsedError;

  /// Serializes this ProductSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductSettingsCopyWith<ProductSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSettingsCopyWith<$Res> {
  factory $ProductSettingsCopyWith(
          ProductSettings value, $Res Function(ProductSettings) then) =
      _$ProductSettingsCopyWithImpl<$Res, ProductSettings>;
  @useResult
  $Res call(
      {bool isActive,
      bool isFeatured,
      bool allowReviews,
      bool requiresApproval,
      String? processingTime,
      double? shippingWeight,
      ProductDimensions? dimensions});

  $ProductDimensionsCopyWith<$Res>? get dimensions;
}

/// @nodoc
class _$ProductSettingsCopyWithImpl<$Res, $Val extends ProductSettings>
    implements $ProductSettingsCopyWith<$Res> {
  _$ProductSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? isFeatured = null,
    Object? allowReviews = null,
    Object? requiresApproval = null,
    Object? processingTime = freezed,
    Object? shippingWeight = freezed,
    Object? dimensions = freezed,
  }) {
    return _then(_value.copyWith(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      allowReviews: null == allowReviews
          ? _value.allowReviews
          : allowReviews // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresApproval: null == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      processingTime: freezed == processingTime
          ? _value.processingTime
          : processingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingWeight: freezed == shippingWeight
          ? _value.shippingWeight
          : shippingWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as ProductDimensions?,
    ) as $Val);
  }

  /// Create a copy of ProductSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductDimensionsCopyWith<$Res>? get dimensions {
    if (_value.dimensions == null) {
      return null;
    }

    return $ProductDimensionsCopyWith<$Res>(_value.dimensions!, (value) {
      return _then(_value.copyWith(dimensions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductSettingsImplCopyWith<$Res>
    implements $ProductSettingsCopyWith<$Res> {
  factory _$$ProductSettingsImplCopyWith(_$ProductSettingsImpl value,
          $Res Function(_$ProductSettingsImpl) then) =
      __$$ProductSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isActive,
      bool isFeatured,
      bool allowReviews,
      bool requiresApproval,
      String? processingTime,
      double? shippingWeight,
      ProductDimensions? dimensions});

  @override
  $ProductDimensionsCopyWith<$Res>? get dimensions;
}

/// @nodoc
class __$$ProductSettingsImplCopyWithImpl<$Res>
    extends _$ProductSettingsCopyWithImpl<$Res, _$ProductSettingsImpl>
    implements _$$ProductSettingsImplCopyWith<$Res> {
  __$$ProductSettingsImplCopyWithImpl(
      _$ProductSettingsImpl _value, $Res Function(_$ProductSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? isFeatured = null,
    Object? allowReviews = null,
    Object? requiresApproval = null,
    Object? processingTime = freezed,
    Object? shippingWeight = freezed,
    Object? dimensions = freezed,
  }) {
    return _then(_$ProductSettingsImpl(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      allowReviews: null == allowReviews
          ? _value.allowReviews
          : allowReviews // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresApproval: null == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      processingTime: freezed == processingTime
          ? _value.processingTime
          : processingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingWeight: freezed == shippingWeight
          ? _value.shippingWeight
          : shippingWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as ProductDimensions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductSettingsImpl implements _ProductSettings {
  const _$ProductSettingsImpl(
      {this.isActive = true,
      this.isFeatured = false,
      this.allowReviews = true,
      this.requiresApproval = false,
      this.processingTime,
      this.shippingWeight,
      this.dimensions});

  factory _$ProductSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final bool allowReviews;
  @override
  @JsonKey()
  final bool requiresApproval;
  @override
  final String? processingTime;
  @override
  final double? shippingWeight;
  @override
  final ProductDimensions? dimensions;

  @override
  String toString() {
    return 'ProductSettings(isActive: $isActive, isFeatured: $isFeatured, allowReviews: $allowReviews, requiresApproval: $requiresApproval, processingTime: $processingTime, shippingWeight: $shippingWeight, dimensions: $dimensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSettingsImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.allowReviews, allowReviews) ||
                other.allowReviews == allowReviews) &&
            (identical(other.requiresApproval, requiresApproval) ||
                other.requiresApproval == requiresApproval) &&
            (identical(other.processingTime, processingTime) ||
                other.processingTime == processingTime) &&
            (identical(other.shippingWeight, shippingWeight) ||
                other.shippingWeight == shippingWeight) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isActive,
      isFeatured,
      allowReviews,
      requiresApproval,
      processingTime,
      shippingWeight,
      dimensions);

  /// Create a copy of ProductSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSettingsImplCopyWith<_$ProductSettingsImpl> get copyWith =>
      __$$ProductSettingsImplCopyWithImpl<_$ProductSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductSettingsImplToJson(
      this,
    );
  }
}

abstract class _ProductSettings implements ProductSettings {
  const factory _ProductSettings(
      {final bool isActive,
      final bool isFeatured,
      final bool allowReviews,
      final bool requiresApproval,
      final String? processingTime,
      final double? shippingWeight,
      final ProductDimensions? dimensions}) = _$ProductSettingsImpl;

  factory _ProductSettings.fromJson(Map<String, dynamic> json) =
      _$ProductSettingsImpl.fromJson;

  @override
  bool get isActive;
  @override
  bool get isFeatured;
  @override
  bool get allowReviews;
  @override
  bool get requiresApproval;
  @override
  String? get processingTime;
  @override
  double? get shippingWeight;
  @override
  ProductDimensions? get dimensions;

  /// Create a copy of ProductSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSettingsImplCopyWith<_$ProductSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductDimensions _$ProductDimensionsFromJson(Map<String, dynamic> json) {
  return _ProductDimensions.fromJson(json);
}

/// @nodoc
mixin _$ProductDimensions {
  double? get length => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Serializes this ProductDimensions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDimensions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDimensionsCopyWith<ProductDimensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDimensionsCopyWith<$Res> {
  factory $ProductDimensionsCopyWith(
          ProductDimensions value, $Res Function(ProductDimensions) then) =
      _$ProductDimensionsCopyWithImpl<$Res, ProductDimensions>;
  @useResult
  $Res call({double? length, double? width, double? height, String unit});
}

/// @nodoc
class _$ProductDimensionsCopyWithImpl<$Res, $Val extends ProductDimensions>
    implements $ProductDimensionsCopyWith<$Res> {
  _$ProductDimensionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDimensions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDimensionsImplCopyWith<$Res>
    implements $ProductDimensionsCopyWith<$Res> {
  factory _$$ProductDimensionsImplCopyWith(_$ProductDimensionsImpl value,
          $Res Function(_$ProductDimensionsImpl) then) =
      __$$ProductDimensionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? length, double? width, double? height, String unit});
}

/// @nodoc
class __$$ProductDimensionsImplCopyWithImpl<$Res>
    extends _$ProductDimensionsCopyWithImpl<$Res, _$ProductDimensionsImpl>
    implements _$$ProductDimensionsImplCopyWith<$Res> {
  __$$ProductDimensionsImplCopyWithImpl(_$ProductDimensionsImpl _value,
      $Res Function(_$ProductDimensionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDimensions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? unit = null,
  }) {
    return _then(_$ProductDimensionsImpl(
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDimensionsImpl implements _ProductDimensions {
  const _$ProductDimensionsImpl(
      {this.length, this.width, this.height, this.unit = 'cm'});

  factory _$ProductDimensionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDimensionsImplFromJson(json);

  @override
  final double? length;
  @override
  final double? width;
  @override
  final double? height;
  @override
  @JsonKey()
  final String unit;

  @override
  String toString() {
    return 'ProductDimensions(length: $length, width: $width, height: $height, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDimensionsImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, length, width, height, unit);

  /// Create a copy of ProductDimensions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDimensionsImplCopyWith<_$ProductDimensionsImpl> get copyWith =>
      __$$ProductDimensionsImplCopyWithImpl<_$ProductDimensionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDimensionsImplToJson(
      this,
    );
  }
}

abstract class _ProductDimensions implements ProductDimensions {
  const factory _ProductDimensions(
      {final double? length,
      final double? width,
      final double? height,
      final String unit}) = _$ProductDimensionsImpl;

  factory _ProductDimensions.fromJson(Map<String, dynamic> json) =
      _$ProductDimensionsImpl.fromJson;

  @override
  double? get length;
  @override
  double? get width;
  @override
  double? get height;
  @override
  String get unit;

  /// Create a copy of ProductDimensions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDimensionsImplCopyWith<_$ProductDimensionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductStats _$ProductStatsFromJson(Map<String, dynamic> json) {
  return _ProductStats.fromJson(json);
}

/// @nodoc
mixin _$ProductStats {
  int get viewCount => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  int get wishlistCount => throw _privateConstructorUsedError;

  /// Serializes this ProductStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStatsCopyWith<ProductStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStatsCopyWith<$Res> {
  factory $ProductStatsCopyWith(
          ProductStats value, $Res Function(ProductStats) then) =
      _$ProductStatsCopyWithImpl<$Res, ProductStats>;
  @useResult
  $Res call(
      {int viewCount,
      int orderCount,
      double rating,
      int reviewCount,
      int wishlistCount});
}

/// @nodoc
class _$ProductStatsCopyWithImpl<$Res, $Val extends ProductStats>
    implements $ProductStatsCopyWith<$Res> {
  _$ProductStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewCount = null,
    Object? orderCount = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? wishlistCount = null,
  }) {
    return _then(_value.copyWith(
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      wishlistCount: null == wishlistCount
          ? _value.wishlistCount
          : wishlistCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStatsImplCopyWith<$Res>
    implements $ProductStatsCopyWith<$Res> {
  factory _$$ProductStatsImplCopyWith(
          _$ProductStatsImpl value, $Res Function(_$ProductStatsImpl) then) =
      __$$ProductStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int viewCount,
      int orderCount,
      double rating,
      int reviewCount,
      int wishlistCount});
}

/// @nodoc
class __$$ProductStatsImplCopyWithImpl<$Res>
    extends _$ProductStatsCopyWithImpl<$Res, _$ProductStatsImpl>
    implements _$$ProductStatsImplCopyWith<$Res> {
  __$$ProductStatsImplCopyWithImpl(
      _$ProductStatsImpl _value, $Res Function(_$ProductStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewCount = null,
    Object? orderCount = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? wishlistCount = null,
  }) {
    return _then(_$ProductStatsImpl(
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      wishlistCount: null == wishlistCount
          ? _value.wishlistCount
          : wishlistCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStatsImpl implements _ProductStats {
  const _$ProductStatsImpl(
      {this.viewCount = 0,
      this.orderCount = 0,
      this.rating = 0.0,
      this.reviewCount = 0,
      this.wishlistCount = 0});

  factory _$ProductStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStatsImplFromJson(json);

  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int orderCount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  @JsonKey()
  final int wishlistCount;

  @override
  String toString() {
    return 'ProductStats(viewCount: $viewCount, orderCount: $orderCount, rating: $rating, reviewCount: $reviewCount, wishlistCount: $wishlistCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStatsImpl &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.wishlistCount, wishlistCount) ||
                other.wishlistCount == wishlistCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, viewCount, orderCount, rating, reviewCount, wishlistCount);

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStatsImplCopyWith<_$ProductStatsImpl> get copyWith =>
      __$$ProductStatsImplCopyWithImpl<_$ProductStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStatsImplToJson(
      this,
    );
  }
}

abstract class _ProductStats implements ProductStats {
  const factory _ProductStats(
      {final int viewCount,
      final int orderCount,
      final double rating,
      final int reviewCount,
      final int wishlistCount}) = _$ProductStatsImpl;

  factory _ProductStats.fromJson(Map<String, dynamic> json) =
      _$ProductStatsImpl.fromJson;

  @override
  int get viewCount;
  @override
  int get orderCount;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  int get wishlistCount;

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStatsImplCopyWith<_$ProductStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
