// lib/core/services/checkout_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import '../data/models/order_model.dart';
import '../data/models/user_model.dart';
import 'cart_service.dart';

class CheckoutService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  Future<void> placeOrder({
    required String addressId,
    required String paymentMethod,
    String? notes,
  }) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      // Get cart items
      final cartService = CartService();
      final cartItems = await cartService.getCartItems();

      if (cartItems.isEmpty) {
        throw Exception('Cart is empty');
      }

      // Get user data
      final userDoc = await _firestore.collection('users').doc(_userId).get();
      if (!userDoc.exists) throw Exception('User not found');

      final userData = userDoc.data()!;
      final user = UserModel.fromJson({'id': _userId, ...userData});

      // Find selected address
      final selectedAddress = user.addresses.firstWhere(
            (addr) => addr.id == addressId,
        orElse: () => throw Exception('Address not found'),
      );

      // Calculate totals
      final subtotal = cartItems.fold<double>(0, (sum, item) => sum + item.totalPrice);
      const deliveryFee = 0.0; // Calculate based on business logic
      final total = subtotal + deliveryFee;

      // Create order
      const uuid = Uuid();
      final orderId = uuid.v4();
      final orderNumber = 'ORD${DateTime.now().millisecondsSinceEpoch}';

      final order = OrderModel(
        id: orderId,
        orderNumber: orderNumber,
        customerId: _userId!,
        storeId: cartItems.first.storeId, // Assuming single store for now
        items: cartItems.map((item) => OrderItem(
          productId: item.productId,
          productName: item.productName,
          productImage: item.productImage,
          variantId: item.variantId,
          variantName: item.variantName,
          quantity: item.quantity,
          unitPrice: item.unitPrice,
          totalPrice: item.totalPrice,
          customizations: item.customizations,
          notes: item.notes,
        )).toList(),
        pricing: OrderPricing(
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
        ),
        customer: CustomerInfo(
          name: user.displayName,
          phoneNumber: user.phoneNumber,
          email: user.email,
        ),
        delivery: DeliveryInfo(
          type: 'home_delivery',
          address: selectedAddress,
        ),
        payment: PaymentInfo(
          method: paymentMethod,
          status: 'pending',
        ),
        status: 'pending',
        statusHistory: [
          StatusHistory(
            status: 'pending',
            timestamp: DateTime.now(),
            note: 'Order placed',
            updatedBy: _userId!,
          ),
        ],
        customerNotes: notes,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save order
      await _firestore.collection('orders').doc(orderId).set(order.toJson());

      // Clear cart
      await cartService.clearCart();
    } catch (e) {
      throw Exception('Failed to place order: $e');
    }
  }

  Future<double> calculateDeliveryFee({
    required String storeId,
    required String addressId,
    required double orderValue,
  }) async {
    try {
      // Get store delivery settings
      final storeDoc = await _firestore.collection('stores').doc(storeId).get();
      if (!storeDoc.exists) return 0.0;

      final storeData = storeDoc.data()!;
      final deliveryOptions = storeData['settings']['deliveryOptions'];

      final double baseFee = deliveryOptions['deliveryFee']?.toDouble() ?? 0.0;
      final double? freeDeliveryThreshold = deliveryOptions['freeDeliveryThreshold']?.toDouble();

      // Check if order qualifies for free delivery
      if (freeDeliveryThreshold != null && orderValue >= freeDeliveryThreshold) {
        return 0.0;
      }

      return baseFee;
    } catch (e) {
      // Return default delivery fee if calculation fails
      return 200.0; // Default LKR 200
    }
  }

  Future<bool> isStoreOpen(String storeId) async {
    try {
      final storeDoc = await _firestore.collection('stores').doc(storeId).get();
      if (!storeDoc.exists) return false;

      final storeData = storeDoc.data()!;
      final settings = storeData['settings'];

      if (!settings['acceptsOrders']) return false;

      // Check business hours
      final now = DateTime.now();
      final dayOfWeek = _getDayOfWeek(now.weekday);
      final businessHours = settings['businessHours'][dayOfWeek];

      if (businessHours['isClosed']) return false;

      // Parse time and check if store is open
      final openTime = _parseTime(businessHours['open']);
      final closeTime = _parseTime(businessHours['close']);
      final currentTime = TimeOfDay.fromDateTime(now);

      return _isTimeInRange(currentTime, openTime, closeTime);
    } catch (e) {
      return false;
    }
  }

  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1: return 'monday';
      case 2: return 'tuesday';
      case 3: return 'wednesday';
      case 4: return 'thursday';
      case 5: return 'friday';
      case 6: return 'saturday';
      case 7: return 'sunday';
      default: return 'monday';
    }
  }

  TimeOfDay _parseTime(String timeString) {
    final parts = timeString.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  bool _isTimeInRange(TimeOfDay current, TimeOfDay start, TimeOfDay end) {
    final currentMinutes = current.hour * 60 + current.minute;
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;

    if (startMinutes <= endMinutes) {
      // Same day
      return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
    } else {
      // Crosses midnight
      return currentMinutes >= startMinutes || currentMinutes <= endMinutes;
    }
  }

  Future<List<String>> getAvailablePaymentMethods(String storeId) async {
    try {
      final storeDoc = await _firestore.collection('stores').doc(storeId).get();
      if (!storeDoc.exists) return ['cash_on_delivery'];

      final storeData = storeDoc.data()!;
      final paymentMethods = storeData['settings']['paymentMethods'];

      final List<String> available = [];

      if (paymentMethods['cashOnDelivery'] == true) {
        available.add('cash_on_delivery');
      }
      if (paymentMethods['bankTransfer'] == true) {
        available.add('bank_transfer');
      }
      if (paymentMethods['cardPayment'] == true) {
        available.add('card_payment');
      }
      if (paymentMethods['digitalWallet'] == true) {
        available.add('digital_wallet');
      }

      return available.isEmpty ? ['cash_on_delivery'] : available;
    } catch (e) {
      return ['cash_on_delivery'];
    }
  }
}

// Import this for TimeOfDay
