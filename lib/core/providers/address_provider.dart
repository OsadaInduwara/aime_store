// lib/core/providers/addresses_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../services/address_service.dart';

// Service Provider
final addressServiceProvider = Provider<AddressService>((ref) {
  return AddressService();
});

// Addresses Provider
final addressesProvider = StateNotifierProvider<AddressesNotifier, AsyncValue<List<Address>>>((ref) {
  return AddressesNotifier(ref.read(addressServiceProvider));
});

class AddressesNotifier extends StateNotifier<AsyncValue<List<Address>>> {
  final AddressService _addressService;

  AddressesNotifier(this._addressService) : super(const AsyncValue.loading()) {
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    try {
      final addresses = await _addressService.getAddresses();
      state = AsyncValue.data(addresses);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addAddress(Address address) async {
    try {
      await _addressService.addAddress(address);
      await _loadAddresses();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> updateAddress(Address address) async {
    try {
      await _addressService.updateAddress(address);
      await _loadAddresses();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      await _addressService.deleteAddress(addressId);
      await _loadAddresses();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> setDefault(String addressId) async {
    try {
      await _addressService.setDefaultAddress(addressId);
      await _loadAddresses();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _loadAddresses();
  }
}