// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkoutServiceHash() => r'cbe3cd6420e721030e7abd5954768104999e05ad';

/// See also [checkoutService].
@ProviderFor(checkoutService)
final checkoutServiceProvider = AutoDisposeProvider<CheckoutService>.internal(
  checkoutService,
  name: r'checkoutServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkoutServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckoutServiceRef = AutoDisposeProviderRef<CheckoutService>;
String _$checkoutHash() => r'5043366ca17232cf0351f72f21844c98cc0eb95a';

/// See also [Checkout].
@ProviderFor(Checkout)
final checkoutProvider =
    AutoDisposeNotifierProvider<Checkout, AsyncValue<bool>>.internal(
  Checkout.new,
  name: r'checkoutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checkoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Checkout = AutoDisposeNotifier<AsyncValue<bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
