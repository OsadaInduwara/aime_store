// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_behavior_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBehaviorModel _$UserBehaviorModelFromJson(Map<String, dynamic> json) {
  return _UserBehaviorModel.fromJson(json);
}

/// @nodoc
mixin _$UserBehaviorModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  UserAction get action => throw _privateConstructorUsedError;
  String get targetId =>
      throw _privateConstructorUsedError; // productId, categoryId, storeId, etc.
  String get targetType =>
      throw _privateConstructorUsedError; // 'product', 'category', 'store', 'search'
  Map<String, dynamic>? get metadata =>
      throw _privateConstructorUsedError; // Additional context data
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get sessionId =>
      throw _privateConstructorUsedError; // Track user sessions
  String? get deviceInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBehaviorModelCopyWith<UserBehaviorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBehaviorModelCopyWith<$Res> {
  factory $UserBehaviorModelCopyWith(
          UserBehaviorModel value, $Res Function(UserBehaviorModel) then) =
      _$UserBehaviorModelCopyWithImpl<$Res, UserBehaviorModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      UserAction action,
      String targetId,
      String targetType,
      Map<String, dynamic>? metadata,
      @TimestampConverter() DateTime timestamp,
      String? sessionId,
      String? deviceInfo});
}

/// @nodoc
class _$UserBehaviorModelCopyWithImpl<$Res, $Val extends UserBehaviorModel>
    implements $UserBehaviorModelCopyWith<$Res> {
  _$UserBehaviorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? action = null,
    Object? targetId = null,
    Object? targetType = null,
    Object? metadata = freezed,
    Object? timestamp = null,
    Object? sessionId = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UserAction,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBehaviorModelImplCopyWith<$Res>
    implements $UserBehaviorModelCopyWith<$Res> {
  factory _$$UserBehaviorModelImplCopyWith(_$UserBehaviorModelImpl value,
          $Res Function(_$UserBehaviorModelImpl) then) =
      __$$UserBehaviorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      UserAction action,
      String targetId,
      String targetType,
      Map<String, dynamic>? metadata,
      @TimestampConverter() DateTime timestamp,
      String? sessionId,
      String? deviceInfo});
}

/// @nodoc
class __$$UserBehaviorModelImplCopyWithImpl<$Res>
    extends _$UserBehaviorModelCopyWithImpl<$Res, _$UserBehaviorModelImpl>
    implements _$$UserBehaviorModelImplCopyWith<$Res> {
  __$$UserBehaviorModelImplCopyWithImpl(_$UserBehaviorModelImpl _value,
      $Res Function(_$UserBehaviorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? action = null,
    Object? targetId = null,
    Object? targetType = null,
    Object? metadata = freezed,
    Object? timestamp = null,
    Object? sessionId = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_$UserBehaviorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UserAction,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBehaviorModelImpl implements _UserBehaviorModel {
  const _$UserBehaviorModelImpl(
      {required this.id,
      required this.userId,
      required this.action,
      required this.targetId,
      required this.targetType,
      final Map<String, dynamic>? metadata,
      @TimestampConverter() required this.timestamp,
      this.sessionId,
      this.deviceInfo})
      : _metadata = metadata;

  factory _$UserBehaviorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBehaviorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final UserAction action;
  @override
  final String targetId;
// productId, categoryId, storeId, etc.
  @override
  final String targetType;
// 'product', 'category', 'store', 'search'
  final Map<String, dynamic>? _metadata;
// 'product', 'category', 'store', 'search'
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// Additional context data
  @override
  @TimestampConverter()
  final DateTime timestamp;
  @override
  final String? sessionId;
// Track user sessions
  @override
  final String? deviceInfo;

  @override
  String toString() {
    return 'UserBehaviorModel(id: $id, userId: $userId, action: $action, targetId: $targetId, targetType: $targetType, metadata: $metadata, timestamp: $timestamp, sessionId: $sessionId, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBehaviorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      action,
      targetId,
      targetType,
      const DeepCollectionEquality().hash(_metadata),
      timestamp,
      sessionId,
      deviceInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBehaviorModelImplCopyWith<_$UserBehaviorModelImpl> get copyWith =>
      __$$UserBehaviorModelImplCopyWithImpl<_$UserBehaviorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBehaviorModelImplToJson(
      this,
    );
  }
}

abstract class _UserBehaviorModel implements UserBehaviorModel {
  const factory _UserBehaviorModel(
      {required final String id,
      required final String userId,
      required final UserAction action,
      required final String targetId,
      required final String targetType,
      final Map<String, dynamic>? metadata,
      @TimestampConverter() required final DateTime timestamp,
      final String? sessionId,
      final String? deviceInfo}) = _$UserBehaviorModelImpl;

  factory _UserBehaviorModel.fromJson(Map<String, dynamic> json) =
      _$UserBehaviorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  UserAction get action;
  @override
  String get targetId;
  @override // productId, categoryId, storeId, etc.
  String get targetType;
  @override // 'product', 'category', 'store', 'search'
  Map<String, dynamic>? get metadata;
  @override // Additional context data
  @TimestampConverter()
  DateTime get timestamp;
  @override
  String? get sessionId;
  @override // Track user sessions
  String? get deviceInfo;
  @override
  @JsonKey(ignore: true)
  _$$UserBehaviorModelImplCopyWith<_$UserBehaviorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferencesModel _$UserPreferencesModelFromJson(Map<String, dynamic> json) {
  return _UserPreferencesModel.fromJson(json);
}

/// @nodoc
mixin _$UserPreferencesModel {
  String get userId => throw _privateConstructorUsedError;
  Map<String, double> get categoryPreferences =>
      throw _privateConstructorUsedError; // categoryId -> preference score (0-1)
  Map<String, double> get brandPreferences =>
      throw _privateConstructorUsedError; // brand -> preference score (0-1)
  Map<String, double> get priceRangePreferences =>
      throw _privateConstructorUsedError; // price range -> preference score (0-1)
  List<String> get favoriteStores =>
      throw _privateConstructorUsedError; // storeIds
  List<String> get searchHistory =>
      throw _privateConstructorUsedError; // recent search terms
  List<String> get viewedProducts =>
      throw _privateConstructorUsedError; // recent productIds (last 50)
  List<String> get purchasedCategories =>
      throw _privateConstructorUsedError; // categories user has bought from
  @TimestampConverter()
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  int get totalInteractions =>
      throw _privateConstructorUsedError; // Total number of tracked interactions
  double get avgSessionDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesModelCopyWith<UserPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesModelCopyWith<$Res> {
  factory $UserPreferencesModelCopyWith(UserPreferencesModel value,
          $Res Function(UserPreferencesModel) then) =
      _$UserPreferencesModelCopyWithImpl<$Res, UserPreferencesModel>;
  @useResult
  $Res call(
      {String userId,
      Map<String, double> categoryPreferences,
      Map<String, double> brandPreferences,
      Map<String, double> priceRangePreferences,
      List<String> favoriteStores,
      List<String> searchHistory,
      List<String> viewedProducts,
      List<String> purchasedCategories,
      @TimestampConverter() DateTime lastUpdated,
      int totalInteractions,
      double avgSessionDuration});
}

/// @nodoc
class _$UserPreferencesModelCopyWithImpl<$Res,
        $Val extends UserPreferencesModel>
    implements $UserPreferencesModelCopyWith<$Res> {
  _$UserPreferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? categoryPreferences = null,
    Object? brandPreferences = null,
    Object? priceRangePreferences = null,
    Object? favoriteStores = null,
    Object? searchHistory = null,
    Object? viewedProducts = null,
    Object? purchasedCategories = null,
    Object? lastUpdated = null,
    Object? totalInteractions = null,
    Object? avgSessionDuration = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryPreferences: null == categoryPreferences
          ? _value.categoryPreferences
          : categoryPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      brandPreferences: null == brandPreferences
          ? _value.brandPreferences
          : brandPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      priceRangePreferences: null == priceRangePreferences
          ? _value.priceRangePreferences
          : priceRangePreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      favoriteStores: null == favoriteStores
          ? _value.favoriteStores
          : favoriteStores // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchHistory: null == searchHistory
          ? _value.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      viewedProducts: null == viewedProducts
          ? _value.viewedProducts
          : viewedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      purchasedCategories: null == purchasedCategories
          ? _value.purchasedCategories
          : purchasedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalInteractions: null == totalInteractions
          ? _value.totalInteractions
          : totalInteractions // ignore: cast_nullable_to_non_nullable
              as int,
      avgSessionDuration: null == avgSessionDuration
          ? _value.avgSessionDuration
          : avgSessionDuration // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesModelImplCopyWith<$Res>
    implements $UserPreferencesModelCopyWith<$Res> {
  factory _$$UserPreferencesModelImplCopyWith(_$UserPreferencesModelImpl value,
          $Res Function(_$UserPreferencesModelImpl) then) =
      __$$UserPreferencesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      Map<String, double> categoryPreferences,
      Map<String, double> brandPreferences,
      Map<String, double> priceRangePreferences,
      List<String> favoriteStores,
      List<String> searchHistory,
      List<String> viewedProducts,
      List<String> purchasedCategories,
      @TimestampConverter() DateTime lastUpdated,
      int totalInteractions,
      double avgSessionDuration});
}

/// @nodoc
class __$$UserPreferencesModelImplCopyWithImpl<$Res>
    extends _$UserPreferencesModelCopyWithImpl<$Res, _$UserPreferencesModelImpl>
    implements _$$UserPreferencesModelImplCopyWith<$Res> {
  __$$UserPreferencesModelImplCopyWithImpl(_$UserPreferencesModelImpl _value,
      $Res Function(_$UserPreferencesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? categoryPreferences = null,
    Object? brandPreferences = null,
    Object? priceRangePreferences = null,
    Object? favoriteStores = null,
    Object? searchHistory = null,
    Object? viewedProducts = null,
    Object? purchasedCategories = null,
    Object? lastUpdated = null,
    Object? totalInteractions = null,
    Object? avgSessionDuration = null,
  }) {
    return _then(_$UserPreferencesModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryPreferences: null == categoryPreferences
          ? _value._categoryPreferences
          : categoryPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      brandPreferences: null == brandPreferences
          ? _value._brandPreferences
          : brandPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      priceRangePreferences: null == priceRangePreferences
          ? _value._priceRangePreferences
          : priceRangePreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      favoriteStores: null == favoriteStores
          ? _value._favoriteStores
          : favoriteStores // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchHistory: null == searchHistory
          ? _value._searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      viewedProducts: null == viewedProducts
          ? _value._viewedProducts
          : viewedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      purchasedCategories: null == purchasedCategories
          ? _value._purchasedCategories
          : purchasedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalInteractions: null == totalInteractions
          ? _value.totalInteractions
          : totalInteractions // ignore: cast_nullable_to_non_nullable
              as int,
      avgSessionDuration: null == avgSessionDuration
          ? _value.avgSessionDuration
          : avgSessionDuration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesModelImpl implements _UserPreferencesModel {
  const _$UserPreferencesModelImpl(
      {required this.userId,
      final Map<String, double> categoryPreferences = const {},
      final Map<String, double> brandPreferences = const {},
      final Map<String, double> priceRangePreferences = const {},
      final List<String> favoriteStores = const [],
      final List<String> searchHistory = const [],
      final List<String> viewedProducts = const [],
      final List<String> purchasedCategories = const [],
      @TimestampConverter() required this.lastUpdated,
      this.totalInteractions = 0,
      this.avgSessionDuration = 0.0})
      : _categoryPreferences = categoryPreferences,
        _brandPreferences = brandPreferences,
        _priceRangePreferences = priceRangePreferences,
        _favoriteStores = favoriteStores,
        _searchHistory = searchHistory,
        _viewedProducts = viewedProducts,
        _purchasedCategories = purchasedCategories;

  factory _$UserPreferencesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesModelImplFromJson(json);

  @override
  final String userId;
  final Map<String, double> _categoryPreferences;
  @override
  @JsonKey()
  Map<String, double> get categoryPreferences {
    if (_categoryPreferences is EqualUnmodifiableMapView)
      return _categoryPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryPreferences);
  }

// categoryId -> preference score (0-1)
  final Map<String, double> _brandPreferences;
// categoryId -> preference score (0-1)
  @override
  @JsonKey()
  Map<String, double> get brandPreferences {
    if (_brandPreferences is EqualUnmodifiableMapView) return _brandPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_brandPreferences);
  }

// brand -> preference score (0-1)
  final Map<String, double> _priceRangePreferences;
// brand -> preference score (0-1)
  @override
  @JsonKey()
  Map<String, double> get priceRangePreferences {
    if (_priceRangePreferences is EqualUnmodifiableMapView)
      return _priceRangePreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceRangePreferences);
  }

// price range -> preference score (0-1)
  final List<String> _favoriteStores;
// price range -> preference score (0-1)
  @override
  @JsonKey()
  List<String> get favoriteStores {
    if (_favoriteStores is EqualUnmodifiableListView) return _favoriteStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteStores);
  }

// storeIds
  final List<String> _searchHistory;
// storeIds
  @override
  @JsonKey()
  List<String> get searchHistory {
    if (_searchHistory is EqualUnmodifiableListView) return _searchHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHistory);
  }

// recent search terms
  final List<String> _viewedProducts;
// recent search terms
  @override
  @JsonKey()
  List<String> get viewedProducts {
    if (_viewedProducts is EqualUnmodifiableListView) return _viewedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewedProducts);
  }

// recent productIds (last 50)
  final List<String> _purchasedCategories;
// recent productIds (last 50)
  @override
  @JsonKey()
  List<String> get purchasedCategories {
    if (_purchasedCategories is EqualUnmodifiableListView)
      return _purchasedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchasedCategories);
  }

// categories user has bought from
  @override
  @TimestampConverter()
  final DateTime lastUpdated;
  @override
  @JsonKey()
  final int totalInteractions;
// Total number of tracked interactions
  @override
  @JsonKey()
  final double avgSessionDuration;

  @override
  String toString() {
    return 'UserPreferencesModel(userId: $userId, categoryPreferences: $categoryPreferences, brandPreferences: $brandPreferences, priceRangePreferences: $priceRangePreferences, favoriteStores: $favoriteStores, searchHistory: $searchHistory, viewedProducts: $viewedProducts, purchasedCategories: $purchasedCategories, lastUpdated: $lastUpdated, totalInteractions: $totalInteractions, avgSessionDuration: $avgSessionDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._categoryPreferences, _categoryPreferences) &&
            const DeepCollectionEquality()
                .equals(other._brandPreferences, _brandPreferences) &&
            const DeepCollectionEquality()
                .equals(other._priceRangePreferences, _priceRangePreferences) &&
            const DeepCollectionEquality()
                .equals(other._favoriteStores, _favoriteStores) &&
            const DeepCollectionEquality()
                .equals(other._searchHistory, _searchHistory) &&
            const DeepCollectionEquality()
                .equals(other._viewedProducts, _viewedProducts) &&
            const DeepCollectionEquality()
                .equals(other._purchasedCategories, _purchasedCategories) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.totalInteractions, totalInteractions) ||
                other.totalInteractions == totalInteractions) &&
            (identical(other.avgSessionDuration, avgSessionDuration) ||
                other.avgSessionDuration == avgSessionDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_categoryPreferences),
      const DeepCollectionEquality().hash(_brandPreferences),
      const DeepCollectionEquality().hash(_priceRangePreferences),
      const DeepCollectionEquality().hash(_favoriteStores),
      const DeepCollectionEquality().hash(_searchHistory),
      const DeepCollectionEquality().hash(_viewedProducts),
      const DeepCollectionEquality().hash(_purchasedCategories),
      lastUpdated,
      totalInteractions,
      avgSessionDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesModelImplCopyWith<_$UserPreferencesModelImpl>
      get copyWith =>
          __$$UserPreferencesModelImplCopyWithImpl<_$UserPreferencesModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesModelImplToJson(
      this,
    );
  }
}

abstract class _UserPreferencesModel implements UserPreferencesModel {
  const factory _UserPreferencesModel(
      {required final String userId,
      final Map<String, double> categoryPreferences,
      final Map<String, double> brandPreferences,
      final Map<String, double> priceRangePreferences,
      final List<String> favoriteStores,
      final List<String> searchHistory,
      final List<String> viewedProducts,
      final List<String> purchasedCategories,
      @TimestampConverter() required final DateTime lastUpdated,
      final int totalInteractions,
      final double avgSessionDuration}) = _$UserPreferencesModelImpl;

  factory _UserPreferencesModel.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesModelImpl.fromJson;

  @override
  String get userId;
  @override
  Map<String, double> get categoryPreferences;
  @override // categoryId -> preference score (0-1)
  Map<String, double> get brandPreferences;
  @override // brand -> preference score (0-1)
  Map<String, double> get priceRangePreferences;
  @override // price range -> preference score (0-1)
  List<String> get favoriteStores;
  @override // storeIds
  List<String> get searchHistory;
  @override // recent search terms
  List<String> get viewedProducts;
  @override // recent productIds (last 50)
  List<String> get purchasedCategories;
  @override // categories user has bought from
  @TimestampConverter()
  DateTime get lastUpdated;
  @override
  int get totalInteractions;
  @override // Total number of tracked interactions
  double get avgSessionDuration;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesModelImplCopyWith<_$UserPreferencesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProductAffinityModel _$ProductAffinityModelFromJson(Map<String, dynamic> json) {
  return _ProductAffinityModel.fromJson(json);
}

/// @nodoc
mixin _$ProductAffinityModel {
  String get productId1 => throw _privateConstructorUsedError;
  String get productId2 => throw _privateConstructorUsedError;
  double get affinityScore =>
      throw _privateConstructorUsedError; // 0-1, how often viewed/bought together
  int get coOccurrences =>
      throw _privateConstructorUsedError; // Number of times they appeared together
  @TimestampConverter()
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductAffinityModelCopyWith<ProductAffinityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAffinityModelCopyWith<$Res> {
  factory $ProductAffinityModelCopyWith(ProductAffinityModel value,
          $Res Function(ProductAffinityModel) then) =
      _$ProductAffinityModelCopyWithImpl<$Res, ProductAffinityModel>;
  @useResult
  $Res call(
      {String productId1,
      String productId2,
      double affinityScore,
      int coOccurrences,
      @TimestampConverter() DateTime lastUpdated});
}

/// @nodoc
class _$ProductAffinityModelCopyWithImpl<$Res,
        $Val extends ProductAffinityModel>
    implements $ProductAffinityModelCopyWith<$Res> {
  _$ProductAffinityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId1 = null,
    Object? productId2 = null,
    Object? affinityScore = null,
    Object? coOccurrences = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      productId1: null == productId1
          ? _value.productId1
          : productId1 // ignore: cast_nullable_to_non_nullable
              as String,
      productId2: null == productId2
          ? _value.productId2
          : productId2 // ignore: cast_nullable_to_non_nullable
              as String,
      affinityScore: null == affinityScore
          ? _value.affinityScore
          : affinityScore // ignore: cast_nullable_to_non_nullable
              as double,
      coOccurrences: null == coOccurrences
          ? _value.coOccurrences
          : coOccurrences // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAffinityModelImplCopyWith<$Res>
    implements $ProductAffinityModelCopyWith<$Res> {
  factory _$$ProductAffinityModelImplCopyWith(_$ProductAffinityModelImpl value,
          $Res Function(_$ProductAffinityModelImpl) then) =
      __$$ProductAffinityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId1,
      String productId2,
      double affinityScore,
      int coOccurrences,
      @TimestampConverter() DateTime lastUpdated});
}

/// @nodoc
class __$$ProductAffinityModelImplCopyWithImpl<$Res>
    extends _$ProductAffinityModelCopyWithImpl<$Res, _$ProductAffinityModelImpl>
    implements _$$ProductAffinityModelImplCopyWith<$Res> {
  __$$ProductAffinityModelImplCopyWithImpl(_$ProductAffinityModelImpl _value,
      $Res Function(_$ProductAffinityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId1 = null,
    Object? productId2 = null,
    Object? affinityScore = null,
    Object? coOccurrences = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$ProductAffinityModelImpl(
      productId1: null == productId1
          ? _value.productId1
          : productId1 // ignore: cast_nullable_to_non_nullable
              as String,
      productId2: null == productId2
          ? _value.productId2
          : productId2 // ignore: cast_nullable_to_non_nullable
              as String,
      affinityScore: null == affinityScore
          ? _value.affinityScore
          : affinityScore // ignore: cast_nullable_to_non_nullable
              as double,
      coOccurrences: null == coOccurrences
          ? _value.coOccurrences
          : coOccurrences // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAffinityModelImpl implements _ProductAffinityModel {
  const _$ProductAffinityModelImpl(
      {required this.productId1,
      required this.productId2,
      required this.affinityScore,
      required this.coOccurrences,
      @TimestampConverter() required this.lastUpdated});

  factory _$ProductAffinityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAffinityModelImplFromJson(json);

  @override
  final String productId1;
  @override
  final String productId2;
  @override
  final double affinityScore;
// 0-1, how often viewed/bought together
  @override
  final int coOccurrences;
// Number of times they appeared together
  @override
  @TimestampConverter()
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'ProductAffinityModel(productId1: $productId1, productId2: $productId2, affinityScore: $affinityScore, coOccurrences: $coOccurrences, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAffinityModelImpl &&
            (identical(other.productId1, productId1) ||
                other.productId1 == productId1) &&
            (identical(other.productId2, productId2) ||
                other.productId2 == productId2) &&
            (identical(other.affinityScore, affinityScore) ||
                other.affinityScore == affinityScore) &&
            (identical(other.coOccurrences, coOccurrences) ||
                other.coOccurrences == coOccurrences) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId1, productId2,
      affinityScore, coOccurrences, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAffinityModelImplCopyWith<_$ProductAffinityModelImpl>
      get copyWith =>
          __$$ProductAffinityModelImplCopyWithImpl<_$ProductAffinityModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAffinityModelImplToJson(
      this,
    );
  }
}

abstract class _ProductAffinityModel implements ProductAffinityModel {
  const factory _ProductAffinityModel(
          {required final String productId1,
          required final String productId2,
          required final double affinityScore,
          required final int coOccurrences,
          @TimestampConverter() required final DateTime lastUpdated}) =
      _$ProductAffinityModelImpl;

  factory _ProductAffinityModel.fromJson(Map<String, dynamic> json) =
      _$ProductAffinityModelImpl.fromJson;

  @override
  String get productId1;
  @override
  String get productId2;
  @override
  double get affinityScore;
  @override // 0-1, how often viewed/bought together
  int get coOccurrences;
  @override // Number of times they appeared together
  @TimestampConverter()
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ProductAffinityModelImplCopyWith<_$ProductAffinityModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecommendationModel _$RecommendationModelFromJson(Map<String, dynamic> json) {
  return _RecommendationModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendationModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<String> get productIds =>
      throw _privateConstructorUsedError; // Recommended product IDs
  RecommendationType get type => throw _privateConstructorUsedError;
  double get confidenceScore =>
      throw _privateConstructorUsedError; // 0-1, how confident we are in this recommendation
  String get algorithm =>
      throw _privateConstructorUsedError; // Which algorithm generated this
  Map<String, dynamic>? get context =>
      throw _privateConstructorUsedError; // Context that led to this recommendation
  @TimestampConverter()
  DateTime get generatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  bool get clicked =>
      throw _privateConstructorUsedError; // Has user clicked on this recommendation
  bool get converted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendationModelCopyWith<RecommendationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationModelCopyWith<$Res> {
  factory $RecommendationModelCopyWith(
          RecommendationModel value, $Res Function(RecommendationModel) then) =
      _$RecommendationModelCopyWithImpl<$Res, RecommendationModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> productIds,
      RecommendationType type,
      double confidenceScore,
      String algorithm,
      Map<String, dynamic>? context,
      @TimestampConverter() DateTime generatedAt,
      @TimestampConverter() DateTime? expiresAt,
      bool clicked,
      bool converted});
}

/// @nodoc
class _$RecommendationModelCopyWithImpl<$Res, $Val extends RecommendationModel>
    implements $RecommendationModelCopyWith<$Res> {
  _$RecommendationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productIds = null,
    Object? type = null,
    Object? confidenceScore = null,
    Object? algorithm = null,
    Object? context = freezed,
    Object? generatedAt = null,
    Object? expiresAt = freezed,
    Object? clicked = null,
    Object? converted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: null == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecommendationType,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      algorithm: null == algorithm
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as String,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clicked: null == clicked
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as bool,
      converted: null == converted
          ? _value.converted
          : converted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationModelImplCopyWith<$Res>
    implements $RecommendationModelCopyWith<$Res> {
  factory _$$RecommendationModelImplCopyWith(_$RecommendationModelImpl value,
          $Res Function(_$RecommendationModelImpl) then) =
      __$$RecommendationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> productIds,
      RecommendationType type,
      double confidenceScore,
      String algorithm,
      Map<String, dynamic>? context,
      @TimestampConverter() DateTime generatedAt,
      @TimestampConverter() DateTime? expiresAt,
      bool clicked,
      bool converted});
}

/// @nodoc
class __$$RecommendationModelImplCopyWithImpl<$Res>
    extends _$RecommendationModelCopyWithImpl<$Res, _$RecommendationModelImpl>
    implements _$$RecommendationModelImplCopyWith<$Res> {
  __$$RecommendationModelImplCopyWithImpl(_$RecommendationModelImpl _value,
      $Res Function(_$RecommendationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productIds = null,
    Object? type = null,
    Object? confidenceScore = null,
    Object? algorithm = null,
    Object? context = freezed,
    Object? generatedAt = null,
    Object? expiresAt = freezed,
    Object? clicked = null,
    Object? converted = null,
  }) {
    return _then(_$RecommendationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: null == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecommendationType,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      algorithm: null == algorithm
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as String,
      context: freezed == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clicked: null == clicked
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as bool,
      converted: null == converted
          ? _value.converted
          : converted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationModelImpl implements _RecommendationModel {
  const _$RecommendationModelImpl(
      {required this.id,
      required this.userId,
      required final List<String> productIds,
      required this.type,
      required this.confidenceScore,
      required this.algorithm,
      final Map<String, dynamic>? context,
      @TimestampConverter() required this.generatedAt,
      @TimestampConverter() this.expiresAt,
      this.clicked = false,
      this.converted = false})
      : _productIds = productIds,
        _context = context;

  factory _$RecommendationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<String> _productIds;
  @override
  List<String> get productIds {
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

// Recommended product IDs
  @override
  final RecommendationType type;
  @override
  final double confidenceScore;
// 0-1, how confident we are in this recommendation
  @override
  final String algorithm;
// Which algorithm generated this
  final Map<String, dynamic>? _context;
// Which algorithm generated this
  @override
  Map<String, dynamic>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableMapView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// Context that led to this recommendation
  @override
  @TimestampConverter()
  final DateTime generatedAt;
  @override
  @TimestampConverter()
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final bool clicked;
// Has user clicked on this recommendation
  @override
  @JsonKey()
  final bool converted;

  @override
  String toString() {
    return 'RecommendationModel(id: $id, userId: $userId, productIds: $productIds, type: $type, confidenceScore: $confidenceScore, algorithm: $algorithm, context: $context, generatedAt: $generatedAt, expiresAt: $expiresAt, clicked: $clicked, converted: $converted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.algorithm, algorithm) ||
                other.algorithm == algorithm) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.clicked, clicked) || other.clicked == clicked) &&
            (identical(other.converted, converted) ||
                other.converted == converted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      const DeepCollectionEquality().hash(_productIds),
      type,
      confidenceScore,
      algorithm,
      const DeepCollectionEquality().hash(_context),
      generatedAt,
      expiresAt,
      clicked,
      converted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationModelImplCopyWith<_$RecommendationModelImpl> get copyWith =>
      __$$RecommendationModelImplCopyWithImpl<_$RecommendationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationModelImplToJson(
      this,
    );
  }
}

abstract class _RecommendationModel implements RecommendationModel {
  const factory _RecommendationModel(
      {required final String id,
      required final String userId,
      required final List<String> productIds,
      required final RecommendationType type,
      required final double confidenceScore,
      required final String algorithm,
      final Map<String, dynamic>? context,
      @TimestampConverter() required final DateTime generatedAt,
      @TimestampConverter() final DateTime? expiresAt,
      final bool clicked,
      final bool converted}) = _$RecommendationModelImpl;

  factory _RecommendationModel.fromJson(Map<String, dynamic> json) =
      _$RecommendationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<String> get productIds;
  @override // Recommended product IDs
  RecommendationType get type;
  @override
  double get confidenceScore;
  @override // 0-1, how confident we are in this recommendation
  String get algorithm;
  @override // Which algorithm generated this
  Map<String, dynamic>? get context;
  @override // Context that led to this recommendation
  @TimestampConverter()
  DateTime get generatedAt;
  @override
  @TimestampConverter()
  DateTime? get expiresAt;
  @override
  bool get clicked;
  @override // Has user clicked on this recommendation
  bool get converted;
  @override
  @JsonKey(ignore: true)
  _$$RecommendationModelImplCopyWith<_$RecommendationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendationContext _$RecommendationContextFromJson(
    Map<String, dynamic> json) {
  return _RecommendationContext.fromJson(json);
}

/// @nodoc
mixin _$RecommendationContext {
  String get userId => throw _privateConstructorUsedError;
  String? get currentProductId =>
      throw _privateConstructorUsedError; // Product user is currently viewing
  String? get currentCategoryId =>
      throw _privateConstructorUsedError; // Category user is currently in
  String? get currentStoreId =>
      throw _privateConstructorUsedError; // Store user is currently viewing
  String? get searchQuery =>
      throw _privateConstructorUsedError; // Current search query
  List<String> get cartProductIds =>
      throw _privateConstructorUsedError; // Products in cart
  List<String> get wishlistProductIds =>
      throw _privateConstructorUsedError; // Products in wishlist
  Map<String, dynamic> get additionalContext =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendationContextCopyWith<RecommendationContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationContextCopyWith<$Res> {
  factory $RecommendationContextCopyWith(RecommendationContext value,
          $Res Function(RecommendationContext) then) =
      _$RecommendationContextCopyWithImpl<$Res, RecommendationContext>;
  @useResult
  $Res call(
      {String userId,
      String? currentProductId,
      String? currentCategoryId,
      String? currentStoreId,
      String? searchQuery,
      List<String> cartProductIds,
      List<String> wishlistProductIds,
      Map<String, dynamic> additionalContext});
}

/// @nodoc
class _$RecommendationContextCopyWithImpl<$Res,
        $Val extends RecommendationContext>
    implements $RecommendationContextCopyWith<$Res> {
  _$RecommendationContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currentProductId = freezed,
    Object? currentCategoryId = freezed,
    Object? currentStoreId = freezed,
    Object? searchQuery = freezed,
    Object? cartProductIds = null,
    Object? wishlistProductIds = null,
    Object? additionalContext = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currentProductId: freezed == currentProductId
          ? _value.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentCategoryId: freezed == currentCategoryId
          ? _value.currentCategoryId
          : currentCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStoreId: freezed == currentStoreId
          ? _value.currentStoreId
          : currentStoreId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      cartProductIds: null == cartProductIds
          ? _value.cartProductIds
          : cartProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wishlistProductIds: null == wishlistProductIds
          ? _value.wishlistProductIds
          : wishlistProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      additionalContext: null == additionalContext
          ? _value.additionalContext
          : additionalContext // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationContextImplCopyWith<$Res>
    implements $RecommendationContextCopyWith<$Res> {
  factory _$$RecommendationContextImplCopyWith(
          _$RecommendationContextImpl value,
          $Res Function(_$RecommendationContextImpl) then) =
      __$$RecommendationContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String? currentProductId,
      String? currentCategoryId,
      String? currentStoreId,
      String? searchQuery,
      List<String> cartProductIds,
      List<String> wishlistProductIds,
      Map<String, dynamic> additionalContext});
}

/// @nodoc
class __$$RecommendationContextImplCopyWithImpl<$Res>
    extends _$RecommendationContextCopyWithImpl<$Res,
        _$RecommendationContextImpl>
    implements _$$RecommendationContextImplCopyWith<$Res> {
  __$$RecommendationContextImplCopyWithImpl(_$RecommendationContextImpl _value,
      $Res Function(_$RecommendationContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currentProductId = freezed,
    Object? currentCategoryId = freezed,
    Object? currentStoreId = freezed,
    Object? searchQuery = freezed,
    Object? cartProductIds = null,
    Object? wishlistProductIds = null,
    Object? additionalContext = null,
  }) {
    return _then(_$RecommendationContextImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currentProductId: freezed == currentProductId
          ? _value.currentProductId
          : currentProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentCategoryId: freezed == currentCategoryId
          ? _value.currentCategoryId
          : currentCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStoreId: freezed == currentStoreId
          ? _value.currentStoreId
          : currentStoreId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      cartProductIds: null == cartProductIds
          ? _value._cartProductIds
          : cartProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wishlistProductIds: null == wishlistProductIds
          ? _value._wishlistProductIds
          : wishlistProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      additionalContext: null == additionalContext
          ? _value._additionalContext
          : additionalContext // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationContextImpl implements _RecommendationContext {
  const _$RecommendationContextImpl(
      {required this.userId,
      this.currentProductId,
      this.currentCategoryId,
      this.currentStoreId,
      this.searchQuery,
      final List<String> cartProductIds = const [],
      final List<String> wishlistProductIds = const [],
      final Map<String, dynamic> additionalContext = const {}})
      : _cartProductIds = cartProductIds,
        _wishlistProductIds = wishlistProductIds,
        _additionalContext = additionalContext;

  factory _$RecommendationContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationContextImplFromJson(json);

  @override
  final String userId;
  @override
  final String? currentProductId;
// Product user is currently viewing
  @override
  final String? currentCategoryId;
// Category user is currently in
  @override
  final String? currentStoreId;
// Store user is currently viewing
  @override
  final String? searchQuery;
// Current search query
  final List<String> _cartProductIds;
// Current search query
  @override
  @JsonKey()
  List<String> get cartProductIds {
    if (_cartProductIds is EqualUnmodifiableListView) return _cartProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProductIds);
  }

// Products in cart
  final List<String> _wishlistProductIds;
// Products in cart
  @override
  @JsonKey()
  List<String> get wishlistProductIds {
    if (_wishlistProductIds is EqualUnmodifiableListView)
      return _wishlistProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wishlistProductIds);
  }

// Products in wishlist
  final Map<String, dynamic> _additionalContext;
// Products in wishlist
  @override
  @JsonKey()
  Map<String, dynamic> get additionalContext {
    if (_additionalContext is EqualUnmodifiableMapView)
      return _additionalContext;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalContext);
  }

  @override
  String toString() {
    return 'RecommendationContext(userId: $userId, currentProductId: $currentProductId, currentCategoryId: $currentCategoryId, currentStoreId: $currentStoreId, searchQuery: $searchQuery, cartProductIds: $cartProductIds, wishlistProductIds: $wishlistProductIds, additionalContext: $additionalContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationContextImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.currentProductId, currentProductId) ||
                other.currentProductId == currentProductId) &&
            (identical(other.currentCategoryId, currentCategoryId) ||
                other.currentCategoryId == currentCategoryId) &&
            (identical(other.currentStoreId, currentStoreId) ||
                other.currentStoreId == currentStoreId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._cartProductIds, _cartProductIds) &&
            const DeepCollectionEquality()
                .equals(other._wishlistProductIds, _wishlistProductIds) &&
            const DeepCollectionEquality()
                .equals(other._additionalContext, _additionalContext));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      currentProductId,
      currentCategoryId,
      currentStoreId,
      searchQuery,
      const DeepCollectionEquality().hash(_cartProductIds),
      const DeepCollectionEquality().hash(_wishlistProductIds),
      const DeepCollectionEquality().hash(_additionalContext));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationContextImplCopyWith<_$RecommendationContextImpl>
      get copyWith => __$$RecommendationContextImplCopyWithImpl<
          _$RecommendationContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationContextImplToJson(
      this,
    );
  }
}

abstract class _RecommendationContext implements RecommendationContext {
  const factory _RecommendationContext(
          {required final String userId,
          final String? currentProductId,
          final String? currentCategoryId,
          final String? currentStoreId,
          final String? searchQuery,
          final List<String> cartProductIds,
          final List<String> wishlistProductIds,
          final Map<String, dynamic> additionalContext}) =
      _$RecommendationContextImpl;

  factory _RecommendationContext.fromJson(Map<String, dynamic> json) =
      _$RecommendationContextImpl.fromJson;

  @override
  String get userId;
  @override
  String? get currentProductId;
  @override // Product user is currently viewing
  String? get currentCategoryId;
  @override // Category user is currently in
  String? get currentStoreId;
  @override // Store user is currently viewing
  String? get searchQuery;
  @override // Current search query
  List<String> get cartProductIds;
  @override // Products in cart
  List<String> get wishlistProductIds;
  @override // Products in wishlist
  Map<String, dynamic> get additionalContext;
  @override
  @JsonKey(ignore: true)
  _$$RecommendationContextImplCopyWith<_$RecommendationContextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
