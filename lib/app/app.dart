// lib/app/app.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/presentation/providers/language_provider.dart';
import '../core/presentation/providers/theme_provider.dart';
import '../core/presentation/providers/auth_provider.dart';
import '../core/router/app_router.dart';
import '../core/constants/app_constants.dart';
import '../l10n/app_localizations.dart';
import '../features/home/presentation/providers/recommendation_provider.dart';

class ECommerceApp extends ConsumerStatefulWidget {
  const ECommerceApp({super.key});

  @override
  ConsumerState<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends ConsumerState<ECommerceApp> {
  @override
  void initState() {
    super.initState();
    // Track app open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = ref.read(authProvider);
      if (authState.value != null) {
        final behaviorTracker = ref.read(userBehaviorTrackerProvider);
        behaviorTracker.trackAppOpen(metadata: {
          'platform': 'flutter',
          'timestamp': DateTime.now().toIso8601String(),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final router   = ref.watch(appRouterProvider);
    final locale   = ref.watch(languageProvider);
    final themeData= ref.watch(themeProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      // routing
      routerConfig: router,

      // theming
      theme:    themeData.lightTheme,
      darkTheme:themeData.darkTheme,
      themeMode:themeData.themeMode,

      // localization
      locale: Locale(locale),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppConstants.supportedLocales,

      // global TextScaler override
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(ctx).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}

