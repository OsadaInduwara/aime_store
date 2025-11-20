// lib/core/presentation/widgets/smooth_loading_overlay.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Smooth loading overlay that prevents UI frame collapsing
class SmoothLoadingOverlay extends StatefulWidget {
  const SmoothLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.backgroundColor,
    this.loadingColor,
    this.fadeInDuration = const Duration(milliseconds: 150),
    this.fadeOutDuration = const Duration(milliseconds: 100),
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? backgroundColor;
  final Color? loadingColor;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;

  @override
  State<SmoothLoadingOverlay> createState() => _SmoothLoadingOverlayState();
}

class _SmoothLoadingOverlayState extends State<SmoothLoadingOverlay>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: widget.fadeInDuration,
      reverseDuration: widget.fadeOutDuration,
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticInOut,
    ));

    if (widget.isLoading) {
      _fadeController.forward();
      _scaleController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(SmoothLoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _fadeController.forward();
        _scaleController.repeat(reverse: true);
      } else {
        _fadeController.reverse();
        _scaleController.stop();
      }
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        // Main content - always rendered to prevent layout shifts
        widget.child,

        // Loading overlay
        AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            if (_fadeAnimation.value == 0.0) {
              return const SizedBox.shrink();
            }

            return Opacity(
              opacity: _fadeAnimation.value,
              child: Container(
                color: widget.backgroundColor ??
                       Colors.black.withOpacity(0.3),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: CircularProgressIndicator(
                                  color: widget.loadingColor ??
                                         theme.colorScheme.primary,
                                  strokeWidth: 3,
                                ),
                              ),
                            );
                          },
                        ),
                        if (widget.message != null) ...[
                          SizedBox(height: 16.h),
                          Text(
                            widget.message!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Extension for easy usage in screens
extension LoadingOverlayExtension on Widget {
  Widget withSmoothLoading({
    required bool isLoading,
    String? message,
    Color? backgroundColor,
    Color? loadingColor,
  }) {
    return SmoothLoadingOverlay(
      isLoading: isLoading,
      message: message,
      backgroundColor: backgroundColor,
      loadingColor: loadingColor,
      child: this,
    );
  }
}
