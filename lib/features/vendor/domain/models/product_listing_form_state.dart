// lib/features/vendor/domain/models/product_listing_form_state.dart
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_listing_form_state.freezed.dart';

@freezed
class ProductListingFormState with _$ProductListingFormState {
  const factory ProductListingFormState({
    @Default('') String name,
    @Default('') String description,
    @Default('') String shortDescription,
    @Default('') String categoryId,
    @Default('') String basePrice,
    @Default('') String salePrice,
    @Default('') String stockQuantity,
    @Default('') String processingTime,
    @Default([]) List<File> images,
    File? video,
    @Default([]) List<String> tags,
    @Default({}) Map<String, dynamic> customAttributes,
    @Default(true) bool trackInventory,
    @Default(false) bool allowBackorder,
    @Default(true) bool isActive,
    @Default(false) bool isFeatured,
    @Default(true) bool allowReviews,
    @Default('LKR') String currency,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    String? successMessage,
  }) = _ProductListingFormState;
}

// Form validation state
@freezed
class FormValidationState with _$FormValidationState {
  const factory FormValidationState({
    @Default(false) bool isNameValid,
    @Default(false) bool isDescriptionValid,
    @Default(false) bool isCategorySelected,
    @Default(false) bool isBasePriceValid,
    @Default(true) bool isSalePriceValid,
    @Default(true) bool isStockQuantityValid,
    @Default(false) bool hasImages,
    @Default(true) bool isVideoValid,
    @Default(true) bool areTagsValid,
    String? nameError,
    String? descriptionError,
    String? categoryError,
    String? basePriceError,
    String? salePriceError,
    String? stockQuantityError,
    String? imageError,
    String? videoError,
    String? tagError,
  }) = _FormValidationState;

  const FormValidationState._();

  bool get isFormValid =>
      isNameValid &&
      isDescriptionValid &&
      isCategorySelected &&
      isBasePriceValid &&
      isSalePriceValid &&
      isStockQuantityValid &&
      hasImages &&
      isVideoValid &&
      areTagsValid;
}

// Image upload state
@freezed
class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState.idle() = ImageIdle;
  const factory ImageUploadState.picking() = ImagePicking;
  const factory ImageUploadState.uploading(int current, int total) = ImageUploading;
  const factory ImageUploadState.uploaded(List<String> urls) = ImageUploaded;
  const factory ImageUploadState.error(String message) = ImageError;
}

// Video upload state
@freezed
class VideoUploadState with _$VideoUploadState {
  const factory VideoUploadState.idle() = VideoIdle;
  const factory VideoUploadState.picking() = VideoPicking;
  const factory VideoUploadState.validating() = VideoValidating;
  const factory VideoUploadState.uploading(double progress) = VideoUploading;
  const factory VideoUploadState.uploaded(String url) = VideoUploaded;
  const factory VideoUploadState.error(String message) = VideoError;
}

// Video validation result
class VideoValidationResult {
  final bool isValid;
  final String? error;
  final double? sizeInMB;
  final int? durationInSeconds;

  const VideoValidationResult({
    required this.isValid,
    this.error,
    this.sizeInMB,
    this.durationInSeconds,
  });

  factory VideoValidationResult.valid({
    double? sizeInMB,
    int? durationInSeconds,
  }) =>
      VideoValidationResult(
        isValid: true,
        sizeInMB: sizeInMB,
        durationInSeconds: durationInSeconds,
      );

  factory VideoValidationResult.invalid(String error) =>
      VideoValidationResult(
        isValid: false,
        error: error,
      );
}

// Product listing progress state
@freezed
class ProductListingProgress with _$ProductListingProgress {
  const factory ProductListingProgress.idle() = ProgressIdle;
  const factory ProductListingProgress.validating() = ProgressValidating;
  const factory ProductListingProgress.uploadingImages({
    required int current,
    required int total,
  }) = ProgressUploadingImages;
  const factory ProductListingProgress.uploadingVideo({
    required double progress,
  }) = ProgressUploadingVideo;
  const factory ProductListingProgress.savingProduct() = ProgressSavingProduct;
  const factory ProductListingProgress.completed(String productId) = ProgressCompleted;
  const factory ProductListingProgress.failed(String error) = ProgressFailed;
}
