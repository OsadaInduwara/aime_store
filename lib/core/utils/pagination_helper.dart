// lib/core/utils/pagination_helper.dart

import 'package:cloud_firestore/cloud_firestore.dart';

/// Pagination helper for Firestore queries
class PaginationHelper<T> {
  final Query query;
  final T Function(DocumentSnapshot) fromSnapshot;
  final int pageSize;

  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;
  bool _isLoading = false;

  PaginationHelper({
    required this.query,
    required this.fromSnapshot,
    this.pageSize = 20,
  });

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;

  /// Load next page
  Future<List<T>> loadNextPage() async {
    if (_isLoading || !_hasMore) return [];

    _isLoading = true;

    try {
      Query paginatedQuery = query.limit(pageSize);

      if (_lastDocument != null) {
        paginatedQuery = paginatedQuery.startAfterDocument(_lastDocument!);
      }

      final snapshot = await paginatedQuery.get();

      if (snapshot.docs.isEmpty) {
        _hasMore = false;
        return [];
      }

      if (snapshot.docs.length < pageSize) {
        _hasMore = false;
      }

      _lastDocument = snapshot.docs.last;

      return snapshot.docs.map((doc) => fromSnapshot(doc)).toList();
    } finally {
      _isLoading = false;
    }
  }

  /// Reset pagination
  void reset() {
    _lastDocument = null;
    _hasMore = true;
    _isLoading = false;
  }
}

/// Paginated list state
class PaginatedListState<T> {
  final List<T> items;
  final bool hasMore;
  final bool isLoading;
  final String? error;

  const PaginatedListState({
    this.items = const [],
    this.hasMore = true,
    this.isLoading = false,
    this.error,
  });

  PaginatedListState<T> copyWith({
    List<T>? items,
    bool? hasMore,
    bool? isLoading,
    String? error,
  }) {
    return PaginatedListState<T>(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
