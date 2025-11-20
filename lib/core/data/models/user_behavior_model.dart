// lib/core/data/models/user_behavior_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart'; // for TimestampConverter

part 'user_behavior_model.freezed.dart';
part 'user_behavior_model.g.dart';

@freezed
class UserBehaviorModel with _$UserBehaviorModel {
  const factory UserBehaviorModel({
    required String id,
    required String userId,
    required UserAction action,
    required String targetId, // productId, categoryId, storeId, etc.
    required String targetType, // 'product', 'category', 'store', 'search'
    Map<String, dynamic>? metadata, // Additional context data
    @TimestampConverter() required DateTime timestamp,
    String? sessionId, // Track user sessions
    String? deviceInfo, // Device type, OS, etc.
  }) = _UserBehaviorModel;

  factory UserBehaviorModel.fromJson(Map<String, dynamic> json) =>
      _$UserBehaviorModelFromJson(json);
}

@freezed
class UserPreferencesModel with _$UserPreferencesModel {
  const factory UserPreferencesModel({
    required String userId,
    @Default({}) Map<String, double> categoryPreferences, // categoryId -> preference score (0-1)
    @Default({}) Map<String, double> brandPreferences, // brand -> preference score (0-1)
    @Default({}) Map<String, double> priceRangePreferences, // price range -> preference score (0-1)
    @Default([]) List<String> favoriteStores, // storeIds
    @Default([]) List<String> searchHistory, // recent search terms
    @Default([]) List<String> viewedProducts, // recent productIds (last 50)
    @Default([]) List<String> purchasedCategories, // categories user has bought from
    @TimestampConverter() required DateTime lastUpdated,
    @Default(0) int totalInteractions, // Total number of tracked interactions
    @Default(0.0) double avgSessionDuration, // Average session duration in minutes
  }) = _UserPreferencesModel;

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);
}

@freezed
class ProductAffinityModel with _$ProductAffinityModel {
  const factory ProductAffinityModel({
    required String productId1,
    required String productId2,
    required double affinityScore, // 0-1, how often viewed/bought together
    required int coOccurrences, // Number of times they appeared together
    @TimestampConverter() required DateTime lastUpdated,
  }) = _ProductAffinityModel;

  factory ProductAffinityModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAffinityModelFromJson(json);
}

@freezed
class RecommendationModel with _$RecommendationModel {
  const factory RecommendationModel({
    required String id,
    required String userId,
    required List<String> productIds, // Recommended product IDs
    required RecommendationType type,
    required double confidenceScore, // 0-1, how confident we are in this recommendation
    required String algorithm, // Which algorithm generated this
    Map<String, dynamic>? context, // Context that led to this recommendation
    @TimestampConverter() required DateTime generatedAt,
    @TimestampConverter() DateTime? expiresAt,
    @Default(false) bool clicked, // Has user clicked on this recommendation
    @Default(false) bool converted, // Has user purchased from this recommendation
  }) = _RecommendationModel;

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationModelFromJson(json);
}

enum UserAction {
  @JsonValue('view')
  view, // Viewed a product

  @JsonValue('click')
  click, // Clicked on a product

  @JsonValue('add_to_cart')
  addToCart, // Added product to cart

  @JsonValue('remove_from_cart')
  removeFromCart, // Removed product from cart

  @JsonValue('purchase')
  purchase, // Purchased a product

  @JsonValue('wishlist_add')
  wishlistAdd, // Added to wishlist

  @JsonValue('wishlist_remove')
  wishlistRemove, // Removed from wishlist

  @JsonValue('search')
  search, // Performed a search

  @JsonValue('filter')
  filter, // Applied filters

  @JsonValue('category_browse')
  categoryBrowse, // Browsed a category

  @JsonValue('store_visit')
  storeVisit, // Visited a store page

  @JsonValue('share')
  share, // Shared a product

  @JsonValue('review')
  review, // Left a review

  @JsonValue('app_open')
  appOpen, // Opened the app

  @JsonValue('session_start')
  sessionStart, // Started a new session

  @JsonValue('session_end')
  sessionEnd, // Ended a session
}

enum RecommendationType {
  @JsonValue('personalized')
  personalized, // Based on user's behavior and preferences

  @JsonValue('trending')
  trending, // Currently trending products

  @JsonValue('similar')
  similar, // Similar to recently viewed products

  @JsonValue('collaborative')
  collaborative, // Based on similar users' preferences

  @JsonValue('category_based')
  categoryBased, // Based on preferred categories

  @JsonValue('recently_viewed')
  recentlyViewed, // Products recently viewed by user

  @JsonValue('price_based')
  priceBased, // Based on user's price preferences

  @JsonValue('new_arrivals')
  newArrivals, // New products in preferred categories

  @JsonValue('seasonal')
  seasonal, // Seasonal recommendations

  @JsonValue('fallback')
  fallback, // Default recommendations when no data available
}

// Utility class for recommendation scoring
class RecommendationScore {
  final String productId;
  final double score;
  final RecommendationType type;
  final String reason;
  final Map<String, dynamic>? metadata;

  const RecommendationScore({
    required this.productId,
    required this.score,
    required this.type,
    required this.reason,
    this.metadata,
  });
}

// Context for recommendation generation
@freezed
class RecommendationContext with _$RecommendationContext {
  const factory RecommendationContext({
    required String userId,
    String? currentProductId, // Product user is currently viewing
    String? currentCategoryId, // Category user is currently in
    String? currentStoreId, // Store user is currently viewing
    String? searchQuery, // Current search query
    @Default([]) List<String> cartProductIds, // Products in cart
    @Default([]) List<String> wishlistProductIds, // Products in wishlist
    String? location, // User's location for local recommendations
    TimeOfDay? timeOfDay, // Morning, afternoon, evening, night
    DayOfWeek? dayOfWeek, // Day of the week
    @Default({}) Map<String, dynamic> additionalContext, // Extra context
  }) = _RecommendationContext;

  factory RecommendationContext.fromJson(Map<String, dynamic> json) =>
      _$RecommendationContextFromJson(json);
}

enum TimeOfDay {
  @JsonValue('morning')
  morning,

  @JsonValue('afternoon')
  afternoon,

  @JsonValue('evening')
  evening,

  @JsonValue('night')
  night,
}

enum DayOfWeek {
  @JsonValue('monday')
  monday,

  @JsonValue('tuesday')
  tuesday,

  @JsonValue('wednesday')
  wednesday,

  @JsonValue('thursday')
  thursday,

  @JsonValue('friday')
  friday,

  @JsonValue('saturday')
  saturday,

  @JsonValue('sunday')
  sunday,
}
