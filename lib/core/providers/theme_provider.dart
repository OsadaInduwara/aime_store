// lib/core/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';
import '../utils/app_constants.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  AppThemeData build() {
    _loadTheme();
    return AppThemeData(
      themeMode: ThemeMode.system,
      lightTheme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeIndex = prefs.getInt(AppConstants.themeKey) ?? 0;
      final themeMode = ThemeMode.values[themeIndex];

      state = state.copyWith(themeMode: themeMode);
    } catch (e) {
      // Use default theme if loading fails
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(AppConstants.themeKey, themeMode.index);
      state = state.copyWith(themeMode: themeMode);
    } catch (e) {
      // Handle error
    }
  }
}

class AppThemeData {
  final ThemeMode themeMode;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const AppThemeData({
    required this.themeMode,
    required this.lightTheme,
    required this.darkTheme,
  });

  AppThemeData copyWith({
    ThemeMode? themeMode,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
  }) {
    return AppThemeData(
      themeMode: themeMode ?? this.themeMode,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }
}

final themeProvider = themeNotifierProvider;