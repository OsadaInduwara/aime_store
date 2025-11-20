// lib/features/vendor/presentation/providers/product_listing_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/services/product_service.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../auth/presentation/providers/auth_error_handler.dart';
import '../../domain/models/product_listing_form_state.dart';

part 'product_listing_provider.freezed.dart';

// Provider for product listing controller
final productListingProvider = StateNotifierProvider<ProductListingController, ProductListingState>((ref) {
  return ProductListingController(
    ref.read(productServiceProvider),
    ref.read(authErrorHandlerProvider),
  );
});

// Product listing state
@freezed
class ProductListingState with _$ProductListingState {
  const factory ProductListingState.initial() = Initial;
  const factory ProductListingState.loading(String message) = Loading;
  const factory ProductListingState.success(String message) = Success;
  const factory ProductListingState.error(String message) = Error;
  const factory ProductListingState.validating() = Validating;
}

// Product listing controller
class ProductListingController extends StateNotifier<ProductListingState> {
  final ProductService _productService;
  final AuthErrorHandler _errorHandler;

  // Form controllers
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final shortDescriptionController = TextEditingController();
  final basePriceController = TextEditingController();
  final salePriceController = TextEditingController();
  final stockQuantityController = TextEditingController();
  final processingTimeController = TextEditingController();

  // Form data
  String selectedCategoryId = '';
  List<File> selectedImages = [];
  File? selectedVideo;
  List<String> tags = [];
  Map<String, dynamic> customAttributes = {};
  bool trackInventory = true;
  bool allowBackorder = false;
  bool isActive = true;
  bool isFeatured = false;
  bool allowReviews = true;
  PriceType priceType = PriceType.fixed;
  String currency = 'LKR';

  ProductListingController(this._productService, this._errorHandler) : super(const ProductListingState.initial());

  // Validate form data
  bool validateForm() {
    if (nameController.text.trim().isEmpty) {
      state = const ProductListingState.error('Product name is required');
      return false;
    }

    if (nameController.text.trim().length < 3) {
      state = const ProductListingState.error('Product name must be at least 3 characters');
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      state = const ProductListingState.error('Product description is required');
      return false;
    }

    if (descriptionController.text.trim().length < 10) {
      state = const ProductListingState.error('Product description must be at least 10 characters');
      return false;
    }

    if (selectedCategoryId.isEmpty) {
      state = const ProductListingState.error('Please select a category');
      return false;
    }

    if (basePriceController.text.trim().isEmpty) {
      state = const ProductListingState.error('Base price is required');
      return false;
    }

    final basePrice = double.tryParse(basePriceController.text.trim());
    if (basePrice == null || basePrice <= 0) {
      state = const ProductListingState.error('Please enter a valid base price');
      return false;
    }

    if (salePriceController.text.trim().isNotEmpty) {
      final salePrice = double.tryParse(salePriceController.text.trim());
      if (salePrice == null || salePrice <= 0) {
        state = const ProductListingState.error('Please enter a valid sale price');
        return false;
      }
      if (salePrice >= basePrice) {
        state = const ProductListingState.error('Sale price must be less than base price');
        return false;
      }
    }

    if (selectedImages.isEmpty) {
      state = const ProductListingState.error('At least one product image is required');
      return false;
    }

    if (selectedImages.length > 10) {
      state = const ProductListingState.error('Maximum 10 images allowed');
      return false;
    }

    // Validate video if selected
    if (selectedVideo != null) {
      if (!_isValidVideoFile(selectedVideo!)) {
        state = const ProductListingState.error('Invalid video format. Only MP4 files are allowed');
        return false;
      }
    }

    if (trackInventory && stockQuantityController.text.trim().isNotEmpty) {
      final stock = int.tryParse(stockQuantityController.text.trim());
      if (stock == null || stock < 0) {
        state = const ProductListingState.error('Please enter a valid stock quantity');
        return false;
      }
    }

    return true;
  }

  // Validate video file
  bool _isValidVideoFile(File videoFile) {
    final extension = videoFile.path.toLowerCase().split('.').last;
    return ['mp4', 'mov', 'avi'].contains(extension);
  }

  // Add image
  void addImage(File image) {
    if (selectedImages.length >= 10) {
      state = const ProductListingState.error('Maximum 10 images allowed');
      return;
    }
    selectedImages.add(image);
    state = const ProductListingState.initial();
  }

  // Remove image
  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
      state = const ProductListingState.initial();
    }
  }

  // Set video
  void setVideo(File? video) {
    selectedVideo = video;
    state = const ProductListingState.initial();
  }

  // Add tag
  void addTag(String tag) {
    if (tag.trim().isNotEmpty && !tags.contains(tag.trim())) {
      tags.add(tag.trim());
      state = const ProductListingState.initial();
    }
  }

  // Remove tag
  void removeTag(String tag) {
    tags.remove(tag);
    state = const ProductListingState.initial();
  }

  // Set category
  void setCategory(String categoryId) {
    selectedCategoryId = categoryId;
    state = const ProductListingState.initial();
  }

  // Submit product listing
  Future<void> submitProduct() async {
    if (!validateForm()) return;

    try {
      state = const ProductListingState.loading('Creating product listing...');

      // Upload images first
      state = const ProductListingState.loading('Uploading images...');
      List<String> imageUrls = [];
      for (int i = 0; i < selectedImages.length; i++) {
        final imageUrl = await _productService.uploadProductImage(selectedImages[i]);
        imageUrls.add(imageUrl);
        state = ProductListingState.loading('Uploading images... (${i + 1}/${selectedImages.length})');
      }

      // Upload video if selected
      List<String> videoUrls = [];
      if (selectedVideo != null) {
        state = const ProductListingState.loading('Uploading video...');
        final videoUrl = await _productService.uploadProductVideo(selectedVideo!);
        videoUrls.add(videoUrl);
      }

      // Create product model
      state = const ProductListingState.loading('Saving product details...');

      final basePrice = double.parse(basePriceController.text.trim());
      final salePrice = salePriceController.text.trim().isNotEmpty
          ? double.parse(salePriceController.text.trim())
          : null;
      final stockQty = trackInventory && stockQuantityController.text.trim().isNotEmpty
          ? int.parse(stockQuantityController.text.trim())
          : null;

      final product = ProductModel(
        id: '', // Will be generated by Firebase
        storeId: '', // Will be set from user's store
        categoryId: selectedCategoryId,
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        shortDescription: shortDescriptionController.text.trim().isNotEmpty
            ? shortDescriptionController.text.trim()
            : null,
        images: imageUrls,
        videos: videoUrls,
        thumbnailImage: imageUrls.isNotEmpty ? imageUrls.first : '',
        pricing: ProductPricing(
          basePrice: basePrice,
          salePrice: salePrice,
          currency: currency,
          priceType: priceType,
        ),
        inventory: ProductInventory(
          trackInventory: trackInventory,
          stockQuantity: stockQty,
          allowBackorder: allowBackorder,
          stockStatus: _getStockStatus(stockQty),
        ),
        variants: [], // Will be handled separately
        customAttributes: customAttributes,
        tags: tags,
        searchKeywords: _generateSearchKeywords(),
        settings: ProductSettings(
          isActive: isActive,
          isFeatured: isFeatured,
          allowReviews: allowReviews,
          processingTime: processingTimeController.text.trim().isNotEmpty
              ? processingTimeController.text.trim()
              : null,
        ),
        stats: const ProductStats(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save product
      await _productService.createProduct(product);

      state = const ProductListingState.success('Product listed successfully!');

      // Clear form
      clearForm();

    } catch (error) {
      await _errorHandler.handleAuthError(
        error,
        errorType: AuthErrorType.profileSetup, // Reusing for product listing
      );

      if (error is NetworkException) {
        state = const ProductListingState.error('Network error. Please check your connection and try again');
      } else if (error is DataException) {
        state = const ProductListingState.error('Failed to save product. Please try again');
      } else {
        state = ProductListingState.error('Failed to create product: ${error.toString()}');
      }
    }
  }

  // Generate search keywords from product data
  List<String> _generateSearchKeywords() {
    final keywords = <String>[];

    // Add product name words
    keywords.addAll(nameController.text.trim().toLowerCase().split(' '));

    // Add description words
    keywords.addAll(descriptionController.text.trim().toLowerCase().split(' ')
        .where((word) => word.length > 2));

    // Add tags
    keywords.addAll(tags.map((tag) => tag.toLowerCase()));

    // Remove duplicates and empty strings
    return keywords.where((keyword) => keyword.trim().isNotEmpty).toSet().toList();
  }

  // Get stock status based on quantity
  StockStatus _getStockStatus(int? quantity) {
    if (!trackInventory) return StockStatus.inStock;
    if (quantity == null || quantity <= 0) return StockStatus.outOfStock;
    if (quantity <= 5) return StockStatus.limitedStock;
    return StockStatus.inStock;
  }

  // Clear form
  void clearForm() {
    nameController.clear();
    descriptionController.clear();
    shortDescriptionController.clear();
    basePriceController.clear();
    salePriceController.clear();
    stockQuantityController.clear();
    processingTimeController.clear();

    selectedCategoryId = '';
    selectedImages.clear();
    selectedVideo = null;
    tags.clear();
    customAttributes.clear();
    trackInventory = true;
    allowBackorder = false;
    isActive = true;
    isFeatured = false;
    allowReviews = true;
    priceType = PriceType.fixed;
    currency = 'LKR';

    state = const ProductListingState.initial();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    shortDescriptionController.dispose();
    basePriceController.dispose();
    salePriceController.dispose();
    stockQuantityController.dispose();
    processingTimeController.dispose();
    super.dispose();
  }
}
