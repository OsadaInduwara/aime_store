// lib/features/vendor/presentation/widgets/tag_input_section.dart
import 'package:flutter/material.dart';
import '../providers/product_listing_provider.dart';

class TagInputSection extends StatefulWidget {
  final ProductListingController controller;

  const TagInputSection({
    super.key,
    required this.controller,
  });

  @override
  State<TagInputSection> createState() => _TagInputSectionState();
}

class _TagInputSectionState extends State<TagInputSection> {
  final TextEditingController _tagController = TextEditingController();
  final FocusNode _tagFocusNode = FocusNode();

  @override
  void dispose() {
    _tagController.dispose();
    _tagFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add tags to help customers find your product',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),

        // Tag input field
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _tagController,
                focusNode: _tagFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Add Tag',
                  hintText: 'e.g., organic, handmade, premium',
                  prefixIcon: Icon(Icons.tag_outlined),
                ),
                textCapitalization: TextCapitalization.words,
                maxLength: 50,
                onFieldSubmitted: _addTag,
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: () => _addTag(_tagController.text),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add'),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Current tags
        if (widget.controller.tags.isNotEmpty) ...[
          Text(
            'Current Tags (${widget.controller.tags.length})',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 8),
          _buildTagChips(),
          const SizedBox(height: 16),
        ],

        // Suggested tags
        _buildSuggestedTags(),

        // Tags info
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
                    Icons.lightbulb_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Tag Tips',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '• Use relevant keywords customers might search for\n'
                '• Include material, style, brand, or special features\n'
                '• Keep tags short and descriptive\n'
                '• Maximum 20 tags per product',
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

  Widget _buildTagChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.controller.tags.map((tag) {
        return Chip(
          label: Text(tag),
          deleteIcon: const Icon(Icons.close, size: 18),
          onDeleted: () => _removeTag(tag),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          deleteIconColor: Theme.of(context).colorScheme.onPrimaryContainer,
        );
      }).toList(),
    );
  }

  Widget _buildSuggestedTags() {
    final suggestedTags = _getSuggestedTags();
    if (suggestedTags.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested Tags',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: suggestedTags.map((tag) {
            return ActionChip(
              label: Text(tag),
              onPressed: () => _addTag(tag),
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              side: BorderSide.none,
            );
          }).toList(),
        ),
      ],
    );
  }

  List<String> _getSuggestedTags() {
    final allSuggested = [
      'handmade',
      'organic',
      'premium',
      'eco-friendly',
      'natural',
      'vintage',
      'modern',
      'luxury',
      'durable',
      'lightweight',
      'waterproof',
      'portable',
      'gift',
      'bestseller',
      'trending',
      'new arrival',
      'limited edition',
      'exclusive',
      'imported',
      'local',
    ];

    // Filter out tags that are already added
    return allSuggested
        .where((tag) => !widget.controller.tags.contains(tag))
        .take(8)
        .toList();
  }

  void _addTag(String tagText) {
    final tag = tagText.trim().toLowerCase();

    if (tag.isEmpty) {
      _showMessage('Tag cannot be empty', isError: true);
      return;
    }

    if (tag.length < 2) {
      _showMessage('Tag must be at least 2 characters', isError: true);
      return;
    }

    if (widget.controller.tags.length >= 20) {
      _showMessage('Maximum 20 tags allowed', isError: true);
      return;
    }

    if (widget.controller.tags.contains(tag)) {
      _showMessage('Tag already exists', isError: true);
      return;
    }

    // Add tag
    widget.controller.addTag(tag);
    _tagController.clear();

    // Refocus for easy adding of multiple tags
    _tagFocusNode.requestFocus();

    setState(() {});
  }

  void _removeTag(String tag) {
    widget.controller.removeTag(tag);
    setState(() {});
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
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
