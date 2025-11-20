// lib/core/widgets/lazy_load_list.dart

import 'package:flutter/material.dart';

/// Lazy loading list view with pagination
class LazyLoadListView<T> extends StatefulWidget {
  final Future<List<T>> Function() onLoadMore;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final ScrollController? controller;
  final EdgeInsets? padding;

  const LazyLoadListView({
    super.key,
    required this.onLoadMore,
    required this.itemBuilder,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.controller,
    this.padding,
  });

  @override
  State<LazyLoadListView<T>> createState() => _LazyLoadListViewState<T>();
}

class _LazyLoadListViewState<T> extends State<LazyLoadListView<T>> {
  final List<T> _items = [];
  late ScrollController _scrollController;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_onScroll);
    _loadMore();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final newItems = await widget.onLoadMore();

      setState(() {
        _items.addAll(newItems);
        _hasMore = newItems.isNotEmpty;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty && _isLoading) {
      return widget.loadingWidget ??
          const Center(child: CircularProgressIndicator());
    }

    if (_items.isEmpty && !_isLoading) {
      if (_error != null) {
        return widget.errorWidget ??
            Center(child: Text('Error: $_error'));
      }
      return widget.emptyWidget ??
          const Center(child: Text('No items found'));
    }

    return ListView.builder(
      controller: _scrollController,
      padding: widget.padding,
      itemCount: _items.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _items.length) {
          return widget.loadingWidget ??
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
        }

        return widget.itemBuilder(context, _items[index], index);
      },
    );
  }
}
