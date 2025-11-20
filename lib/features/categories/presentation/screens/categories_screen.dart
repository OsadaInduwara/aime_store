// lib/features/categories/screens/categories_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/providers/categories_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(topCategoriesProvider.notifier).loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(topCategoriesProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.categories),
        centerTitle: true,
      ),
      body: categoriesAsync.when(
        data: (categories) => GridView.builder(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () => context.push('/category/${category.id}'),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64.w,
                      height: 64.w,
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getCategoriesScreenIcon(category.name),
                        size: 32.w,
                        color: theme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      category.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      category.description,
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error loading categories'),
              ElevatedButton(
                onPressed: () => ref.read(topCategoriesProvider.notifier).loadCategories(),
                child: Text(l10n.tryAgain),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoriesScreenIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'electronics':
        return Icons.phone_android;
      case 'fashion':
        return Icons.checkroom;
      case 'home':
        return Icons.home_outlined;
      case 'beauty':
        return Icons.face;
      case 'sports':
        return Icons.sports_soccer;
      case 'books':
        return Icons.menu_book;
      case 'food':
        return Icons.restaurant;
      case 'cakes':
        return Icons.cake;
      case 'crafts':
        return Icons.palette;
      default:
        return Icons.category;
    }
  }
}
