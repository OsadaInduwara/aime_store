// test/services/search_service_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aime_store/core/services/search_service.dart';

@GenerateMocks([FirebaseFirestore, Query, QuerySnapshot])
void main() {
  group('SearchService', () {
    late SearchService searchService;

    setUp(() {
      searchService = SearchService();
    });

    group('Search Filters', () {
      test('should create filters with all parameters', () {
        final filters = SearchFilters(
          minPrice: 100.0,
          maxPrice: 1000.0,
          categories: ['electronics', 'phones'],
          minRating: 4.0,
          sortBy: 'price_asc',
        );

        expect(filters.minPrice, 100.0);
        expect(filters.maxPrice, 1000.0);
        expect(filters.categories, ['electronics', 'phones']);
        expect(filters.minRating, 4.0);
        expect(filters.sortBy, 'price_asc');
      });

      test('should create filters with partial parameters', () {
        final filters = SearchFilters(
          minPrice: 100.0,
          sortBy: 'rating',
        );

        expect(filters.minPrice, 100.0);
        expect(filters.maxPrice, null);
        expect(filters.categories, null);
        expect(filters.sortBy, 'rating');
      });

      test('should copy filters with new values', () {
        final original = SearchFilters(
          minPrice: 100.0,
          maxPrice: 1000.0,
        );

        final copied = original.copyWith(
          minPrice: 200.0,
          sortBy: 'price_desc',
        );

        expect(copied.minPrice, 200.0);
        expect(copied.maxPrice, 1000.0);
        expect(copied.sortBy, 'price_desc');
      });
    });

    group('Search Suggestions', () {
      test('should return empty list for empty query', () async {
        final suggestions = await searchService.getSearchSuggestions('');
        expect(suggestions, isEmpty);
      });
    });

    group('Trending Searches', () {
      test('should return trending searches', () async {
        final trending = await searchService.getTrendingSearches();
        expect(trending, isNotEmpty);
        expect(trending, contains('Smartphones'));
      });
    });
  });
}
