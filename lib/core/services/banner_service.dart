// lib/core/services/banner_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/banner_model.dart';

class BannerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BannerModel>> getActiveBanners() async {
    try {
      final now = DateTime.now();
      final querySnapshot = await _firestore
          .collection('banners')
          .where('isActive', isEqualTo: true)
          .where('expiresAt', isGreaterThan: Timestamp.fromDate(now))
          .orderBy('displayOrder')
          .get();

      return querySnapshot.docs
          .map((doc) => BannerModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load banners: $e');
    }
  }
}