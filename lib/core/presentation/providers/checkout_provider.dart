// lib/core/providers/checkout_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/checkout_service.dart';

part 'checkout_provider.g.dart';

@riverpod
class Checkout extends _$Checkout {
  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  Future<void> placeOrder({
    required String addressId,
    required String paymentMethod,
    String? notes,
  }) async {
    state = const AsyncValue.loading();

    try {
      final checkoutService = ref.read(checkoutServiceProvider);
      await checkoutService.placeOrder(
        addressId: addressId,
        paymentMethod: paymentMethod,
        notes: notes,
      );

      state = const AsyncValue.data(true);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
}

@riverpod
CheckoutService checkoutService(CheckoutServiceRef ref) {
  return CheckoutService();
}
