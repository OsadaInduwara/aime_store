// lib/core/services/address_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';

class AddressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  Future<List<Address>> getAddresses() async {
    if (_userId == null) return [];

    try {
      final userDoc = await _firestore.collection('users').doc(_userId).get();
      if (!userDoc.exists) return [];

      final userData = userDoc.data()!;
      final addressesData = userData['addresses'] as List<dynamic>? ?? [];

      return addressesData
          .map((data) => Address.fromJson(data as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load addresses: $e');
    }
  }

  Future<void> addAddress(Address address) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final addresses = await getAddresses();

      // Generate ID if not provided
      final newAddress = address.id.isEmpty
          ? address.copyWith(id: const Uuid().v4())
          : address;

      // If this is the first address, make it default
      final addressToAdd = addresses.isEmpty
          ? newAddress.copyWith(isDefault: true)
          : newAddress;

      addresses.add(addressToAdd);

      await _firestore.collection('users').doc(_userId).update({
        'addresses': addresses.map((addr) => addr.toJson()).toList(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add address: $e');
    }
  }

  Future<void> updateAddress(Address address) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final addresses = await getAddresses();
      final index = addresses.indexWhere((addr) => addr.id == address.id);

      if (index != -1) {
        addresses[index] = address;

        await _firestore.collection('users').doc(_userId).update({
          'addresses': addresses.map((addr) => addr.toJson()).toList(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
      } else {
        throw Exception('Address not found');
      }
    } catch (e) {
      throw Exception('Failed to update address: $e');
    }
  }

  Future<void> deleteAddress(String addressId) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final addresses = await getAddresses();
      final addressToDelete = addresses.firstWhere(
            (addr) => addr.id == addressId,
        orElse: () => throw Exception('Address not found'),
      );

      addresses.removeWhere((addr) => addr.id == addressId);

      // If deleted address was default and there are other addresses, make first one default
      if (addressToDelete.isDefault && addresses.isNotEmpty) {
        addresses[0] = addresses[0].copyWith(isDefault: true);
      }

      await _firestore.collection('users').doc(_userId).update({
        'addresses': addresses.map((addr) => addr.toJson()).toList(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete address: $e');
    }
  }

  Future<void> setDefaultAddress(String addressId) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final addresses = await getAddresses();

      // Remove default from all addresses
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = addresses[i].copyWith(isDefault: false);
      }

      // Set selected address as default
      final index = addresses.indexWhere((addr) => addr.id == addressId);
      if (index != -1) {
        addresses[index] = addresses[index].copyWith(isDefault: true);
      } else {
        throw Exception('Address not found');
      }

      await _firestore.collection('users').doc(_userId).update({
        'addresses': addresses.map((addr) => addr.toJson()).toList(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to set default address: $e');
    }
  }

  Future<Address?> getDefaultAddress() async {
    try {
      final addresses = await getAddresses();
      return addresses.firstWhere(
            (addr) => addr.isDefault,
        orElse: () => addresses.isNotEmpty ? addresses.first : throw Exception('No addresses found'),
      );
    } catch (e) {
      return null;
    }
  }

  Future<Address?> getAddressById(String addressId) async {
    try {
      final addresses = await getAddresses();
      return addresses.firstWhere(
            (addr) => addr.id == addressId,
        orElse: () => throw Exception('Address not found'),
      );
    } catch (e) {
      return null;
    }
  }

  Future<bool> hasAddresses() async {
    try {
      final addresses = await getAddresses();
      return addresses.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}