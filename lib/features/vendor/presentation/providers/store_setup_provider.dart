// lib/features/vendor/presentation/providers/store_setup_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/data/models/store_model.dart';
import '../../../../core/services/store_service.dart';
import '../../../../core/exceptions/app_exceptions.dart';

part 'store_setup_provider.freezed.dart';

// Provider for store setup controller
final storeSetupProvider = StateNotifierProvider<StoreSetupController, StoreSetupState>((ref) {
  return StoreSetupController(
    ref.read(storeServiceProvider),
  );
});

// Store setup state
@freezed
class StoreSetupState with _$StoreSetupState {
  const factory StoreSetupState.initial() = Initial;
  const factory StoreSetupState.loading(String message) = Loading;
  const factory StoreSetupState.success(String message, String storeId) = Success;
  const factory StoreSetupState.error(String message) = Error;
}

// Store setup controller
class StoreSetupController extends StateNotifier<StoreSetupState> {
  final StoreService _storeService;

  // Form controllers
  final storeNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final whatsappController = TextEditingController();
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();

  // Form data
  String selectedBusinessType = '';
  String selectedCategory = '';
  List<String> selectedSubCategories = [];
  File? logoFile;
  File? coverImageFile;
  String? logoUrl;
  String? coverImageUrl;

  // Business hours
  Map<String, BusinessHours> businessHours = {
    'monday': const BusinessHours(open: '09:00', close: '18:00'),
    'tuesday': const BusinessHours(open: '09:00', close: '18:00'),
    'wednesday': const BusinessHours(open: '09:00', close: '18:00'),
    'thursday': const BusinessHours(open: '09:00', close: '18:00'),
    'friday': const BusinessHours(open: '09:00', close: '18:00'),
    'saturday': const BusinessHours(open: '09:00', close: '18:00'),
    'sunday': const BusinessHours(open: '09:00', close: '18:00', isClosed: true),
  };

  // Delivery options
  bool selfPickup = true;
  bool homeDelivery = true;
  bool islandWideDelivery = false;
  double deliveryFee = 0.0;
  double? freeDeliveryThreshold;

  // Payment methods
  bool cashOnDelivery = true;
  bool bankTransfer = false;
  bool cardPayment = false;
  bool digitalWallet = false;

  // Store customization
  String themeColor = '#2E7D32';

  StoreSetupController(this._storeService) : super(const StoreSetupState.initial());

  // Business types list
  List<String> get businessTypes => [
    'Retail',
    'Food & Beverage',
    'Services',
    'Electronics',
    'Fashion',
    'Health & Beauty',
    'Sports & Outdoors',
    'Books & Media',
    'Art & Crafts',
    'Other',
  ];

  // Categories list (should match your category collection)
  List<String> get categories => [
    'Electronics',
    'Fashion',
    'Food & Beverages',
    'Health & Beauty',
    'Home & Garden',
    'Sports & Outdoors',
    'Books & Media',
    'Art & Crafts',
    'Automotive',
    'Services',
  ];

  // Validate form data
  bool validateForm() {
    if (storeNameController.text.trim().isEmpty) {
      state = const StoreSetupState.error('Store name is required');
      return false;
    }

    if (storeNameController.text.trim().length < 3) {
      state = const StoreSetupState.error('Store name must be at least 3 characters');
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      state = const StoreSetupState.error('Store description is required');
      return false;
    }

    if (descriptionController.text.trim().length < 10) {
      state = const StoreSetupState.error('Store description must be at least 10 characters');
      return false;
    }

    if (selectedBusinessType.isEmpty) {
      state = const StoreSetupState.error('Please select a business type');
      return false;
    }

    if (selectedCategory.isEmpty) {
      state = const StoreSetupState.error('Please select a category');
      return false;
    }

    if (phoneController.text.trim().isEmpty) {
      state = const StoreSetupState.error('Phone number is required');
      return false;
    }

    if (addressController.text.trim().isEmpty) {
      state = const StoreSetupState.error('Address is required');
      return false;
    }

    if (cityController.text.trim().isEmpty) {
      state = const StoreSetupState.error('City is required');
      return false;
    }

    if (districtController.text.trim().isEmpty) {
      state = const StoreSetupState.error('District is required');
      return false;
    }

    // Validate email format if provided
    if (emailController.text.trim().isNotEmpty) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(emailController.text.trim())) {
        state = const StoreSetupState.error('Please enter a valid email address');
        return false;
      }
    }

    return true;
  }

  // Set business type
  void setBusinessType(String businessType) {
    selectedBusinessType = businessType;
    state = const StoreSetupState.initial();
  }

  // Set category
  void setCategory(String category) {
    selectedCategory = category;
    state = const StoreSetupState.initial();
  }

  // Add sub-category
  void addSubCategory(String subCategory) {
    if (!selectedSubCategories.contains(subCategory)) {
      selectedSubCategories.add(subCategory);
      state = const StoreSetupState.initial();
    }
  }

  // Remove sub-category
  void removeSubCategory(String subCategory) {
    selectedSubCategories.remove(subCategory);
    state = const StoreSetupState.initial();
  }

  // Set logo
  void setLogo(File? logo) {
    logoFile = logo;
    state = const StoreSetupState.initial();
  }

  // Set cover image
  void setCoverImage(File? cover) {
    coverImageFile = cover;
    state = const StoreSetupState.initial();
  }

  // Update business hours
  void updateBusinessHours(String day, BusinessHours hours) {
    businessHours[day] = hours;
    state = const StoreSetupState.initial();
  }

  // Update delivery options
  void updateDeliveryOptions({
    bool? selfPickupEnabled,
    bool? homeDeliveryEnabled,
    bool? islandWideEnabled,
    double? fee,
    double? freeThreshold,
  }) {
    if (selfPickupEnabled != null) selfPickup = selfPickupEnabled;
    if (homeDeliveryEnabled != null) homeDelivery = homeDeliveryEnabled;
    if (islandWideEnabled != null) islandWideDelivery = islandWideEnabled;
    if (fee != null) deliveryFee = fee;
    if (freeThreshold != null) freeDeliveryThreshold = freeThreshold;
    state = const StoreSetupState.initial();
  }

  // Update payment methods
  void updatePaymentMethods({
    bool? cod,
    bool? bank,
    bool? card,
    bool? wallet,
  }) {
    if (cod != null) cashOnDelivery = cod;
    if (bank != null) bankTransfer = bank;
    if (card != null) cardPayment = card;
    if (wallet != null) digitalWallet = wallet;
    state = const StoreSetupState.initial();
  }

  // Set theme color
  void setThemeColor(String color) {
    themeColor = color;
    state = const StoreSetupState.initial();
  }

  // Submit store setup
  Future<void> submitStore() async {
    if (!validateForm()) return;

    try {
      state = const StoreSetupState.loading('Creating your store...');

      // Upload logo if selected
      if (logoFile != null) {
        state = const StoreSetupState.loading('Uploading logo...');
        logoUrl = await _storeService.uploadStoreLogo(logoFile!);
      }

      // Upload cover image if selected
      if (coverImageFile != null) {
        state = const StoreSetupState.loading('Uploading cover image...');
        coverImageUrl = await _storeService.uploadStoreCoverImage(coverImageFile!);
      }

      // Create store model
      state = const StoreSetupState.loading('Setting up your store...');

      final store = StoreModel(
        id: '', // Will be generated by service
        ownerId: '', // Will be set by service
        storeName: storeNameController.text.trim(),
        description: descriptionController.text.trim(),
        logo: logoUrl,
        coverImage: coverImageUrl,
        businessType: selectedBusinessType,
        category: selectedCategory,
        subCategories: selectedSubCategories,
        contactInfo: ContactInfo(
          phoneNumber: phoneController.text.trim(),
          email: emailController.text.trim().isNotEmpty ? emailController.text.trim() : null,
          whatsapp: whatsappController.text.trim().isNotEmpty ? whatsappController.text.trim() : null,
          facebook: facebookController.text.trim().isNotEmpty ? facebookController.text.trim() : null,
          instagram: instagramController.text.trim().isNotEmpty ? instagramController.text.trim() : null,
        ),
        location: StoreLocation(
          address: addressController.text.trim(),
          city: cityController.text.trim(),
          district: districtController.text.trim(),
        ),
        settings: StoreSettings(
          businessHours: businessHours,
          deliveryOptions: DeliveryOptions(
            selfPickup: selfPickup,
            homeDelivery: homeDelivery,
            islandWideDelivery: islandWideDelivery,
            deliveryFee: deliveryFee,
            freeDeliveryThreshold: freeDeliveryThreshold,
          ),
          paymentMethods: PaymentMethods(
            cashOnDelivery: cashOnDelivery,
            bankTransfer: bankTransfer,
            cardPayment: cardPayment,
            digitalWallet: digitalWallet,
          ),
        ),
        customization: StoreCustomization(
          themeColor: themeColor,
        ),
        stats: const StoreStats(),
        createdAt: DateTime.now(), // Will be overridden by service
        updatedAt: DateTime.now(), // Will be overridden by service
      );

      // Create store
      final storeId = await _storeService.createStore(store);

      state = StoreSetupState.success('Store created successfully!', storeId);

      // Clear form
      clearForm();

    } catch (e) {
      if (e is ValidationException) {
        state = StoreSetupState.error(e.message);
      } else if (e is NetworkException) {
        state = const StoreSetupState.error('Network error. Please check your connection and try again');
      } else if (e is DataException) {
        state = StoreSetupState.error('Failed to create store: ${e.message}');
      } else {
        state = StoreSetupState.error('Failed to create store: ${e.toString()}');
      }
    }
  }

  // Clear form
  void clearForm() {
    storeNameController.clear();
    descriptionController.clear();
    phoneController.clear();
    emailController.clear();
    whatsappController.clear();
    facebookController.clear();
    instagramController.clear();
    addressController.clear();
    cityController.clear();
    districtController.clear();

    selectedBusinessType = '';
    selectedCategory = '';
    selectedSubCategories.clear();
    logoFile = null;
    coverImageFile = null;
    logoUrl = null;
    coverImageUrl = null;

    // Reset to defaults
    businessHours = {
      'monday': const BusinessHours(open: '09:00', close: '18:00'),
      'tuesday': const BusinessHours(open: '09:00', close: '18:00'),
      'wednesday': const BusinessHours(open: '09:00', close: '18:00'),
      'thursday': const BusinessHours(open: '09:00', close: '18:00'),
      'friday': const BusinessHours(open: '09:00', close: '18:00'),
      'saturday': const BusinessHours(open: '09:00', close: '18:00'),
      'sunday': const BusinessHours(open: '09:00', close: '18:00', isClosed: true),
    };

    selfPickup = true;
    homeDelivery = true;
    islandWideDelivery = false;
    deliveryFee = 0.0;
    freeDeliveryThreshold = null;

    cashOnDelivery = true;
    bankTransfer = false;
    cardPayment = false;
    digitalWallet = false;

    themeColor = '#2E7D32';

    state = const StoreSetupState.initial();
  }

  @override
  void dispose() {
    storeNameController.dispose();
    descriptionController.dispose();
    phoneController.dispose();
    emailController.dispose();
    whatsappController.dispose();
    facebookController.dispose();
    instagramController.dispose();
    addressController.dispose();
    cityController.dispose();
    districtController.dispose();
    super.dispose();
  }
}
