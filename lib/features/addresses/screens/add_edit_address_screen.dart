// lib/features/addresses/screens/add_edit_address_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/models/user_model.dart';
import '../../../core/providers/address_provider.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/loading_overlay.dart';

class AddEditAddressScreen extends ConsumerStatefulWidget {
  final String? addressId;

  const AddEditAddressScreen({
    super.key,
    this.addressId,
  });

  @override
  ConsumerState<AddEditAddressScreen> createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends ConsumerState<AddEditAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _postalCodeController = TextEditingController();

  bool _isDefault = false;
  bool _isLoading = false;
  Address? _existingAddress;

  final List<String> _districts = [
    'Colombo', 'Gampaha', 'Kalutara', 'Kandy', 'Matale', 'Nuwara Eliya',
    'Galle', 'Matara', 'Hambantota', 'Jaffna', 'Kilinochchi', 'Mannar',
    'Vavuniya', 'Mullaitivu', 'Batticaloa', 'Ampara', 'Trincomalee',
    'Kurunegala', 'Puttalam', 'Anuradhapura', 'Polonnaruwa', 'Badulla',
    'Moneragala', 'Ratnapura', 'Kegalle'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.addressId != null) {
      _loadExistingAddress();
    }
  }

  @override
  void dispose() {
    _labelController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  void _loadExistingAddress() {
    final addresses = ref.read(addressesProvider).value ?? [];
    _existingAddress = addresses.firstWhere(
          (addr) => addr.id == widget.addressId,
      orElse: () => throw Exception('Address not found'),
    );

    if (_existingAddress != null) {
      _labelController.text = _existingAddress!.label;
      _fullNameController.text = _existingAddress!.fullName;
      _phoneController.text = _existingAddress!.phoneNumber;
      _addressLine1Controller.text = _existingAddress!.addressLine1;
      _addressLine2Controller.text = _existingAddress!.addressLine2 ?? '';
      _cityController.text = _existingAddress!.city;
      _districtController.text = _existingAddress!.district;
      _postalCodeController.text = _existingAddress!.postalCode;
      _isDefault = _existingAddress!.isDefault;
    }
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      const uuid = Uuid();
      final address = Address(
        id: widget.addressId ?? uuid.v4(),
        label: _labelController.text.trim(),
        fullName: _fullNameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        addressLine1: _addressLine1Controller.text.trim(),
        addressLine2: _addressLine2Controller.text.trim().isEmpty
            ? null
            : _addressLine2Controller.text.trim(),
        city: _cityController.text.trim(),
        district: _districtController.text.trim(),
        postalCode: _postalCodeController.text.trim(),
        isDefault: _isDefault,
      );

      if (widget.addressId != null) {
        await ref.read(addressesProvider.notifier).updateAddress(address);
      } else {
        await ref.read(addressesProvider.notifier).addAddress(address);
      }

      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.addressId != null
                ? 'Address updated successfully'
                : 'Address added successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save address: $e'),
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
    final isEditing = widget.addressId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Address' : 'Add Address'),
        centerTitle: true,
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Address Label
                CustomTextField(
                  controller: _labelController,
                  label: 'Address Label',
                  hint: 'e.g., Home, Office, etc.',
                  prefixIcon: Icons.label,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Address label is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                // Full Name
                CustomTextField(
                  controller: _fullNameController,
                  label: 'Full Name',
                  hint: 'Recipient\'s full name',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Full name is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                // Phone Number
                CustomTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  hint: 'Contact number',
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

                // Address Line 1
                CustomTextField(
                  controller: _addressLine1Controller,
                  label: 'Address Line 1',
                  hint: 'Street address, house number',
                  prefixIcon: Icons.home,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Address line 1 is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                // Address Line 2
                CustomTextField(
                  controller: _addressLine2Controller,
                  label: 'Address Line 2 (Optional)',
                  hint: 'Apartment, building, floor',
                  prefixIcon: Icons.business,
                ),

                SizedBox(height: 16.h),

                // City
                CustomTextField(
                  controller: _cityController,
                  label: 'City',
                  hint: 'Enter city',
                  prefixIcon: Icons.location_city,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'City is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.h),

                // District Dropdown
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
                      value: _districtController.text.isEmpty ? null : _districtController.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.map),
                        hintText: 'Select district',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      items: _districts.map((district) {
                        return DropdownMenuItem(
                          value: district,
                          child: Text(district),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _districtController.text = value;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'District is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Postal Code
                CustomTextField(
                  controller: _postalCodeController,
                  label: 'Postal Code',
                  hint: 'Enter postal code',
                  prefixIcon: Icons.markunread_mailbox,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Postal code is required';
                    }
                    if (value.trim().length != 5) {
                      return 'Postal code must be 5 digits';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                // Set as Default
                CheckboxListTile(
                  title: const Text('Set as default address'),
                  subtitle: const Text('Use this address for future orders'),
                  value: _isDefault,
                  onChanged: (value) {
                    setState(() => _isDefault = value ?? false);
                  },
                  contentPadding: EdgeInsets.zero,
                ),

                SizedBox(height: 32.h),

                // Save Button
                CustomButton(
                  text: isEditing ? 'Update Address' : 'Save Address',
                  onPressed: _saveAddress,
                  isLoading: _isLoading,
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
