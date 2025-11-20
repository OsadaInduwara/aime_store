// lib/features/vendor/presentation/providers/store_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/models/store_model.dart';
import '../../../../core/services/store_service.dart';

// Store service provider
final storeServiceProvider = Provider<StoreService>((ref) {
  return StoreService();
});

// User store provider - checks if current user has a store
final userStoreProvider = FutureProvider<StoreModel?>((ref) async {
  final storeService = ref.read(storeServiceProvider);
  return await storeService.getUserStore();
});

// Check if user has store provider
final hasStoreProvider = FutureProvider<bool>((ref) async {
  final storeService = ref.read(storeServiceProvider);
  return await storeService.hasStore();
});

// Store by ID provider
final storeByIdProvider = FutureProvider.family<StoreModel?, String>((ref, storeId) async {
  final storeService = ref.read(storeServiceProvider);

  // For now, we'll just get the user's store since we don't have a getStoreById method
  // In a real app, you'd want to implement this method in the service
  final userStore = await storeService.getUserStore();
  return userStore?.id == storeId ? userStore : null;
});
