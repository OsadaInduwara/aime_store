// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartServiceHash() => r'cfa9de14ee1fcbdca851bedb4e7549ed4671866f';

/// See also [cartService].
@ProviderFor(cartService)
final cartServiceProvider = AutoDisposeProvider<CartService>.internal(
  cartService,
  name: r'cartServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartServiceRef = AutoDisposeProviderRef<CartService>;
String _$cartHash() => r'979cfb6c1c446fb483010e7ff39310e7c73e7468';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider =
    AutoDisposeNotifierProvider<Cart, AsyncValue<List<CartItem>>>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = AutoDisposeNotifier<AsyncValue<List<CartItem>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
