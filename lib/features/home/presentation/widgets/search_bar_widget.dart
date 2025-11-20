// lib/features/home/widgets/search_bar_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.push('/search'),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
          border: Border.all(color: theme.dividerColor),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: theme.textTheme.bodySmall?.color,
              size: 20.w,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                l10n.searchProducts,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ),
            Icon(
              Icons.tune,
              color: theme.textTheme.bodySmall?.color,
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
