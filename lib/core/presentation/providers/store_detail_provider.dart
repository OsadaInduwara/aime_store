// lib/core/providers/store_detail_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/store_model.dart';
import '../../services/store_service.dart';

// Service Provider
final storeServiceProvider = Provider<StoreService>((ref) {
  return StoreService();
});

// Store Detail Provider - using FutureProvider.family for parameterized access
final storeDetailProvider = FutureProvider.family<StoreModel, String>((ref, storeId) async {
  final storeService = ref.read(storeServiceProvider);
  final store = await storeService.getStoreById(storeId);

  if (store == null) {
    throw Exception('Store not found');
  }

  return store;
});

// Alternative: Store Detail with caching and error handling
final storeDetailWithCacheProvider = StateNotifierProvider.family<StoreDetailNotifier, AsyncValue<StoreModel>, String>((ref, storeId) {
  return StoreDetailNotifier(ref.read(storeServiceProvider), storeId);
});

class StoreDetailNotifier extends StateNotifier<AsyncValue<StoreModel>> {
  final StoreService _storeService;
  final String _storeId;

  StoreDetailNotifier(this._storeService, this._storeId) : super(const AsyncValue.loading()) {
    _loadStore();
  }

  Future<void> _loadStore() async {
    try {
      final store = await _storeService.getStoreById(_storeId);

      if (store == null) {
        throw Exception('Store not found');
      }

      state = AsyncValue.data(store);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _loadStore();
  }
}
