// lib/core/presentation/widgets/global_error_handler.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/global_error_provider.dart';

/// Global error handler that listens to error states and displays them appropriately
class GlobalErrorHandler extends ConsumerStatefulWidget {
  final Widget child;

  const GlobalErrorHandler({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<GlobalErrorHandler> createState() => _GlobalErrorHandlerState();
}

class _GlobalErrorHandlerState extends ConsumerState<GlobalErrorHandler> {
  @override
  Widget build(BuildContext context) {
    ref.listen<ErrorState>(
      globalErrorProvider,
      (previous, next) {
        if (next.hasError) {
          _showError(context, next);
        }
      },
    );

    final errorState = ref.watch(globalErrorProvider);

    return Stack(
      children: [
        widget.child,
        if (errorState.hasError && errorState.displayType == ErrorDisplayType.banner)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _ErrorBanner(errorState: errorState),
          ),
      ],
    );
  }

  void _showError(BuildContext context, ErrorState errorState) {
    switch (errorState.displayType) {
      case ErrorDisplayType.snackbar:
        _showSnackbar(context, errorState);
        break;
      case ErrorDisplayType.dialog:
        _showDialog(context, errorState);
        break;
      case ErrorDisplayType.banner:
        // Banner is shown in the widget tree
        break;
      case ErrorDisplayType.inline:
        // Inline errors are handled by individual widgets
        break;
      case ErrorDisplayType.none:
        // No display needed
        break;
    }
  }

  void _showSnackbar(BuildContext context, ErrorState errorState) {
    final snackBar = SnackBar(
      content: _SnackbarContent(errorState: errorState),
      backgroundColor: _getBackgroundColor(errorState.severity),
      duration: _getDuration(errorState.severity),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16.r),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      action: errorState.canRetry
          ? SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () => _handleRetry(errorState),
            )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showDialog(BuildContext context, ErrorState errorState) {
    showDialog<void>(
      context: context,
      barrierDismissible: errorState.severity != ErrorSeverity.critical,
      builder: (context) => _ErrorDialog(errorState: errorState),
    );
  }

  Color _getBackgroundColor(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return Colors.blue;
      case ErrorSeverity.warning:
        return Colors.orange;
      case ErrorSeverity.error:
        return Colors.red;
      case ErrorSeverity.critical:
        return Colors.red[900]!;
    }
  }

  Duration _getDuration(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return const Duration(seconds: 3);
      case ErrorSeverity.warning:
        return const Duration(seconds: 4);
      case ErrorSeverity.error:
        return const Duration(seconds: 5);
      case ErrorSeverity.critical:
        return const Duration(seconds: 8);
    }
  }

  void _handleRetry(ErrorState errorState) {
    ref.read(globalErrorProvider.notifier).clearError();
    // TODO: Implement retry logic based on retryAction
    // This would typically involve calling a method on the appropriate provider
  }
}

class _SnackbarContent extends StatelessWidget {
  final ErrorState errorState;

  const _SnackbarContent({
    required this.errorState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          _getIcon(errorState.severity),
          color: Colors.white,
          size: 20.sp,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (errorState.title.isNotEmpty)
                Text(
                  errorState.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              Text(
                errorState.message,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getIcon(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return Icons.info_outline;
      case ErrorSeverity.warning:
        return Icons.warning_outlined;
      case ErrorSeverity.error:
        return Icons.error_outline;
      case ErrorSeverity.critical:
        return Icons.dangerous_outlined;
    }
  }
}

class _ErrorDialog extends ConsumerWidget {
  final ErrorState errorState;

  const _ErrorDialog({
    required this.errorState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Row(
        children: [
          Icon(
            _getIcon(errorState.severity),
            color: _getIconColor(errorState.severity),
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              errorState.title,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            errorState.message,
            style: TextStyle(fontSize: 14.sp),
          ),
          if (errorState.code.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              'Error Code: ${errorState.code}',
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ],
      ),
      actions: [
        if (errorState.canRetry)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _handleRetry(ref);
            },
            child: const Text('Retry'),
          ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            ref.read(globalErrorProvider.notifier).clearError();
          },
          child: Text(
            errorState.severity == ErrorSeverity.critical ? 'Close' : 'OK',
          ),
        ),
      ],
    );
  }

  IconData _getIcon(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return Icons.info_outline;
      case ErrorSeverity.warning:
        return Icons.warning_outlined;
      case ErrorSeverity.error:
        return Icons.error_outline;
      case ErrorSeverity.critical:
        return Icons.dangerous_outlined;
    }
  }

  Color _getIconColor(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return Colors.blue;
      case ErrorSeverity.warning:
        return Colors.orange;
      case ErrorSeverity.error:
        return Colors.red;
      case ErrorSeverity.critical:
        return Colors.red[900]!;
    }
  }

  void _handleRetry(WidgetRef ref) {
    ref.read(globalErrorProvider.notifier).clearError();
    // TODO: Implement retry logic based on retryAction
  }
}

class _ErrorBanner extends ConsumerWidget {
  final ErrorState errorState;

  const _ErrorBanner({
    required this.errorState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: _getBackgroundColor(errorState.severity),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              Icon(
                _getIcon(errorState.severity),
                color: Colors.white,
                size: 20.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (errorState.title.isNotEmpty)
                      Text(
                        errorState.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    Text(
                      errorState.message,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (errorState.canRetry)
                TextButton(
                  onPressed: () => _handleRetry(ref),
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              IconButton(
                onPressed: () {
                  ref.read(globalErrorProvider.notifier).clearError();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return Colors.blue;
      case ErrorSeverity.warning:
        return Colors.orange;
      case ErrorSeverity.error:
        return Colors.red;
      case ErrorSeverity.critical:
        return Colors.red[900]!;
    }
  }

  IconData _getIcon(ErrorSeverity severity) {
    switch (severity) {
      case ErrorSeverity.info:
        return Icons.info_outline;
      case ErrorSeverity.warning:
        return Icons.warning_outlined;
      case ErrorSeverity.error:
        return Icons.error_outline;
      case ErrorSeverity.critical:
        return Icons.dangerous_outlined;
    }
  }

  void _handleRetry(WidgetRef ref) {
    ref.read(globalErrorProvider.notifier).clearError();
    // TODO: Implement retry logic based on retryAction
  }
}

/// Inline error widget for form validation
class InlineErrorWidget extends ConsumerWidget {
  final String? fieldName;
  final Widget child;

  const InlineErrorWidget({
    super.key,
    this.fieldName,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorState = ref.watch(globalErrorProvider);

    final hasFieldError = errorState.hasError &&
        errorState.displayType == ErrorDisplayType.inline &&
        (fieldName == null || errorState.metadata['field'] == fieldName);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        if (hasFieldError) ...[
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              errorState.message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ],
    );
  }
}