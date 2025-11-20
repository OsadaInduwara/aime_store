// lib/core/providers/theme_provider.dart - REPLACE YOUR CURRENT FILE WITH THIS
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/app_theme.dart';
import '../../constants/app_constants.dart';

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

class ThemeNotifier extends StateNotifier<AppThemeData> {
  ThemeNotifier() : super(AppThemeData(
    themeMode: ThemeMode.system,
    lightTheme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
  )) {
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeIndex = prefs.getInt(AppConstants.themeKey) ?? 0;
      final themeMode = ThemeMode.values[themeIndex];

      state = state.copyWith(themeMode: themeMode);
    } catch (e) {
      // Use default theme if loading fails
      debugPrint('Failed to load saved theme: $e');
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(AppConstants.themeKey, themeMode.index);
      state = state.copyWith(themeMode: themeMode);
    } catch (e) {
      debugPrint('Failed to save theme: $e');
    }
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppThemeData>(
      (ref) => ThemeNotifier(),
);

final themeProvider = Provider<AppThemeData>((ref) {
  return ref.watch(themeNotifierProvider);
});
