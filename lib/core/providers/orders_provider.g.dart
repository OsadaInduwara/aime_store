// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderServiceHash() => r'1f7289b625a710b5f100a6806b245c7ade4fae4e';

/// See also [orderService].
@ProviderFor(orderService)
final orderServiceProvider = AutoDisposeProvider<OrderService>.internal(
  orderService,
  name: r'orderServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderServiceRef = AutoDisposeProviderRef<OrderService>;
String _$ordersHash() => r'd6895afb05642874da8d3bec133117434f511d65';

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

abstract class _$Orders
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<OrderModel>>> {
  late final OrderStatus status;

  AsyncValue<List<OrderModel>> build(
    OrderStatus status,
  );
}

/// See also [Orders].
@ProviderFor(Orders)
const ordersProvider = OrdersFamily();

/// See also [Orders].
class OrdersFamily extends Family<AsyncValue<List<OrderModel>>> {
  /// See also [Orders].
  const OrdersFamily();

  /// See also [Orders].
  OrdersProvider call(
    OrderStatus status,
  ) {
    return OrdersProvider(
      status,
    );
  }

  @override
  OrdersProvider getProviderOverride(
    covariant OrdersProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'ordersProvider';
}

/// See also [Orders].
class OrdersProvider extends AutoDisposeNotifierProviderImpl<Orders,
    AsyncValue<List<OrderModel>>> {
  /// See also [Orders].
  OrdersProvider(
    OrderStatus status,
  ) : this._internal(
          () => Orders()..status = status,
          from: ordersProvider,
          name: r'ordersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ordersHash,
          dependencies: OrdersFamily._dependencies,
          allTransitiveDependencies: OrdersFamily._allTransitiveDependencies,
          status: status,
        );

  OrdersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final OrderStatus status;

  @override
  AsyncValue<List<OrderModel>> runNotifierBuild(
    covariant Orders notifier,
  ) {
    return notifier.build(
      status,
    );
  }

  @override
  Override overrideWith(Orders Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrdersProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Orders, AsyncValue<List<OrderModel>>>
      createElement() {
    return _OrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrdersProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OrdersRef
    on AutoDisposeNotifierProviderRef<AsyncValue<List<OrderModel>>> {
  /// The parameter `status` of this provider.
  OrderStatus get status;
}

class _OrdersProviderElement extends AutoDisposeNotifierProviderElement<Orders,
    AsyncValue<List<OrderModel>>> with OrdersRef {
  _OrdersProviderElement(super.provider);

  @override
  OrderStatus get status => (origin as OrdersProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
