// lib/core/providers/language_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_constants.dart';

part 'language_provider.g.dart';

@riverpod
class Language extends _$Language {
  @override
  String build() {
    _loadLanguage();
    return AppConstants.defaultLanguage;
  }

  Future<void> _loadLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString(AppConstants.languageKey);
      if (savedLanguage != null) {
        state = savedLanguage;
      }
    } catch (e) {
      // Use default language if loading fails
    }
  }

  Future<void> setLanguage(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.languageKey, languageCode);
      state = languageCode;
    } catch (e) {
      // Handle error
    }
  }
}
