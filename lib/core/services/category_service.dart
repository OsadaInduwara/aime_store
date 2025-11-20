// lib/core/services/category_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/models/category_model.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getTopCategories({int limit = 10}) async {
    try {
      final querySnapshot = await _firestore
          .collection('categories')
          .where('settings.isActive', isEqualTo: true)
          .where('parentId', isNull: true)
          .orderBy('settings.displayOrder')
          .limit(limit)
          .get();

      return querySnapshot.docs
          .map((doc) => CategoryModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await _firestore
          .collection('categories')
          .where('settings.isActive', isEqualTo: true)
          .orderBy('settings.displayOrder')
          .get();

      return querySnapshot.docs
          .map((doc) => CategoryModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load all categories: $e');
    }
  }

  Future<CategoryModel?> getCategoryById(String categoryId) async {
    try {
      final doc = await _firestore.collection('categories').doc(categoryId).get();

      if (doc.exists) {
        return CategoryModel.fromJson({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get category: $e');
    }
  }

  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      final querySnapshot = await _firestore
          .collection('categories')
          .where('parentId', isEqualTo: parentId)
          .where('settings.isActive', isEqualTo: true)
          .orderBy('settings.displayOrder')
          .get();

      return querySnapshot.docs
          .map((doc) => CategoryModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      }))
          .toList();
    } catch (e) {
      throw Exception('Failed to load subcategories: $e');
    }
  }
}
