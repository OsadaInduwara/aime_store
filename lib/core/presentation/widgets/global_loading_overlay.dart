// lib/core/presentation/widgets/global_loading_overlay.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../providers/global_loading_provider.dart';

/// Global loading overlay that shows contextual loading messages
class GlobalLoadingOverlay extends ConsumerWidget {
  final Widget child;

  const GlobalLoadingOverlay({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(globalLoadingProvider);

    return Stack(
      children: [
        child,
        if (loadingState.isLoading)
          Positioned.fill(
            child: _LoadingOverlayContent(loadingState: loadingState),
          ),
      ],
    );
  }
}

class _LoadingOverlayContent extends StatelessWidget {
  final LoadingState loadingState;

  const _LoadingOverlayContent({
    required this.loadingState,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Loading animation based on operation type
              _buildLoadingAnimation(),

              SizedBox(height: 16.h),

              // Loading message
              Text(
                loadingState.message,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              if (loadingState.operation.isNotEmpty) ...[
                SizedBox(height: 8.h),
                Text(
                  _getOperationSubtitle(loadingState.operation),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              // Progress indicator
              if (loadingState.showProgress) ...[
                SizedBox(height: 16.h),
                _buildProgressIndicator(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingAnimation() {
    // Use different animations based on operation type
    String animationAsset = _getAnimationAsset(loadingState.operation);

    return Container(
      width: 80.w,
      height: 80.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fallback circular progress indicator
          SizedBox(
            width: 60.w,
            height: 60.w,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getOperationColor(loadingState.operation),
              ),
            ),
          ),

          // Lottie animation if available
          if (animationAsset.isNotEmpty)
            Lottie.asset(
              animationAsset,
              width: 60.w,
              height: 60.w,
              fit: BoxFit.contain,
            )
          else
            Icon(
              _getOperationIcon(loadingState.operation),
              size: 32.sp,
              color: _getOperationColor(loadingState.operation),
            ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: loadingState.progress,
          backgroundColor: Theme.of(context).dividerColor.withOpacity(0.3),
          valueColor: AlwaysStoppedAnimation<Color>(
            _getOperationColor(loadingState.operation),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '${(loadingState.progress * 100).toInt()}%',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  String _getAnimationAsset(String operation) {
    // Return appropriate Lottie animation based on operation
    switch (operation) {
      case 'auth':
        return 'assets/animations/auth_loading.json';
      case 'product':
        return 'assets/animations/shopping_loading.json';
      case 'order':
        return 'assets/animations/order_loading.json';
      case 'file':
        return 'assets/animations/upload_loading.json';
      case 'sync':
        return 'assets/animations/sync_loading.json';
      case 'store':
        return 'assets/animations/store_loading.json';
      default:
        return ''; // Fallback to icon
    }
  }

  IconData _getOperationIcon(String operation) {
    switch (operation) {
      case 'auth':
        return Icons.person;
      case 'product':
        return Icons.shopping_bag;
      case 'order':
        return Icons.receipt_long;
      case 'file':
        return Icons.cloud_upload;
      case 'sync':
        return Icons.sync;
      case 'store':
        return Icons.store;
      default:
        return Icons.hourglass_empty;
    }
  }

  Color _getOperationColor(String operation) {
    switch (operation) {
      case 'auth':
        return Colors.blue;
      case 'product':
        return Colors.green;
      case 'order':
        return Colors.orange;
      case 'file':
        return Colors.purple;
      case 'sync':
        return Colors.teal;
      case 'store':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }

  String _getOperationSubtitle(String operation) {
    switch (operation) {
      case 'auth':
        return 'Securing your account';
      case 'product':
        return 'Fetching latest data';
      case 'order':
        return 'Processing your request';
      case 'file':
        return 'Transferring data';
      case 'sync':
        return 'Updating information';
      case 'store':
        return 'Loading store data';
      default:
        return 'Please wait...';
    }
  }
}

/// Compact loading indicator for inline use
class CompactLoadingIndicator extends ConsumerWidget {
  final String? message;
  final double size;
  final Color? color;

  const CompactLoadingIndicator({
    super.key,
    this.message,
    this.size = 20,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        if (message != null) ...[
          SizedBox(width: 8.w),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}

/// Loading button that shows loading state
class LoadingButton extends ConsumerWidget {
  final String text;
  final String loadingText;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonStyle? style;
  final Widget? icon;

  const LoadingButton({
    super.key,
    required this.text,
    required this.loadingText,
    this.onPressed,
    this.isLoading = false,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading) ...[
            SizedBox(
              width: 16.w,
              height: 16.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(loadingText),
          ] else ...[
            if (icon != null) ...[
              icon!,
              SizedBox(width: 8.w),
            ],
            Text(text),
          ],
        ],
      ),
    );
  }
}

/// Shimmer loading effect for list items
class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    if (widget.isLoading) {
      _animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(ShimmerLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final baseColor = widget.baseColor ?? Colors.grey[300]!;
    final highlightColor = widget.highlightColor ?? Colors.grey[100]!;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [baseColor, highlightColor, baseColor],
              stops: [
                0.0,
                _animation.value + 0.3,
                1.0,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}