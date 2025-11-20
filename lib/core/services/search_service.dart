// lib/core/services/search_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/product_model.dart';

/// Search service provider
final searchServiceProvider = Provider<SearchService>((ref) {
  return SearchService();
});

/// Search filters
class SearchFilters {
  final double? minPrice;
  final double? maxPrice;
  final List<String>? categories;
  final double? minRating;
  final String? sortBy; // 'price_asc', 'price_desc', 'rating', 'newest'

  const SearchFilters({
    this.minPrice,
    this.maxPrice,
    this.categories,
    this.minRating,
    this.sortBy,
  });

  SearchFilters copyWith({
    double? minPrice,
    double? maxPrice,
    List<String>? categories,
    double? minRating,
    String? sortBy,
  }) {
    return SearchFilters(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      categories: categories ?? this.categories,
      minRating: minRating ?? this.minRating,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

/// Search service for products
class SearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Search products
  Future<List<ProductModel>> searchProducts({
    required String query,
    SearchFilters? filters,
    int limit = 20,
  }) async {
    try {
      Query productsQuery = _firestore.collection('products');

      // Apply filters
      if (filters != null) {
        // Category filter
        if (filters.categories != null && filters.categories!.isNotEmpty) {
          productsQuery = productsQuery.where(
            'category',
            whereIn: filters.categories,
          );
        }

        // Price range filter
        if (filters.minPrice != null) {
          productsQuery = productsQuery.where('price', isGreaterThanOrEqualTo: filters.minPrice);
        }
        if (filters.maxPrice != null) {
          productsQuery = productsQuery.where('price', isLessThanOrEqualTo: filters.maxPrice);
        }

        // Rating filter
        if (filters.minRating != null) {
          productsQuery = productsQuery.where('rating', isGreaterThanOrEqualTo: filters.minRating);
        }

        // Sort
        if (filters.sortBy != null) {
          switch (filters.sortBy) {
            case 'price_asc':
              productsQuery = productsQuery.orderBy('price', descending: false);
              break;
            case 'price_desc':
              productsQuery = productsQuery.orderBy('price', descending: true);
              break;
            case 'rating':
              productsQuery = productsQuery.orderBy('rating', descending: true);
              break;
            case 'newest':
              productsQuery = productsQuery.orderBy('createdAt', descending: true);
              break;
          }
        }
      }

      // Limit results
      productsQuery = productsQuery.limit(limit);

      final snapshot = await productsQuery.get();

      // Filter by search query (client-side for now)
      // TODO: Implement Algolia or similar for better search
      final products = snapshot.docs
          .map((doc) => ProductModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
          .where((product) {
            final queryLower = query.toLowerCase();
            return product.name.toLowerCase().contains(queryLower) ||
                   (product.description?.toLowerCase().contains(queryLower) ?? false);
          })
          .toList();

      return products;
    } catch (e) {
      throw Exception('Search failed: $e');
    }
  }

  /// Get search suggestions
  Future<List<String>> getSearchSuggestions(String query) async {
    if (query.isEmpty) return [];

    try {
      // Get products matching the query
      final products = await searchProducts(query: query, limit: 5);

      // Extract unique product names
      return products.map((p) => p.name).toSet().toList();
    } catch (e) {
      return [];
    }
  }

  /// Get trending searches
  Future<List<String>> getTrendingSearches() async {
    // TODO: Implement analytics-based trending searches
    return [
      'Smartphones',
      'Laptops',
      'Headphones',
      'Watches',
      'Cameras',
    ];
  }

  /// Get products by category
  Future<List<ProductModel>> getProductsByCategory(
    String categoryId, {
    SearchFilters? filters,
    int limit = 20,
  }) async {
    try {
      Query query = _firestore
          .collection('products')
          .where('category', isEqualTo: categoryId);

      // Apply filters
      if (filters != null) {
        if (filters.minPrice != null) {
          query = query.where('price', isGreaterThanOrEqualTo: filters.minPrice);
        }
        if (filters.maxPrice != null) {
          query = query.where('price', isLessThanOrEqualTo: filters.maxPrice);
        }
        if (filters.minRating != null) {
          query = query.where('rating', isGreaterThanOrEqualTo: filters.minRating);
        }

        // Sort
        if (filters.sortBy != null) {
          switch (filters.sortBy) {
            case 'price_asc':
              query = query.orderBy('price', descending: false);
              break;
            case 'price_desc':
              query = query.orderBy('price', descending: true);
              break;
            case 'rating':
              query = query.orderBy('rating', descending: true);
              break;
            case 'newest':
              query = query.orderBy('createdAt', descending: true);
              break;
          }
        }
      }

      query = query.limit(limit);

      final snapshot = await query.get();

      return snapshot.docs
          .map((doc) => ProductModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
          .toList();
    } catch (e) {
      throw Exception('Failed to get products by category: $e');
    }
  }
}
