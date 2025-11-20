// lib/features/vendor/presentation/screens/product_listing_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/presentation/providers/categories_provider.dart';
import '../../../../core/presentation/widgets/smooth_loading_overlay.dart';
import '../providers/product_listing_provider.dart';
import '../widgets/image_upload_section.dart';
import '../widgets/video_upload_section.dart';
import '../widgets/product_form_section.dart';
import '../widgets/tag_input_section.dart';

class ProductListingScreen extends ConsumerStatefulWidget {
  final String? productId; // For editing existing products

  const ProductListingScreen({super.key, this.productId});

  @override
  ConsumerState<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends ConsumerState<ProductListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to product listing state changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listen<ProductListingState>(productListingProvider, (previous, next) {
        if (!mounted) return;

        next.when(
          initial: () {},
          loading: (message) {},
          success: (message) {
            _showSuccessSnackbar(message);
            // Navigate back or to product management screen
            Navigator.of(context).pop();
          },
          error: (message) {
            _showErrorSnackbar(message);
          },
          validating: () {},
        );
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productListingProvider);
    final controller = ref.read(productListingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List New Product'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => _showDiscardDialog(context),
            child: const Text('Clear'),
          ),
        ],
      ),
      body: state.when(
        initial: () => _buildForm(controller),
        loading: (message) => _buildForm(controller).withSmoothLoading(
          isLoading: true,
          message: message,
        ),
        success: (message) => _buildForm(controller),
        error: (message) => _buildForm(controller),
        validating: () => _buildForm(controller).withSmoothLoading(
          isLoading: true,
          message: 'Validating...',
        ),
      ),
      bottomNavigationBar: _buildBottomBar(controller, state),
    );
  }

  Widget _buildForm(ProductListingController controller) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            _buildProgressIndicator(),
            const SizedBox(height: 24),

            // Basic Information Section
            _buildSectionCard(
              title: 'Basic Information',
              icon: Icons.info_outline,
              child: ProductFormSection(controller: controller),
            ),

            const SizedBox(height: 16),

            // Images Section
            _buildSectionCard(
              title: 'Product Images',
              icon: Icons.photo_library_outlined,
              child: ImageUploadSection(controller: controller),
            ),

            const SizedBox(height: 16),

            // Video Section
            _buildSectionCard(
              title: 'Product Video (Optional)',
              icon: Icons.videocam_outlined,
              child: VideoUploadSection(controller: controller),
            ),

            const SizedBox(height: 16),

            // Pricing Section
            _buildSectionCard(
              title: 'Pricing & Inventory',
              icon: Icons.attach_money_outlined,
              child: _buildPricingSection(controller),
            ),

            const SizedBox(height: 16),

            // Tags Section
            _buildSectionCard(
              title: 'Tags & Keywords',
              icon: Icons.tag_outlined,
              child: TagInputSection(controller: controller),
            ),

            const SizedBox(height: 16),

            // Settings Section
            _buildSectionCard(
              title: 'Product Settings',
              icon: Icons.settings_outlined,
              child: _buildSettingsSection(controller),
            ),

            const SizedBox(height: 100), // Space for bottom bar
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.list_alt, size: 20),
          SizedBox(width: 8),
          Text(
            'Fill in the product details below',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildPricingSection(ProductListingController controller) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.basePriceController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Base Price *',
                  prefixText: 'LKR ',
                  hintText: '0.00',
                ),
                validator: (value) {
                  if (value?.trim().isEmpty == true) {
                    return 'Base price is required';
                  }
                  final price = double.tryParse(value!.trim());
                  if (price == null || price <= 0) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: controller.salePriceController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Sale Price',
                  prefixText: 'LKR ',
                  hintText: '0.00',
                ),
                validator: (value) {
                  if (value?.trim().isNotEmpty == true) {
                    final salePrice = double.tryParse(value!.trim());
                    final basePrice = double.tryParse(controller.basePriceController.text.trim());

                    if (salePrice == null || salePrice <= 0) {
                      return 'Enter a valid sale price';
                    }
                    if (basePrice != null && salePrice >= basePrice) {
                      return 'Sale price must be less than base price';
                    }
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Track Inventory'),
          subtitle: const Text('Monitor stock levels for this product'),
          value: controller.trackInventory,
          onChanged: (value) {
            setState(() {
              controller.trackInventory = value;
            });
          },
        ),
        if (controller.trackInventory) ...[
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.stockQuantityController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Stock Quantity',
                    hintText: '0',
                  ),
                  validator: (value) {
                    if (controller.trackInventory && value?.trim().isNotEmpty == true) {
                      final stock = int.tryParse(value!.trim());
                      if (stock == null || stock < 0) {
                        return 'Enter a valid quantity';
                      }
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SwitchListTile(
                  title: const Text('Allow Backorder'),
                  subtitle: const Text('Accept orders when out of stock'),
                  value: controller.allowBackorder,
                  onChanged: (value) {
                    setState(() {
                      controller.allowBackorder = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildSettingsSection(ProductListingController controller) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Active'),
          subtitle: const Text('Product is visible to customers'),
          value: controller.isActive,
          onChanged: (value) {
            setState(() {
              controller.isActive = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Featured'),
          subtitle: const Text('Show in featured products section'),
          value: controller.isFeatured,
          onChanged: (value) {
            setState(() {
              controller.isFeatured = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Allow Reviews'),
          subtitle: const Text('Customers can write reviews'),
          value: controller.allowReviews,
          onChanged: (value) {
            setState(() {
              controller.allowReviews = value;
            });
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: controller.processingTimeController,
          decoration: const InputDecoration(
            labelText: 'Processing Time',
            hintText: 'e.g., 2-3 business days',
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(ProductListingController controller, ProductListingState state) {
    final isLoading = state.maybeWhen(
      loading: (_) => true,
      orElse: () => false,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: isLoading ? null : () => _showDiscardDialog(context),
                child: const Text('Discard'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: FilledButton(
                onPressed: isLoading ? null : () => _submitProduct(controller),
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('List Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitProduct(ProductListingController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      await controller.submitProduct();
    } else {
      // Scroll to the first error
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard Changes?'),
        content: const Text(
          'All your changes will be lost. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(productListingProvider.notifier).clearForm();
            },
            child: const Text('Discard'),
          ),
        ],
      ),
    );
  }
}
