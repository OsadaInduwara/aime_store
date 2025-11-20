// lib/features/vendor/presentation/widgets/image_upload_section.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/product_listing_provider.dart';

class ImageUploadSection extends StatefulWidget {
  final ProductListingController controller;

  const ImageUploadSection({
    super.key,
    required this.controller,
  });

  @override
  State<ImageUploadSection> createState() => _ImageUploadSectionState();
}

class _ImageUploadSectionState extends State<ImageUploadSection> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Add up to 10 high-quality images of your product',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
            Text(
              '${widget.controller.selectedImages.length}/10',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: widget.controller.selectedImages.length >= 10
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Image grid
        if (widget.controller.selectedImages.isNotEmpty) ...[
          _buildImageGrid(),
          const SizedBox(height: 16),
        ],

        // Add image buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: widget.controller.selectedImages.length >= 10
                    ? null
                    : () => _pickImages(ImageSource.gallery),
                icon: const Icon(Icons.photo_library_outlined),
                label: const Text('Gallery'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: widget.controller.selectedImages.length >= 10
                    ? null
                    : () => _pickImages(ImageSource.camera),
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Camera'),
              ),
            ),
          ],
        ),

        // Requirements info
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Image Requirements',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '• At least 1 image required (up to 10 maximum)\n'
                '• High resolution images (minimum 800x800px)\n'
                '• Supported formats: JPG, PNG\n'
                '• First image will be used as thumbnail',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: widget.controller.selectedImages.length,
      itemBuilder: (context, index) => _buildImageTile(index),
    );
  }

  Widget _buildImageTile(int index) {
    final image = widget.controller.selectedImages[index];
    final isFirst = index == 0;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isFirst
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline.withOpacity(0.3),
              width: isFirst ? 2 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Thumbnail badge
        if (isFirst)
          Positioned(
            top: 4,
            left: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Thumbnail',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 10,
                    ),
              ),
            ),
          ),

        // Remove button
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => _removeImage(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: 16,
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
          ),
        ),

        // Reorder handle
        if (widget.controller.selectedImages.length > 1)
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.drag_handle,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _pickImages(ImageSource source) async {
    try {
      if (source == ImageSource.gallery) {
        // Multiple image selection from gallery
        final List<XFile> images = await _picker.pickMultipleImages(
          maxWidth: 1920,
          maxHeight: 1920,
          imageQuality: 85,
        );

        if (images.isNotEmpty) {
          final remainingSlots = 10 - widget.controller.selectedImages.length;
          final imagesToAdd = images.take(remainingSlots).toList();

          for (final image in imagesToAdd) {
            final file = File(image.path);
            if (await _isValidImageFile(file)) {
              widget.controller.addImage(file);
            }
          }

          setState(() {});

          if (images.length > remainingSlots) {
            _showMessage(
              'Only ${remainingSlots} images were added due to the 10 image limit',
              isError: false,
            );
          }
        }
      } else {
        // Single image from camera
        final XFile? image = await _picker.pickImage(
          source: source,
          maxWidth: 1920,
          maxHeight: 1920,
          imageQuality: 85,
        );

        if (image != null) {
          final file = File(image.path);
          if (await _isValidImageFile(file)) {
            widget.controller.addImage(file);
            setState(() {});
          }
        }
      }
    } catch (e) {
      _showMessage('Failed to pick images: ${e.toString()}', isError: true);
    }
  }

  Future<bool> _isValidImageFile(File file) async {
    try {
      // Check file size (max 10MB per image)
      final fileSize = await file.length();
      const maxSize = 10 * 1024 * 1024; // 10MB in bytes

      if (fileSize > maxSize) {
        _showMessage(
          'Image is too large. Maximum size is 10MB',
          isError: true,
        );
        return false;
      }

      // Check file extension
      final extension = file.path.toLowerCase().split('.').last;
      if (!['jpg', 'jpeg', 'png'].contains(extension)) {
        _showMessage(
          'Invalid image format. Only JPG and PNG are supported',
          isError: true,
        );
        return false;
      }

      return true;
    } catch (e) {
      _showMessage('Error validating image: ${e.toString()}', isError: true);
      return false;
    }
  }

  void _removeImage(int index) {
    setState(() {
      widget.controller.removeImage(index);
    });
  }

  void _showMessage(String message, {required bool isError}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: isError ? Colors.red : Colors.blue,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
