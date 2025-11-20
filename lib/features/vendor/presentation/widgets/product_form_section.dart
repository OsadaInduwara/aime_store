// lib/features/vendor/presentation/widgets/product_form_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/models/category_model.dart';
import '../../../../core/presentation/providers/categories_provider.dart';
import '../providers/product_listing_provider.dart';

class ProductFormSection extends ConsumerStatefulWidget {
  final ProductListingController controller;

  const ProductFormSection({
    super.key,
    required this.controller,
  });

  @override
  ConsumerState<ProductFormSection> createState() => _ProductFormSectionState();
}

class _ProductFormSectionState extends ConsumerState<ProductFormSection> {
  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Name
        TextFormField(
          controller: widget.controller.nameController,
          decoration: const InputDecoration(
            labelText: 'Product Name *',
            hintText: 'Enter product name',
            prefixIcon: Icon(Icons.inventory_2_outlined),
          ),
          textCapitalization: TextCapitalization.words,
          maxLength: 100,
          validator: (value) {
            if (value?.trim().isEmpty == true) {
              return 'Product name is required';
            }
            if (value!.trim().length < 3) {
              return 'Product name must be at least 3 characters';
            }
            return null;
          },
        ),

        const SizedBox(height: 16),

        // Category Selection
        categoriesAsync.when(
          data: (categories) => _buildCategoryDropdown(categories),
          loading: () => const LinearProgressIndicator(),
          error: (error, stackTrace) => Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Failed to load categories',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => ref.refresh(categoriesProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Product Description
        TextFormField(
          controller: widget.controller.descriptionController,
          decoration: const InputDecoration(
            labelText: 'Product Description *',
            hintText: 'Describe your product in detail',
            prefixIcon: Icon(Icons.description_outlined),
            alignLabelWithHint: true,
          ),
          maxLines: 4,
          maxLength: 1000,
          textCapitalization: TextCapitalization.sentences,
          validator: (value) {
            if (value?.trim().isEmpty == true) {
              return 'Product description is required';
            }
            if (value!.trim().length < 10) {
              return 'Description must be at least 10 characters';
            }
            return null;
          },
        ),

        const SizedBox(height: 16),

        // Short Description (Optional)
        TextFormField(
          controller: widget.controller.shortDescriptionController,
          decoration: const InputDecoration(
            labelText: 'Short Description (Optional)',
            hintText: 'Brief summary for search results',
            prefixIcon: Icon(Icons.short_text_outlined),
          ),
          maxLines: 2,
          maxLength: 200,
          textCapitalization: TextCapitalization.sentences,
          validator: (value) {
            if (value?.trim().isNotEmpty == true && value!.trim().length < 5) {
              return 'Short description must be at least 5 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown(List<CategoryModel> categories) {
    return DropdownButtonFormField<String>(
      value: widget.controller.selectedCategoryId.isEmpty
          ? null
          : widget.controller.selectedCategoryId,
      decoration: const InputDecoration(
        labelText: 'Category *',
        hintText: 'Select product category',
        prefixIcon: Icon(Icons.category_outlined),
      ),
      items: categories.map((category) {
        return DropdownMenuItem<String>(
          value: category.id,
          child: Row(
            children: [
              // Category icon if available
              if (category.iconUrl?.isNotEmpty == true) ...[
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(category.iconUrl!),
                ),
                const SizedBox(width: 8),
              ] else ...[
                const Icon(Icons.folder_outlined, size: 20),
                const SizedBox(width: 8),
              ],
              Expanded(child: Text(category.name)),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          widget.controller.setCategory(value);
          setState(() {});
        }
      },
      validator: (value) {
        if (value?.isEmpty == true) {
          return 'Please select a category';
        }
        return null;
      },
      isExpanded: true,
      menuMaxHeight: 300,
    );
  }
}
