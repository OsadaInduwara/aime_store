// lib/features/vendor/presentation/widgets/product_management_card.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/utils/currency_formatter.dart';

class ProductManagementCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onEdit;
  final VoidCallback onToggleStatus;
  final VoidCallback onDelete;
  final VoidCallback onViewDetails;

  const ProductManagementCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onToggleStatus,
    required this.onDelete,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActive = product.settings.isActive;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onViewDetails,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with status and actions
              Row(
                children: [
                  // Status indicator
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.green.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isActive ? Colors.green : Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isActive ? Icons.visibility : Icons.visibility_off,
                          size: 14,
                          color: isActive ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isActive ? 'Active' : 'Inactive',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: isActive ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Actions menu
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'edit':
                          onEdit();
                          break;
                        case 'toggle':
                          onToggleStatus();
                          break;
                        case 'delete':
                          onDelete();
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined, size: 20),
                            SizedBox(width: 12),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'toggle',
                        child: Row(
                          children: [
                            Icon(
                              isActive ? Icons.visibility_off : Icons.visibility,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(isActive ? 'Deactivate' : 'Activate'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete_outline, size: 20, color: Colors.red),
                            SizedBox(width: 12),
                            Text('Delete', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                    child: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Product info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: product.thumbnailImage.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: product.thumbnailImage,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: theme.colorScheme.surfaceVariant,
                                child: const Icon(Icons.image_outlined),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: theme.colorScheme.surfaceVariant,
                                child: const Icon(Icons.broken_image_outlined),
                              ),
                            )
                          : Container(
                              color: theme.colorScheme.surfaceVariant,
                              child: const Icon(Icons.image_outlined),
                            ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name
                        Text(
                          product.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Price
                        Row(
                          children: [
                            if (product.pricing.salePrice != null) ...[
                              Text(
                                CurrencyFormatter.format(
                                  product.pricing.salePrice!,
                                  product.pricing.currency,
                                ),
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                CurrencyFormatter.format(
                                  product.pricing.basePrice,
                                  product.pricing.currency,
                                ),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ] else ...[
                              Text(
                                CurrencyFormatter.format(
                                  product.pricing.basePrice,
                                  product.pricing.currency,
                                ),
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Stock status
                        if (product.inventory.trackInventory) ...[
                          Row(
                            children: [
                              Icon(
                                _getStockIcon(product.inventory.stockStatus),
                                size: 16,
                                color: _getStockColor(product.inventory.stockStatus),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _getStockText(product.inventory),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: _getStockColor(product.inventory.stockStatus),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          Row(
                            children: [
                              Icon(
                                Icons.all_inclusive,
                                size: 16,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Unlimited Stock',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Stats row
              Row(
                children: [
                  _buildStatChip(
                    icon: Icons.visibility_outlined,
                    label: '${product.stats.viewCount} views',
                    theme: theme,
                  ),
                  const SizedBox(width: 12),
                  _buildStatChip(
                    icon: Icons.shopping_cart_outlined,
                    label: '${product.stats.orderCount} orders',
                    theme: theme,
                  ),
                  if (product.stats.reviewCount > 0) ...[
                    const SizedBox(width: 12),
                    _buildStatChip(
                      icon: Icons.star_outline,
                      label: '${product.stats.rating.toStringAsFixed(1)} (${product.stats.reviewCount})',
                      theme: theme,
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 16),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined, size: 18),
                      label: const Text('Edit'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onToggleStatus,
                      icon: Icon(
                        isActive ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                      ),
                      label: Text(isActive ? 'Deactivate' : 'Activate'),
                      style: FilledButton.styleFrom(
                        backgroundColor: isActive
                            ? theme.colorScheme.error
                            : theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getStockIcon(StockStatus status) {
    switch (status) {
      case StockStatus.inStock:
        return Icons.check_circle_outline;
      case StockStatus.limitedStock:
        return Icons.warning_outlined;
      case StockStatus.outOfStock:
        return Icons.cancel_outlined;
    }
  }

  Color _getStockColor(StockStatus status) {
    switch (status) {
      case StockStatus.inStock:
        return Colors.green;
      case StockStatus.limitedStock:
        return Colors.orange;
      case StockStatus.outOfStock:
        return Colors.red;
    }
  }

  String _getStockText(ProductInventory inventory) {
    switch (inventory.stockStatus) {
      case StockStatus.inStock:
        if (inventory.stockQuantity != null) {
          return '${inventory.stockQuantity} in stock';
        }
        return 'In Stock';
      case StockStatus.limitedStock:
        if (inventory.stockQuantity != null) {
          return 'Only ${inventory.stockQuantity} left';
        }
        return 'Limited Stock';
      case StockStatus.outOfStock:
        return 'Out of Stock';
    }
  }
}
