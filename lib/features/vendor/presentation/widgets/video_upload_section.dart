// lib/features/vendor/presentation/widgets/video_upload_section.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';
import '../providers/product_listing_provider.dart';
import '../../domain/models/product_listing_form_state.dart';

class VideoUploadSection extends StatefulWidget {
  final ProductListingController controller;

  const VideoUploadSection({
    super.key,
    required this.controller,
  });

  @override
  State<VideoUploadSection> createState() => _VideoUploadSectionState();
}

class _VideoUploadSectionState extends State<VideoUploadSection> {
  VideoPlayerController? _videoController;
  bool _isValidating = false;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add a product video to showcase your item (optional)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),

        // Video preview or upload button
        if (widget.controller.selectedVideo != null) ...[
          _buildVideoPreview(),
          const SizedBox(height: 16),
        ],

        // Upload button
        if (widget.controller.selectedVideo == null)
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _isValidating ? null : _pickVideo,
              icon: _isValidating
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.video_call_outlined),
              label: Text(_isValidating ? 'Validating Video...' : 'Choose Video'),
            ),
          )
        else
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isValidating ? null : _pickVideo,
                  icon: const Icon(Icons.video_call_outlined),
                  label: const Text('Change Video'),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: _removeVideo,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Remove'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
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
                    'Video Requirements',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '• Maximum 1 video per product\n'
                '• File size limit: 10MB\n'
                '• Duration limit: 30 seconds\n'
                '• Supported formats: MP4, MOV, AVI\n'
                '• Recommended resolution: 720p or higher',
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

  Widget _buildVideoPreview() {
    if (_videoController == null || !_videoController!.value.isInitialized) {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController!.value.size.width,
                  height: _videoController!.value.size.height,
                  child: VideoPlayer(_videoController!),
                ),
              ),
            ),

            // Play/Pause overlay
            Positioned.fill(
              child: GestureDetector(
                onTap: _togglePlayPause,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: _videoController!.value.isPlaying ? 0.0 : 0.8,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _videoController!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Video info overlay
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(_videoController!.value.duration),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      _getVideoFileSize(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickVideo() async {
    try {
      setState(() => _isValidating = true);

      final result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = File(result.files.first.path!);
        final validation = await _validateVideoFile(file);

        if (validation.isValid) {
          await _setVideo(file);
        } else {
          _showMessage(validation.error!, isError: true);
        }
      }
    } catch (e) {
      _showMessage('Failed to pick video: ${e.toString()}', isError: true);
    } finally {
      setState(() => _isValidating = false);
    }
  }

  Future<VideoValidationResult> _validateVideoFile(File file) async {
    try {
      // Check file size (10MB limit)
      final fileSize = await file.length();
      const maxSizeInBytes = 10 * 1024 * 1024; // 10MB

      if (fileSize > maxSizeInBytes) {
        return VideoValidationResult.invalid(
          'Video file is too large. Maximum size is 10MB. Current size: ${(fileSize / (1024 * 1024)).toStringAsFixed(1)}MB',
        );
      }

      // Check file extension
      final extension = file.path.toLowerCase().split('.').last;
      if (!['mp4', 'mov', 'avi'].contains(extension)) {
        return VideoValidationResult.invalid(
          'Invalid video format. Only MP4, MOV, and AVI files are supported',
        );
      }

      // Initialize video controller to check duration
      final controller = VideoPlayerController.file(file);
      await controller.initialize();

      final duration = controller.value.duration;
      await controller.dispose();

      // Check duration (30 seconds limit)
      if (duration.inSeconds > 30) {
        return VideoValidationResult.invalid(
          'Video is too long. Maximum duration is 30 seconds. Current duration: ${duration.inSeconds} seconds',
        );
      }

      return VideoValidationResult.valid(
        sizeInMB: fileSize / (1024 * 1024),
        durationInSeconds: duration.inSeconds,
      );
    } catch (e) {
      return VideoValidationResult.invalid(
        'Failed to validate video file: ${e.toString()}',
      );
    }
  }

  Future<void> _setVideo(File video) async {
    // Dispose previous controller
    await _videoController?.dispose();

    // Set new video
    widget.controller.setVideo(video);

    // Initialize new controller
    _videoController = VideoPlayerController.file(video);
    await _videoController!.initialize();

    setState(() {});
  }

  void _removeVideo() async {
    await _videoController?.dispose();
    _videoController = null;
    widget.controller.setVideo(null);
    setState(() {});
  }

  void _togglePlayPause() {
    if (_videoController == null) return;

    setState(() {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
      } else {
        _videoController!.play();
      }
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _getVideoFileSize() {
    // For now, return a placeholder since we can't use FutureBuilder to return String
    // This would need to be refactored to use state management for the actual file size
    if (widget.controller.selectedVideo == null) return '';
    return 'Loading...';
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
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
