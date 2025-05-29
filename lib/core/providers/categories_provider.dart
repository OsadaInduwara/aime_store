// lib/core/providers/categories_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category_model.dart';
import '../services/category_service.dart';

// Service Provider
final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService();
});

// Top Categories Provider
final topCategoriesProvider = StateNotifierProvider<TopCategoriesNotifier, AsyncValue<List<CategoryModel>>>((ref) {
  return TopCategoriesNotifier(ref.read(categoryServiceProvider));
});

class TopCategoriesNotifier extends StateNotifier<AsyncValue<List<CategoryModel>>> {
  final CategoryService _categoryService;

  TopCategoriesNotifier(this._categoryService) : super(const AsyncValue.loading()) {
    loadCategories();
  }

  Future<void> loadCategories() async {
    state = const AsyncValue.loading();

    try {
      final categories = await _categoryService.getTopCategories();
      state = AsyncValue.data(categories);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadCategories();
  }
}

// All Categories Provider
final allCategoriesProvider = StateNotifierProvider<AllCategoriesNotifier, AsyncValue<List<CategoryModel>>>((ref) {
  return AllCategoriesNotifier(ref.read(categoryServiceProvider));
});

class AllCategoriesNotifier extends StateNotifier<AsyncValue<List<CategoryModel>>> {
  final CategoryService _categoryService;

  AllCategoriesNotifier(this._categoryService) : super(const AsyncValue.loading()) {
    loadCategories();
  }

  Future<void> loadCategories() async {
    state = const AsyncValue.loading();

    try {
      final categories = await _categoryService.getAllCategories();
      state = AsyncValue.data(categories);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadCategories();
  }
}

// Category Detail Provider
final categoryDetailProvider = FutureProvider.family<CategoryModel?, String>((ref, categoryId) async {
  final categoryService = ref.read(categoryServiceProvider);
  return await categoryService.getCategoryById(categoryId);
});

// Sub Categories Provider
final subCategoriesProvider = FutureProvider.family<List<CategoryModel>, String>((ref, parentId) async {
  final categoryService = ref.read(categoryServiceProvider);
  return await categoryService.getSubCategories(parentId);
});