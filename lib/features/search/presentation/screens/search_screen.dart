// lib/features/search/screens/search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/presentation/providers/search_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/product_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/providers/recommendation_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.trim().length >= AppConstants.minSearchQueryLength) {
      // Track search behavior
      final behaviorTracker = ref.read(userBehaviorTrackerProvider);
      behaviorTracker.trackSearch(
        query.trim(),
        metadata: {
          'timestamp': DateTime.now().toIso8601String(),
          'query_length': query.trim().length,
        },
      );

      ref.read(searchProvider.notifier).search(query.trim());
    } else {
      ref.read(searchProvider.notifier).clearResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: l10n.searchProducts,
            border: InputBorder.none,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
          style: theme.textTheme.bodyLarge,
          onChanged: _performSearch,
          onSubmitted: _performSearch,
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              onPressed: () {
                _searchController.clear();
                ref.read(searchProvider.notifier).clearResults();
              },
              icon: const Icon(Icons.clear),
            ),
        ],
      ),
      body: searchState.when(
        data: (results) {
          if (_searchController.text.trim().isEmpty) {
            return _buildSearchSuggestions();
          }

          if (results.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 80.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No results found',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Try different keywords',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding.w),
            child: MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppConstants.productsGridCrossAxisCount,
              ),
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ProductCard(product: results[index]);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error searching products'),
        ),
      ),
    );
  }

  Widget _buildSearchSuggestions() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Searches',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              'Cakes',
              'Crafts',
              'Electronics',
              'Fashion',
              'Food',
              'Home',
            ].map((suggestion) => GestureDetector(
              onTap: () {
                _searchController.text = suggestion;
                _performSearch(suggestion);
              },
              child: Chip(
                label: Text(suggestion),
                backgroundColor: Colors.grey[100],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
