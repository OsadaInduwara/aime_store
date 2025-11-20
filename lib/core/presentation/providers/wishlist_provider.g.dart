// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wishlistServiceHash() => r'de0caee52ea8b155a406e466000ea8933f49ec4e';

/// Provides an instance of your WishlistService
///
/// Copied from [wishlistService].
@ProviderFor(wishlistService)
final wishlistServiceProvider = AutoDisposeProvider<WishlistService>.internal(
  wishlistService,
  name: r'wishlistServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wishlistServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WishlistServiceRef = AutoDisposeProviderRef<WishlistService>;
String _$wishlistHash() => r'8227365acc1ccba739d83ca672f7c37c153519aa';

/// See also [Wishlist].
@ProviderFor(Wishlist)
final wishlistProvider = AutoDisposeNotifierProvider<Wishlist,
    AsyncValue<List<ProductModel>>>.internal(
  Wishlist.new,
  name: r'wishlistProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$wishlistHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Wishlist = AutoDisposeNotifier<AsyncValue<List<ProductModel>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
