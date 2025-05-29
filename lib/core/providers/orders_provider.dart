// lib/core/providers/orders_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/order_model.dart';
import '../services/order_service.dart';

part 'orders_provider.g.dart';

@riverpod
class Orders extends _$Orders {
  @override
  AsyncValue<List<OrderModel>> build(OrderStatus status) {
    _loadOrders(status);
    return const AsyncValue.loading();
  }

  Future<void> _loadOrders(OrderStatus status) async {
    try {
      final orderService = ref.read(orderServiceProvider);
      final orders = await orderService.getUserOrders(status: status);
      state = AsyncValue.data(orders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh(OrderStatus status) async {
    await _loadOrders(status);
  }
}

@riverpod
OrderService orderService(OrderServiceRef ref) {
  return OrderService();
}