import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'core/services/firebase_service.dart';
import 'core/services/notification_service.dart';
import 'core/config/firebase_options.dart';
import 'core/utils/admin_setup_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await FirebaseService.initialize();
  await NotificationService.initialize();

  // Initialize marketplace categories (only runs once)
  try {
    await AdminSetupUtils.initializeMarketplace();
  } catch (e) {
    print('Warning: Could not initialize marketplace categories: $e');
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ProviderScope(
          child: ECommerceApp(),
        );
      },
    ),
  );
}
