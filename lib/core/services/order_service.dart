// lib/core/services/order_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../data/models/order_model.dart';
import '../data/models/cart_model.dart';
import '../data/models/user_model.dart';

/// Order service provider
final orderServiceProvider = Provider<OrderService>((ref) {
  return OrderService();
});

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _uuid = const Uuid();

  String? get _userId => _auth.currentUser?.uid;

  /// Create order from cart
  Future<OrderModel> createOrder({
    required List<CartItemModel> cartItems,
    required String storeId,
    required CustomerInfo customer,
    required DeliveryInfo delivery,
    required PaymentInfo payment,
    String? customerNotes,
  }) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      // Calculate pricing
      final pricing = _calculatePricing(cartItems, delivery);

      // Create order items
      final orderItems = cartItems.map((item) => OrderItem(
        productId: item.productId,
        productName: item.productName,
        productImage: item.productImage,
        variantId: item.variantId,
        variantName: item.variantName,
        quantity: item.quantity,
        unitPrice: item.price,
        totalPrice: item.price * item.quantity,
      )).toList();

      // Generate order number
      final orderNumber = _generateOrderNumber();

      // Create order model
      final order = OrderModel(
        id: '', // Will be set by Firestore
        orderNumber: orderNumber,
        customerId: _userId!,
        storeId: storeId,
        items: orderItems,
        pricing: pricing,
        customer: customer,
        delivery: delivery,
        payment: payment,
        status: 'pending',
        statusHistory: [
          StatusHistory(
            status: 'pending',
            timestamp: DateTime.now(),
            note: 'Order placed',
            updatedBy: _userId!,
          ),
        ],
        customerNotes: customerNotes,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to Firestore
      final docRef = await _firestore.collection('orders').add(
        order.toJson()..remove('id'),
      );

      return order.copyWith(id: docRef.id);
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  /// Get user orders
  Future<List<OrderModel>> getUserOrders({OrderStatus? status}) async {
    if (_userId == null) return [];

    try {
      Query query = _firestore
          .collection('orders')
          .where('customerId', isEqualTo: _userId)
          .orderBy('createdAt', descending: true);

      if (status != null) {
        final statusStrings = _getStatusStrings(status);
        query = query.where('status', whereIn: statusStrings);
      }

      final querySnapshot = await query.get();

      return querySnapshot.docs
          .map((doc) => OrderModel.fromJson({
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load orders: $e');
    }
  }

  /// Get vendor orders
  Future<List<OrderModel>> getVendorOrders(String storeId, {String? status}) async {
    try {
      Query query = _firestore
          .collection('orders')
          .where('storeId', isEqualTo: storeId)
          .orderBy('createdAt', descending: true);

      if (status != null) {
        query = query.where('status', isEqualTo: status);
      }

      final querySnapshot = await query.get();

      return querySnapshot.docs
          .map((doc) => OrderModel.fromJson({
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load vendor orders: $e');
    }
  }

  /// Get order by ID
  Future<OrderModel?> getOrderById(String orderId) async {
    try {
      final doc = await _firestore.collection('orders').doc(orderId).get();

      if (doc.exists) {
        return OrderModel.fromJson({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get order: $e');
    }
  }

  /// Update order status
  Future<void> updateOrderStatus({
    required String orderId,
    required String newStatus,
    String? note,
  }) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      final statusUpdate = StatusHistory(
        status: newStatus,
        timestamp: DateTime.now(),
        note: note,
        updatedBy: _userId!,
      );

      final updates = {
        'status': newStatus,
        'statusHistory': FieldValue.arrayUnion([statusUpdate.toJson()]),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      // Add timestamp fields based on status
      switch (newStatus) {
        case 'confirmed':
          updates['confirmedAt'] = FieldValue.serverTimestamp();
          break;
        case 'shipped':
          updates['shippedAt'] = FieldValue.serverTimestamp();
          break;
        case 'delivered':
          updates['deliveredAt'] = FieldValue.serverTimestamp();
          break;
        case 'cancelled':
          updates['cancelledAt'] = FieldValue.serverTimestamp();
          break;
      }

      await _firestore.collection('orders').doc(orderId).update(updates);
    } catch (e) {
      throw Exception('Failed to update order status: $e');
    }
  }

  /// Cancel order
  Future<void> cancelOrder(String orderId, String reason) async {
    await updateOrderStatus(
      orderId: orderId,
      newStatus: 'cancelled',
      note: reason,
    );
  }

  /// Calculate order pricing
  OrderPricing _calculatePricing(List<CartItemModel> items, DeliveryInfo delivery) {
    final subtotal = items.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    final deliveryFee = delivery.type == 'home_delivery' ? 300.0 : 0.0;
    final tax = subtotal * 0.0; // No tax for now
    final discount = 0.0; // No discount for now
    final total = subtotal + deliveryFee + tax - discount;

    return OrderPricing(
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      tax: tax,
      discount: discount,
      total: total,
      currency: 'LKR',
    );
  }

  /// Generate unique order number
  String _generateOrderNumber() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = _uuid.v4().substring(0, 4).toUpperCase();
    return 'ORD-$timestamp-$random';
  }

  /// Get status strings for filtering
  List<String> _getStatusStrings(OrderStatus status) {
    switch (status) {
      case OrderStatus.active:
        return ['pending', 'confirmed', 'processing', 'ready', 'shipped'];
      case OrderStatus.completed:
        return ['delivered'];
      case OrderStatus.cancelled:
        return ['cancelled', 'refunded'];
    }
  }

  /// Get order statistics for vendor
  Future<Map<String, int>> getVendorOrderStats(String storeId) async {
    try {
      final orders = await getVendorOrders(storeId);

      return {
        'total': orders.length,
        'pending': orders.where((o) => o.status == 'pending').length,
        'confirmed': orders.where((o) => o.status == 'confirmed').length,
        'processing': orders.where((o) => o.status == 'processing').length,
        'shipped': orders.where((o) => o.status == 'shipped').length,
        'delivered': orders.where((o) => o.status == 'delivered').length,
        'cancelled': orders.where((o) => o.status == 'cancelled').length,
      };
    } catch (e) {
      throw Exception('Failed to get order stats: $e');
    }
  }
}
