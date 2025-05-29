import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';

import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/profile_image_picker.dart';
import '../../../core/widgets/loading_overlay.dart';

class StoreSetupScreen extends ConsumerStatefulWidget {
  const StoreSetupScreen({super.key});

  @override
  ConsumerState<StoreSetupScreen> createState() => _StoreSetupScreenState();
}

class _StoreSetupScreenState extends ConsumerState<StoreSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  File? _logoImage;
  File? _coverImage;
  String _selectedCategory = 'General';
  bool _isLoading = false;

  final List<String> _categories = [
    'General',
    'Electronics',
    'Fashion & Clothing',
    'Food & Beverages',
    'Home & Garden',
    'Health & Beauty',
    'Sports & Outdoors',
    'Books & Education',
    'Arts & Crafts',
    'Automotive',
    'Baby & Kids',
    'Pet Supplies',
  ];

  final List<String> _districts = [
    'Colombo', 'Gampaha', 'Kalutara', 'Kandy', 'Matale', 'Nuwara Eliya',
    'Galle', 'Matara', 'Hambantota', 'Jaffna', 'Kilinochchi', 'Mannar',
    'Vavuniya', 'Mullaitivu', 'Batticaloa', 'Ampara', 'Trincomalee',
    'Kurunegala', 'Puttalam', 'Anuradhapura', 'Polonnaruwa', 'Badulla',
    'Moneragala', 'Ratnapura', 'Kegalle',
  ];

  String _selectedDistrict = 'Colombo';

  @override
  void dispose() {
    _storeNameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _createStore() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Upload images, save Firestore document, update user role
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Store created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create store: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Your Store'),
        centerTitle: true,
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Indicator
                LinearProgressIndicator(
                  value: 1.0,
                  backgroundColor: theme.dividerColor,
                  valueColor: AlwaysStoppedAnimation(theme.primaryColor),
                ),

                SizedBox(height: 24.h),

                // Header
                Text(
                  'Create Your Store',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  'Set up your store to start selling on LocalMarket',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.textTheme.bodySmall?.color),
                ),

                SizedBox(height: 32.h),

                // Store Logo
                Text(
                  'Store Logo',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: ProfileImagePicker(
                    size: 100,
                    onImageSelected: (image) => setState(() => _logoImage = image),
                  ),
                ),

                SizedBox(height: 24.h),

                // Store Name
                CustomTextField(
                  controller: _storeNameController,
                  label: 'Store Name',
                  hint: 'Enter your store name',
                  prefixIcon: Icons.store,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Store name is required';
                    }
                    if (value.trim().length < 3) {
                      return 'Store name must be at least 3 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                // Category
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.category),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      items: _categories
                          .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) setState(() => _selectedCategory = value);
                      },
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Description
                CustomTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Describe your store and what you sell',
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Description is required';
                    }
                    if (value.trim().length < 20) {
                      return 'Description must be at least 20 characters';
                    }
                    return null;
                  },
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

                // Phone Number
                CustomTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  hint: 'Business contact number',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                // Email (Optional)
                CustomTextField(
                  controller: _emailController,
                  label: 'Email (Optional)',
                  hint: 'Business email address',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      final emailRegex = RegExp(
                        r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}\$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                // Store Location
                Text(
                  'Store Location',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 16.h),

                CustomTextField(
                  controller: _addressController,
                  label: 'Address',
                  hint: 'Store address',
                  prefixIcon: Icons.location_on,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                CustomTextField(
                  controller: _cityController,
                  label: 'City',
                  hint: 'City name',
                  prefixIcon: Icons.location_city,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'City is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'District',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    DropdownButtonFormField<String>(
                      value: _selectedDistrict,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.map),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      items: _districts
                          .map((district) => DropdownMenuItem(
                        value: district,
                        child: Text(district),
                      ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) setState(() => _selectedDistrict = value);
                      },
                    ),
                  ],
                ),

                SizedBox(height: 32.h),

                // Terms and Conditions
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue, size: 20.w),
                          SizedBox(width: 8.w),
                          Text(
                            'Before you continue',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'By creating a store, you agree to our seller terms and conditions. Your store will be reviewed before going live.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                CustomButton(
                  text: 'Create Store',
                  onPressed: _createStore,
                  isLoading: _isLoading,
                ),

                SizedBox(height: 16.h),

                Center(
                  child: TextButton(
                    onPressed: () => context.go('/home'),
                    child: Text(
                      'Skip for now',
                      style: TextStyle(color: theme.textTheme.bodySmall?.color),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
