import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/models/product_model.dart';
import '../../../../core/presentation/providers/cart_provider.dart';
import '../../../../core/presentation/providers/products_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../home/presentation/providers/recommendation_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Track product view when screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final behaviorTracker = ref.read(userBehaviorTrackerProvider);
      behaviorTracker.trackProductView(
        widget.productId,
        metadata: {
          'source': 'product_detail',
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productDetailProvider(widget.productId));
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return productAsync.when(
      data: (product) => Scaffold(
        bottomSheet: _buildProductDetailBottomSheet(context, ref, product!, l10n, theme),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildImageCarousel(product.images),
              ),
              actions: [
                IconButton(
                  onPressed: () { /* TODO: wishlist */ },
                  icon: const Icon(Icons.favorite_outline),
                ),
                IconButton(
                  onPressed: () { /* TODO: share */ },
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppConstants.defaultPadding.w),
                child: _buildProductInfo(context, ref, product, l10n, theme),
              ),
            ),
          ],
        ),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error loading product'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(List<String> imgs) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: imgs.length,
          itemBuilder: (c, i, _) => CachedNetworkImage(
            imageUrl: imgs[i],
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(
              color: Colors.grey[200],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (_, __, ___) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.error),
            ),
          ),
          options: CarouselOptions(viewportFraction: 1.0, height: 300.h),
        ),
      ],
    );
  }

  Widget _buildProductInfo(BuildContext context, WidgetRef ref,
      ProductModel product, AppLocalizations l10n, ThemeData theme) {
    // local mutable state for variant & qty
    ProductVariant? selected;
    int qty = 1;

    Color statusColor(StockStatus s) {
      switch (s) {
        case StockStatus.inStock:
          return Colors.green;
        case StockStatus.outOfStock:
          return Colors.red;
        case StockStatus.limitedStock:
          return Colors.orange;
      }
    }

    String statusText(StockStatus s) {
      switch (s) {
        case StockStatus.inStock:
          return 'In Stock';
        case StockStatus.outOfStock:
          return 'Out of Stock';
        case StockStatus.limitedStock:
          return 'Limited Stock';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name,
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text('Store Name',
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.w500)),
            const Spacer(),
            Icon(Icons.star, color: Colors.amber, size: 16.w),
            SizedBox(width: 4.w),
            Text(
              '${product.stats.rating.toStringAsFixed(1)} (${product.stats.reviewCount})',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Text(
              CurrencyFormatter.format(
                  product.pricing.salePrice ?? product.pricing.basePrice),
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: theme.primaryColor),
            ),
            if (product.pricing.salePrice != null) ...[
              SizedBox(width: 12.w),
              Text(
                CurrencyFormatter.formatLegacy(product.pricing.basePrice),
                style: theme.textTheme.bodyLarge
                    ?.copyWith(decoration: TextDecoration.lineThrough, color: theme.textTheme.bodySmall?.color),
              ),
            ],
          ],
        ),
        SizedBox(height: 24.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: statusColor(product.inventory.stockStatus).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            statusText(product.inventory.stockStatus),
            style: theme.textTheme.bodySmall
                ?.copyWith(color: statusColor(product.inventory.stockStatus), fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 24.h),
        if (product.variants.isNotEmpty) ...[
          Text('Options',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: product.variants.map((v) {
              final isSel = selected?.id == v.id;
              return GestureDetector(
                onTap: () => selected = v,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSel ? theme.primaryColor : Colors.transparent,
                    border: Border.all(color: isSel ? theme.primaryColor : theme.dividerColor),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    v.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isSel ? Colors.white : theme.textTheme.bodyMedium?.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 24.h),
        ],
        Text('Quantity',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: 12.h),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.dividerColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => qty = qty > 1 ? qty - 1 : 1,
                    icon: const Icon(Icons.remove),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text('$qty',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  IconButton(
                    onPressed: () => qty = qty + 1,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Text('Description',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: 8.h),
        Text(product.description, style: theme.textTheme.bodyLarge),
        SizedBox(height: 120.h),
      ],
    );
  }

  Widget _buildProductDetailBottomSheet(BuildContext context, WidgetRef ref,
      ProductModel product, AppLocalizations l10n, ThemeData theme) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: l10n.addToCart,
                onPressed: () {
                  // Track add to cart behavior
                  final behaviorTracker = ref.read(userBehaviorTrackerProvider);
                  behaviorTracker.trackAddToCart(
                    product.id,
                    metadata: {
                      'source': 'product_detail',
                      'price': product.price,
                      'category': product.categoryId,
                      'timestamp': DateTime.now().toIso8601String(),
                    },
                  );

                  ref.read(cartProvider.notifier).addItem(product.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart')),
                  );
                },
              ),
            ),
            SizedBox(width: 12.w),
            CustomButton(
              text: l10n.buyNow,
              onPressed: () {
                ref.read(cartProvider.notifier).addItem(product.id);
                context.push('/checkout');
              },
              backgroundColor: theme.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
