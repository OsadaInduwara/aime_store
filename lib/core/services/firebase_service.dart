//// lib/core/services/firebase_service.dart - COMPLETE VERSION
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

class FirebaseService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

  static Future<void> initialize() async {
    // Initialize Crashlytics
    if (!kDebugMode) {
      FlutterError.onError = crashlytics.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (error, stack) {
        crashlytics.recordError(error, stack, fatal: true);
        return true;
      };
    }

    // Set analytics collection enabled
    await analytics.setAnalyticsCollectionEnabled(!kDebugMode);

    // Set crashlytics collection enabled
    await crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  // Analytics Methods
  static Future<void> logEvent(String name, [Map<String, Object>? parameters]) async {
    if (!kDebugMode) {
      await analytics.logEvent(name: name, parameters: parameters);
    }
  }

  static Future<void> setUserId(String userId) async {
    if (!kDebugMode) {
      await analytics.setUserId(id: userId);
      await crashlytics.setUserIdentifier(userId);
    }
  }

  static Future<void> setUserProperty(String name, String value) async {
    if (!kDebugMode) {
      await analytics.setUserProperty(name: name, value: value);
    }
  }

  static Future<void> logLogin(String method) async {
    await logEvent('login', {'login_method': method});
  }

  static Future<void> logSignUp(String method) async {
    await logEvent('sign_up', {'sign_up_method': method});
  }

  static Future<void> logPurchase({
    required double value,
    required String currency,
    required String transactionId,
  }) async {
    await logEvent('purchase', {
      'value': value,
      'currency': currency,
      'transaction_id': transactionId,
    });
  }

  static Future<void> logAddToCart({
    required String itemId,
    required String itemName,
    required double value,
  }) async {
    await logEvent('add_to_cart', {
      'item_id': itemId,
      'item_name': itemName,
      'value': value,
    });
  }

  // Crashlytics Methods
  static Future<void> recordError(dynamic exception, StackTrace? stack, [bool fatal = false]) async {
    if (!kDebugMode) {
      await crashlytics.recordError(exception, stack, fatal: fatal);
    }
  }

  static Future<void> log(String message) async {
    if (!kDebugMode) {
      await crashlytics.log(message);
    }
  }

  static Future<void> setCustomKey(String key, Object value) async {
    if (!kDebugMode) {
      await crashlytics.setCustomKey(key, value);
    }
  }
}