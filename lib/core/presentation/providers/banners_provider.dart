// lib/core/providers/banners_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/banner_model.dart';
import '../../services/banner_service.dart';

// Service Provider
final bannerServiceProvider = Provider<BannerService>((ref) {
  return BannerService();
});

// Banners Provider
final bannersProvider = StateNotifierProvider<BannersNotifier, AsyncValue<List<BannerModel>>>((ref) {
  return BannersNotifier(ref.read(bannerServiceProvider));
});

class BannersNotifier extends StateNotifier<AsyncValue<List<BannerModel>>> {
  final BannerService _bannerService;

  BannersNotifier(this._bannerService) : super(const AsyncValue.loading()) {
    loadBanners();
  }

  Future<void> loadBanners() async {
    state = const AsyncValue.loading();

    try {
      final banners = await _bannerService.getActiveBanners();
      state = AsyncValue.data(banners);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadBanners();
  }
}
