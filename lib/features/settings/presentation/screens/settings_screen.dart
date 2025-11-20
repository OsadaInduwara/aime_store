// lib/features/settings/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/providers/language_provider.dart';
import '../../../../core/presentation/providers/theme_provider.dart';
import '../../../../core/constants/app_constants.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final currentTheme = ref.watch(themeProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        children: [
          // Language Settings
          _SettingsSection(
            title: 'Language',
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('App Language'),
                subtitle: Text(currentLanguage == 'en' ? 'English' : 'සිංහල'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showLanguageDialog(context, ref),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Theme Settings
          _SettingsSection(
            title: 'Appearance',
            children: [
              ListTile(
                leading: const Icon(Icons.palette),
                title: const Text('Theme'),
                subtitle: Text(_getThemeName(currentTheme.themeMode)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showThemeDialog(context, ref),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Notification Settings
          _SettingsSection(
            title: 'Notifications',
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.notifications),
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive order updates and offers'),
                value: true,
                onChanged: (value) {
                  // Handle notification toggle
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.sms),
                title: const Text('SMS Notifications'),
                subtitle: const Text('Receive SMS for important updates'),
                value: false,
                onChanged: (value) {
                  // Handle SMS toggle
                },
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Privacy Settings
          _SettingsSection(
            title: 'Privacy & Security',
            children: [
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to privacy policy
                },
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to terms
                },
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // About Settings
          _SettingsSection(
            title: 'About',
            children: [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('App Version'),
                subtitle: Text('v${AppConstants.appVersion}'),
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Support'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to help
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('English'),
              value: 'en',
              groupValue: ref.read(languageProvider),
              onChanged: (value) {
                if (value != null) {
                  ref.read(languageProvider.notifier).setLanguage(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<String>(
              title: const Text('සිංහල'),
              value: 'si',
              groupValue: ref.read(languageProvider),
              onChanged: (value) {
                if (value != null) {
                  ref.read(languageProvider.notifier).setLanguage(value);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('System'),
              value: ThemeMode.system,
              groupValue: ref.read(themeProvider).themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeNotifierProvider.notifier).setThemeMode(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Light'),
              value: ThemeMode.light,
              groupValue: ref.read(themeProvider).themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeNotifierProvider.notifier).setThemeMode(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: ref.read(themeProvider).themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeNotifierProvider.notifier).setThemeMode(value);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getThemeName(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, bottom: 8.h),
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.primaryColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
