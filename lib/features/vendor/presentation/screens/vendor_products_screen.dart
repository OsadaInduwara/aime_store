// lib/features/vendor/presentation/screens/vendor_products_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/services/product_service.dart';
import '../providers/vendor_products_provider.dart';
import '../widgets/product_management_card.dart';

class VendorProductsScreen extends ConsumerStatefulWidget {
  const VendorProductsScreen({super.key});

  @override
  ConsumerState<VendorProductsScreen> createState() => _VendorProductsScreenState();
}

class _VendorProductsScreenState extends ConsumerState<VendorProductsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _showFilterOptions(context),
            icon: const Icon(Icons.filter_list),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All', icon: Icon(Icons.inventory_2_outlined)),
            Tab(text: 'Active', icon: Icon(Icons.visibility_outlined)),
            Tab(text: 'Inactive', icon: Icon(Icons.visibility_off_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProductList(null), // All products
          _buildProductList(true), // Active products only
          _buildProductList(false), // Inactive products only
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/vendor/product-listing'),
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),
    );
  }

  Widget _buildProductList(bool? isActive) {
    final productsAsync = ref.watch(vendorProductsProvider(isActive));

    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return _buildEmptyState(isActive);
        }
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(vendorProductsProvider(isActive));
          },
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductManagementCard(
                product: product,
                onEdit: () => _editProduct(product),
                onToggleStatus: () => _toggleProductStatus(product),
                onDelete: () => _deleteProduct(product),
                onViewDetails: () => _viewProductDetails(product),
              );
            },
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => _buildErrorState(error, isActive),
    );
  }

  Widget _buildEmptyState(bool? isActive) {
    String title;
    String subtitle;
    IconData icon;

    switch (isActive) {
      case null:
        title = 'No Products Yet';
        subtitle = 'Start by adding your first product to showcase to customers';
        icon = Icons.inventory_2_outlined;
        break;
      case true:
        title = 'No Active Products';
        subtitle = 'You don\'t have any active products. Activate existing products or add new ones';
        icon = Icons.visibility_outlined;
        break;
      case false:
        title = 'No Inactive Products';
        subtitle = 'All your products are currently active and visible to customers';
        icon = Icons.visibility_off_outlined;
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (isActive != false) // Don't show add button on inactive tab
              FilledButton.icon(
                onPressed: () => context.push('/vendor/product-listing'),
                icon: const Icon(Icons.add),
                label: const Text('Add Your First Product'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(Object error, bool? isActive) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 24),
            Text(
              'Failed to Load Products',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.invalidate(vendorProductsProvider(isActive)),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _editProduct(ProductModel product) {
    context.push('/vendor/product-listing/${product.id}');
  }

  Future<void> _toggleProductStatus(ProductModel product) async {
    try {
      final productService = ref.read(productServiceProvider);
      await productService.toggleProductStatus(
        product.id,
        !product.settings.isActive,
      );

      // Refresh all product lists
      ref.invalidate(vendorProductsProvider(null));
      ref.invalidate(vendorProductsProvider(true));
      ref.invalidate(vendorProductsProvider(false));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              product.settings.isActive
                  ? '${product.name} is now inactive'
                  : '${product.name} is now active',
            ),
            backgroundColor: Colors.green,
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => _toggleProductStatus(product),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update product status: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteProduct(ProductModel product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Are you sure you want to delete "${product.name}"?'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_outlined,
                    color: Theme.of(context).colorScheme.error,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This action cannot be undone. All product data and media will be permanently removed.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final productService = ref.read(productServiceProvider);
        await productService.deleteProduct(product.id);

        // Refresh all product lists
        ref.invalidate(vendorProductsProvider(null));
        ref.invalidate(vendorProductsProvider(true));
        ref.invalidate(vendorProductsProvider(false));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${product.name} has been deleted'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete product: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void _viewProductDetails(ProductModel product) {
    context.push('/product/${product.id}');
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter Options',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.sort_by_alpha),
              title: const Text('Sort by Name'),
              onTap: () {
                Navigator.pop(context);
                // Implement sorting
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Sort by Date'),
              onTap: () {
                Navigator.pop(context);
                // Implement sorting
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_outline),
              title: const Text('Sort by Rating'),
              onTap: () {
                Navigator.pop(context);
                // Implement sorting
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Sort by Views'),
              onTap: () {
                Navigator.pop(context);
                // Implement sorting
              },
            ),
          ],
        ),
      ),
    );
  }
}
