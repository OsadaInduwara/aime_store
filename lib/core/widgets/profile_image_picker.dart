// lib/core/widgets/profile_image_picker.dart - COMPLETE VERSION
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';

class ProfileImagePicker extends StatefulWidget {
  final void Function(File?) onImageSelected;
  final String? initialImageUrl;
  final double size;

  const ProfileImagePicker({
    super.key,
    required this.onImageSelected,
    this.initialImageUrl,
    this.size = 100,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final result = await showModalBottomSheet<ImageSource?>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            if (_selectedImage != null || widget.initialImageUrl != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Remove Photo', style: TextStyle(color: Colors.red)),
                onTap: () => Navigator.pop(context, 'remove'),
              ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );

    if (result != null) {
      if (result == 'remove') {
        setState(() => _selectedImage = null);
        widget.onImageSelected(null);
      } else {
        await _getImage(result);
      }
    }
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      setState(() => _isLoading = true);

      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 400,
        maxHeight: 400,
      );

      if (image != null) {
        setState(() => _selectedImage = File(image.path));
        widget.onImageSelected(_selectedImage);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: $e')),
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

    return GestureDetector(
      onTap: _isLoading ? null : _pickImage,
      child: Container(
        width: widget.size.w,
        height: widget.size.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: theme.dividerColor, width: 2),
          color: theme.cardColor,
        ),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _selectedImage != null
            ? ClipOval(
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.cover,
          ),
        )
            : widget.initialImageUrl != null
            ? ClipOval(
          child: CachedNetworkImage(
            imageUrl: widget.initialImageUrl!,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.add_a_photo,
              size: (widget.size * 0.4).w,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
        )
            : Icon(
          Icons.add_a_photo,
          size: (widget.size * 0.4).w,
          color: theme.textTheme.bodySmall?.color,
        ),
      ),
    );
  }
}