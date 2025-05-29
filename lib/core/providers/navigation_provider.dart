// lib/core/providers/navigation_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class Navigation extends _$Navigation {
  @override
  int build() {
    return 0; // Default to home tab
  }

  void setIndex(int index) {
    state = index;
  }
}
