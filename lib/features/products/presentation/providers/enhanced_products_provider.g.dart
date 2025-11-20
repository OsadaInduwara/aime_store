// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enhanced_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productServiceHash() => r'199388505ab819bf6ee758b13a384288d334dafb';

/// Provider for product service
///
/// Copied from [productService].
@ProviderFor(productService)
final productServiceProvider = AutoDisposeProvider<ProductService>.internal(
  productService,
  name: r'productServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductServiceRef = AutoDisposeProviderRef<ProductService>;
String _$enhancedProductsHash() => r'428e064463a5390d6a8b03c9023054bc569a8735';

/// Enhanced products provider with proper async handling
///
/// Copied from [EnhancedProducts].
@ProviderFor(EnhancedProducts)
final enhancedProductsProvider = AutoDisposeAsyncNotifierProvider<
    EnhancedProducts, List<ProductModel>>.internal(
  EnhancedProducts.new,
  name: r'enhancedProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enhancedProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnhancedProducts = AutoDisposeAsyncNotifier<List<ProductModel>>;
String _$enhancedProductDetailHash() =>
    r'f4074683f02f5497c69bd8283cc4a66bfabb0758';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EnhancedProductDetail
    extends BuildlessAutoDisposeAsyncNotifier<ProductModel?> {
  late final String productId;

  FutureOr<ProductModel?> build(
    String productId,
  );
}

/// Provider for single product details
///
/// Copied from [EnhancedProductDetail].
@ProviderFor(EnhancedProductDetail)
const enhancedProductDetailProvider = EnhancedProductDetailFamily();

/// Provider for single product details
///
/// Copied from [EnhancedProductDetail].
class EnhancedProductDetailFamily extends Family<AsyncValue<ProductModel?>> {
  /// Provider for single product details
  ///
  /// Copied from [EnhancedProductDetail].
  const EnhancedProductDetailFamily();

  /// Provider for single product details
  ///
  /// Copied from [EnhancedProductDetail].
  EnhancedProductDetailProvider call(
    String productId,
  ) {
    return EnhancedProductDetailProvider(
      productId,
    );
  }

  @override
  EnhancedProductDetailProvider getProviderOverride(
    covariant EnhancedProductDetailProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'enhancedProductDetailProvider';
}

/// Provider for single product details
///
/// Copied from [EnhancedProductDetail].
class EnhancedProductDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EnhancedProductDetail,
        ProductModel?> {
  /// Provider for single product details
  ///
  /// Copied from [EnhancedProductDetail].
  EnhancedProductDetailProvider(
    String productId,
  ) : this._internal(
          () => EnhancedProductDetail()..productId = productId,
          from: enhancedProductDetailProvider,
          name: r'enhancedProductDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enhancedProductDetailHash,
          dependencies: EnhancedProductDetailFamily._dependencies,
          allTransitiveDependencies:
              EnhancedProductDetailFamily._allTransitiveDependencies,
          productId: productId,
        );

  EnhancedProductDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  FutureOr<ProductModel?> runNotifierBuild(
    covariant EnhancedProductDetail notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(EnhancedProductDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: EnhancedProductDetailProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EnhancedProductDetail, ProductModel?>
      createElement() {
    return _EnhancedProductDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EnhancedProductDetailProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EnhancedProductDetailRef
    on AutoDisposeAsyncNotifierProviderRef<ProductModel?> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _EnhancedProductDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EnhancedProductDetail,
        ProductModel?> with EnhancedProductDetailRef {
  _EnhancedProductDetailProviderElement(super.provider);

  @override
  String get productId => (origin as EnhancedProductDetailProvider).productId;
}

String _$enhancedFeaturedProductsHash() =>
    r'bb00cbeef482b107c9daccfa2463451e17c4f3c6';

/// Provider for featured products
///
/// Copied from [EnhancedFeaturedProducts].
@ProviderFor(EnhancedFeaturedProducts)
final enhancedFeaturedProductsProvider = AutoDisposeAsyncNotifierProvider<
    EnhancedFeaturedProducts, List<ProductModel>>.internal(
  EnhancedFeaturedProducts.new,
  name: r'enhancedFeaturedProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enhancedFeaturedProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnhancedFeaturedProducts
    = AutoDisposeAsyncNotifier<List<ProductModel>>;
String _$enhancedTrendingProductsHash() =>
    r'9c7a5d3e028ede6d88230ce8712346de1fe1a1f2';

/// Provider for trending products
///
/// Copied from [EnhancedTrendingProducts].
@ProviderFor(EnhancedTrendingProducts)
final enhancedTrendingProductsProvider = AutoDisposeAsyncNotifierProvider<
    EnhancedTrendingProducts, List<ProductModel>>.internal(
  EnhancedTrendingProducts.new,
  name: r'enhancedTrendingProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enhancedTrendingProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnhancedTrendingProducts
    = AutoDisposeAsyncNotifier<List<ProductModel>>;
String _$enhancedProductRecommendationsHash() =>
    r'c8257a1b42d2beccd9e1ec88f7c40132594864a9';

abstract class _$EnhancedProductRecommendations
    extends BuildlessAutoDisposeAsyncNotifier<List<ProductModel>> {
  late final String? userId;

  FutureOr<List<ProductModel>> build(
    String? userId,
  );
}

/// Provider for product recommendations
///
/// Copied from [EnhancedProductRecommendations].
@ProviderFor(EnhancedProductRecommendations)
const enhancedProductRecommendationsProvider =
    EnhancedProductRecommendationsFamily();

/// Provider for product recommendations
///
/// Copied from [EnhancedProductRecommendations].
class EnhancedProductRecommendationsFamily
    extends Family<AsyncValue<List<ProductModel>>> {
  /// Provider for product recommendations
  ///
  /// Copied from [EnhancedProductRecommendations].
  const EnhancedProductRecommendationsFamily();

  /// Provider for product recommendations
  ///
  /// Copied from [EnhancedProductRecommendations].
  EnhancedProductRecommendationsProvider call(
    String? userId,
  ) {
    return EnhancedProductRecommendationsProvider(
      userId,
    );
  }

  @override
  EnhancedProductRecommendationsProvider getProviderOverride(
    covariant EnhancedProductRecommendationsProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'enhancedProductRecommendationsProvider';
}

/// Provider for product recommendations
///
/// Copied from [EnhancedProductRecommendations].
class EnhancedProductRecommendationsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EnhancedProductRecommendations,
        List<ProductModel>> {
  /// Provider for product recommendations
  ///
  /// Copied from [EnhancedProductRecommendations].
  EnhancedProductRecommendationsProvider(
    String? userId,
  ) : this._internal(
          () => EnhancedProductRecommendations()..userId = userId,
          from: enhancedProductRecommendationsProvider,
          name: r'enhancedProductRecommendationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enhancedProductRecommendationsHash,
          dependencies: EnhancedProductRecommendationsFamily._dependencies,
          allTransitiveDependencies:
              EnhancedProductRecommendationsFamily._allTransitiveDependencies,
          userId: userId,
        );

  EnhancedProductRecommendationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  FutureOr<List<ProductModel>> runNotifierBuild(
    covariant EnhancedProductRecommendations notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(EnhancedProductRecommendations Function() create) {
    return ProviderOverride(
      origin: this,
      override: EnhancedProductRecommendationsProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EnhancedProductRecommendations,
      List<ProductModel>> createElement() {
    return _EnhancedProductRecommendationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EnhancedProductRecommendationsProvider &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EnhancedProductRecommendationsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProductModel>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _EnhancedProductRecommendationsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        EnhancedProductRecommendations,
        List<ProductModel>> with EnhancedProductRecommendationsRef {
  _EnhancedProductRecommendationsProviderElement(super.provider);

  @override
  String? get userId =>
      (origin as EnhancedProductRecommendationsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
