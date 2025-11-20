// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_behavior_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBehaviorModelImpl _$$UserBehaviorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBehaviorModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      action: $enumDecode(_$UserActionEnumMap, json['action']),
      targetId: json['targetId'] as String,
      targetType: json['targetType'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
      sessionId: json['sessionId'] as String?,
      deviceInfo: json['deviceInfo'] as String?,
    );

Map<String, dynamic> _$$UserBehaviorModelImplToJson(
        _$UserBehaviorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'action': _$UserActionEnumMap[instance.action]!,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'metadata': instance.metadata,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'sessionId': instance.sessionId,
      'deviceInfo': instance.deviceInfo,
    };

const _$UserActionEnumMap = {
  UserAction.view: 'view',
  UserAction.click: 'click',
  UserAction.addToCart: 'add_to_cart',
  UserAction.removeFromCart: 'remove_from_cart',
  UserAction.purchase: 'purchase',
  UserAction.wishlistAdd: 'wishlist_add',
  UserAction.wishlistRemove: 'wishlist_remove',
  UserAction.search: 'search',
  UserAction.filter: 'filter',
  UserAction.categoryBrowse: 'category_browse',
  UserAction.storeVisit: 'store_visit',
  UserAction.share: 'share',
  UserAction.review: 'review',
  UserAction.appOpen: 'app_open',
  UserAction.sessionStart: 'session_start',
  UserAction.sessionEnd: 'session_end',
};

_$UserPreferencesModelImpl _$$UserPreferencesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesModelImpl(
      userId: json['userId'] as String,
      categoryPreferences:
          (json['categoryPreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ) ??
              const {},
      brandPreferences:
          (json['brandPreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ) ??
              const {},
      priceRangePreferences:
          (json['priceRangePreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ) ??
              const {},
      favoriteStores: (json['favoriteStores'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      searchHistory: (json['searchHistory'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      viewedProducts: (json['viewedProducts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      purchasedCategories: (json['purchasedCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastUpdated:
          const TimestampConverter().fromJson(json['lastUpdated'] as Timestamp),
      totalInteractions: (json['totalInteractions'] as num?)?.toInt() ?? 0,
      avgSessionDuration:
          (json['avgSessionDuration'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$UserPreferencesModelImplToJson(
        _$UserPreferencesModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'categoryPreferences': instance.categoryPreferences,
      'brandPreferences': instance.brandPreferences,
      'priceRangePreferences': instance.priceRangePreferences,
      'favoriteStores': instance.favoriteStores,
      'searchHistory': instance.searchHistory,
      'viewedProducts': instance.viewedProducts,
      'purchasedCategories': instance.purchasedCategories,
      'lastUpdated': const TimestampConverter().toJson(instance.lastUpdated),
      'totalInteractions': instance.totalInteractions,
      'avgSessionDuration': instance.avgSessionDuration,
    };

_$ProductAffinityModelImpl _$$ProductAffinityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductAffinityModelImpl(
      productId1: json['productId1'] as String,
      productId2: json['productId2'] as String,
      affinityScore: (json['affinityScore'] as num).toDouble(),
      coOccurrences: (json['coOccurrences'] as num).toInt(),
      lastUpdated:
          const TimestampConverter().fromJson(json['lastUpdated'] as Timestamp),
    );

Map<String, dynamic> _$$ProductAffinityModelImplToJson(
        _$ProductAffinityModelImpl instance) =>
    <String, dynamic>{
      'productId1': instance.productId1,
      'productId2': instance.productId2,
      'affinityScore': instance.affinityScore,
      'coOccurrences': instance.coOccurrences,
      'lastUpdated': const TimestampConverter().toJson(instance.lastUpdated),
    };

_$RecommendationModelImpl _$$RecommendationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendationModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      productIds: (json['productIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: $enumDecode(_$RecommendationTypeEnumMap, json['type']),
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      algorithm: json['algorithm'] as String,
      context: json['context'] as Map<String, dynamic>?,
      generatedAt:
          const TimestampConverter().fromJson(json['generatedAt'] as Timestamp),
      expiresAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiresAt'], const TimestampConverter().fromJson),
      clicked: json['clicked'] as bool? ?? false,
      converted: json['converted'] as bool? ?? false,
    );

Map<String, dynamic> _$$RecommendationModelImplToJson(
        _$RecommendationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'productIds': instance.productIds,
      'type': _$RecommendationTypeEnumMap[instance.type]!,
      'confidenceScore': instance.confidenceScore,
      'algorithm': instance.algorithm,
      'context': instance.context,
      'generatedAt': const TimestampConverter().toJson(instance.generatedAt),
      'expiresAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiresAt, const TimestampConverter().toJson),
      'clicked': instance.clicked,
      'converted': instance.converted,
    };

const _$RecommendationTypeEnumMap = {
  RecommendationType.personalized: 'personalized',
  RecommendationType.trending: 'trending',
  RecommendationType.similar: 'similar',
  RecommendationType.collaborative: 'collaborative',
  RecommendationType.categoryBased: 'category_based',
  RecommendationType.recentlyViewed: 'recently_viewed',
  RecommendationType.newArrivals: 'new_arrivals',
  RecommendationType.fallback: 'fallback',
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

_$RecommendationContextImpl _$$RecommendationContextImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendationContextImpl(
      userId: json['userId'] as String,
      currentProductId: json['currentProductId'] as String?,
      currentCategoryId: json['currentCategoryId'] as String?,
      currentStoreId: json['currentStoreId'] as String?,
      searchQuery: json['searchQuery'] as String?,
      cartProductIds: (json['cartProductIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      wishlistProductIds: (json['wishlistProductIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      additionalContext:
          json['additionalContext'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$RecommendationContextImplToJson(
        _$RecommendationContextImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentProductId': instance.currentProductId,
      'currentCategoryId': instance.currentCategoryId,
      'currentStoreId': instance.currentStoreId,
      'searchQuery': instance.searchQuery,
      'cartProductIds': instance.cartProductIds,
      'wishlistProductIds': instance.wishlistProductIds,
      'additionalContext': instance.additionalContext,
    };
