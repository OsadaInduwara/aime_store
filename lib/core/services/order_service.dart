// lib/core/services/order_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/order_model.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

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
}
