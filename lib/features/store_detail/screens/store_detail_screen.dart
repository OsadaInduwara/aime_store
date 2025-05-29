// lib/features/store_detail/screens/store_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/models/product_model.dart';
import '../../../core/models/store_model.dart';
import '../../../core/providers/store_detail_provider.dart';
import '../../../core/providers/store_products_provider.dart';
import '../../../core/providers/stores_provider.dart';
import '../../../core/providers/products_provider.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/product_card.dart';

class StoreDetailScreen extends ConsumerStatefulWidget {
  final String storeId;

  const StoreDetailScreen({
    super.key,
    required this.storeId,
  });

  @override
  ConsumerState<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends ConsumerState<StoreDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(storeProductsProvider(widget.storeId).notifier).loadProducts();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storeAsync = ref.watch(storeDetailProvider(widget.storeId));
    final productsAsync = ref.watch(storeProductsProvider(widget.storeId));
    final theme = Theme.of(context);

    return Scaffold(
      body: storeAsync.when(
        data: (store) => CustomScrollView(
          slivers: [
            // Store Header
            SliverAppBar(
              expandedHeight: 200.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Cover Image
                    CachedNetworkImage(
                      imageUrl: store.coverImage ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: theme.primaryColor.withOpacity(0.1),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: theme.primaryColor.withOpacity(0.1),
                      ),
                    ),
                    // Gradient Overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    // Store Info
                    Positioned(
                      bottom: 16.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        children: [
                          // Store Logo
                          Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: store.logo ?? '',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.store,
                                    color: theme.primaryColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.store,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.storeName,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 16.w),
                                    SizedBox(width: 4.w),
                                    Text(
                                      '${store.stats.rating.toStringAsFixed(1)} (${store.stats.reviewCount})',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    if (store.stats.isVerified)
                                      Row(
                                        children: [
                                          Icon(Icons.verified, color: Colors.blue, size: 16.w),
                                          SizedBox(width: 4.w),
                                          Text(
                                            'Verified',
                                            style: theme.textTheme.bodySmall?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tab Bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Products'),
                    Tab(text: 'About'),
                  ],
                ),
              ),
            ),

            // Tab Content
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Products Tab
                  _buildProductsTab(productsAsync),
                  // About Tab
                  _buildAboutTab(store, theme),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Error loading store'),
              ElevatedButton(
                onPressed: () => ref.refresh(storeDetailProvider(widget.storeId)),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsTab(AsyncValue<List<ProductModel>> productsAsync) {
    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return const Center(
            child: Text('No products available'),
          );
        }

        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppConstants.productsGridCrossAxisCount,
            ),
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text('Error loading products'),
      ),
    );
  }

  Widget _buildAboutTab(StoreModel store, ThemeData theme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          Text(
            'About',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            store.description,
            style: theme.textTheme.bodyLarge,
          ),

          SizedBox(height: 24.h),

          // Contact Information
          Text(
            'Contact Information',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),

          _buildContactItem(
            Icons.phone,
            'Phone',
            store.contactInfo.phoneNumber,
            theme,
          ),
          if (store.contactInfo.email != null)
            _buildContactItem(
              Icons.email,
              'Email',
              store.contactInfo.email!,
              theme,
            ),
          if (store.contactInfo.whatsapp != null)
            _buildContactItem(
              Icons.chat,
              'WhatsApp',
              store.contactInfo.whatsapp!,
              theme,
            ),

          SizedBox(height: 24.h),

          // Location
          Text(
            'Location',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),

          _buildContactItem(
            Icons.location_on,
            'Address',
            '${store.location.address}, ${store.location.city}, ${store.location.district}',
            theme,
          ),

          SizedBox(height: 24.h),

          // Business Hours
          Text(
            'Business Hours',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),

          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
            ),
            child: Column(
              children: store.settings.businessHours.entries.map((entry) {
                final day = entry.key;
                final hours = entry.value;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        day.substring(0, 1).toUpperCase() + day.substring(1),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        hours.isClosed ? 'Closed' : '${hours.open} - ${hours.close}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: hours.isClosed ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 20.w, color: theme.primaryColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}