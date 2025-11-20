// lib/core/providers/stores_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/store_model.dart';
import '../../services/store_service.dart';

// Service Provider for stores
final storesServiceProvider = Provider<StoreService>((ref) {
  return StoreService();
});

// Featured Stores Provider
final featuredStoresProvider = StateNotifierProvider<FeaturedStoresNotifier, AsyncValue<List<StoreModel>>>((ref) {
  return FeaturedStoresNotifier(ref.read(storesServiceProvider));
});

class FeaturedStoresNotifier extends StateNotifier<AsyncValue<List<StoreModel>>> {
  final StoreService _storeService;

  FeaturedStoresNotifier(this._storeService) : super(const AsyncValue.loading()) {
    loadStores();
  }

  Future<void> loadStores() async {
    state = const AsyncValue.loading();

    try {
      final stores = await _storeService.getFeaturedStores();
      state = AsyncValue.data(stores);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadStores();
  }
}

// All Stores Provider
final allStoresProvider = StateNotifierProvider<AllStoresNotifier, AsyncValue<List<StoreModel>>>((ref) {
  return AllStoresNotifier(ref.read(storesServiceProvider));
});

class AllStoresNotifier extends StateNotifier<AsyncValue<List<StoreModel>>> {
  final StoreService _storeService;
  bool _hasMore = true;
  List<StoreModel> _stores = [];

  AllStoresNotifier(this._storeService) : super(const AsyncValue.loading()) {
    _loadInitialStores();
  }

  Future<void> _loadInitialStores() async {
    try {
      final stores = await _storeService.getAllStores();

      _stores = stores;
      _hasMore = stores.length >= 20; // Assuming 20 is page size

      state = AsyncValue.data(_stores);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading || _stores.isEmpty) return;

    try {
      final newStores = await _storeService.getAllStores(
        startAfter: null, // This would need to be tracked from the last document
      );

      if (newStores.isNotEmpty) {
        _stores.addAll(newStores);
        _hasMore = newStores.length >= 20;
        state = AsyncValue.data(_stores);
      } else {
        _hasMore = false;
      }
    } catch (error, stackTrace) {
      // Don't update state on load more error
      print('Error loading more stores: $error');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    _hasMore = true;
    _stores = [];
    await _loadInitialStores();
  }
}

// Search Stores Provider
final searchStoresProvider = StateNotifierProvider<SearchStoresNotifier, AsyncValue<List<StoreModel>>>((ref) {
  return SearchStoresNotifier(ref.read(storesServiceProvider));
});

class SearchStoresNotifier extends StateNotifier<AsyncValue<List<StoreModel>>> {
  final StoreService _storeService;

  SearchStoresNotifier(this._storeService) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.trim().length < 2) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();

    try {
      final stores = await _storeService.searchStores(query);
      state = AsyncValue.data(stores);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearResults() {
    state = const AsyncValue.data([]);
  }
}
