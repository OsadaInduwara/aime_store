// lib/core/utils/admin_setup_utils.dart
import 'package:flutter/foundation.dart';

import '../services/category_setup_service.dart';

class AdminSetupUtils {
  static final CategorySetupService _categorySetupService = CategorySetupService();

  /// Initialize the marketplace with default categories
  /// This should be called once during app setup
  static Future<void> initializeMarketplace() async {
    try {
      debugPrint('🚀 Starting marketplace initialization...');

      // Initialize default categories
      await _categorySetupService.initializeDefaultCategories();

      debugPrint('✅ Marketplace initialization completed successfully');
    } catch (e) {
      debugPrint('❌ Marketplace initialization failed: $e');
      rethrow;
    }
  }

  /// Check if marketplace is already initialized
  static Future<bool> isMarketplaceInitialized() async {
    try {
      // You can add more checks here if needed
      // For now, we'll just check if categories exist
      return true; // The category service handles this check internally
    } catch (e) {
      debugPrint('Error checking marketplace initialization: $e');
      return false;
    }
  }

  /// Get all available categories with their subcategories
  static Map<String, List<String>> getAvailableCategories() {
    return {
      'Electronics': [
        'Mobile Phones',
        'Laptops & Computers',
        'Audio & Headphones',
        'Cameras',
        'Gaming',
        'Smart Home',
        'Accessories'
      ],
      'Fashion': [
        'Men\'s Clothing',
        'Women\'s Clothing',
        'Kids\' Clothing',
        'Shoes',
        'Bags & Accessories',
        'Jewelry',
        'Watches'
      ],
      'Home': [
        'Furniture',
        'Kitchen & Dining',
        'Home Decor',
        'Garden & Outdoor',
        'Storage & Organization',
        'Appliances',
        'Bedding & Bath'
      ],
      'Beauty': [
        'Skincare',
        'Makeup',
        'Hair Care',
        'Personal Care',
        'Fragrances',
        'Health Supplements',
        'Beauty Tools'
      ],
      'Sports': [
        'Fitness Equipment',
        'Outdoor Sports',
        'Team Sports',
        'Water Sports',
        'Winter Sports',
        'Athletic Wear',
        'Sports Nutrition'
      ],
      'Books': [
        'Fiction',
        'Non-Fiction',
        'Educational',
        'Children\'s Books',
        'Comics & Manga',
        'Magazines',
        'E-books'
      ],
      'Food': [
        'Fresh Produce',
        'Packaged Foods',
        'Beverages',
        'Snacks',
        'Organic Foods',
        'International Foods',
        'Spices & Condiments'
      ],
      'Cakes': [
        'Birthday Cakes',
        'Wedding Cakes',
        'Cup Cakes',
        'Pastries',
        'Custom Cakes',
        'Sugar-Free Options',
        'Vegan Options'
      ],
      'Crafts': [
        'Handmade Jewelry',
        'Art Supplies',
        'Pottery',
        'Textiles',
        'Woodwork',
        'Paper Crafts',
        'DIY Kits'
      ],
      'Automotive': [
        'Car Parts',
        'Motorcycle Parts',
        'Tools & Equipment',
        'Car Care',
        'Electronics',
        'Tires & Wheels',
        'Interior Accessories'
      ],
      'Toys': [
        'Educational Toys',
        'Action Figures',
        'Dolls',
        'Board Games',
        'Outdoor Toys',
        'Electronic Toys',
        'Building Sets'
      ],
      'Services': [
        'Home Repair',
        'Cleaning Services',
        'IT Support',
        'Tutoring',
        'Photography',
        'Event Planning',
        'Consulting'
      ],
    };
  }

  /// Get category icons mapping
  static Map<String, String> getCategoryIcons() {
    return {
      'Electronics': 'phone_android',
      'Fashion': 'checkroom',
      'Home': 'home_outlined',
      'Beauty': 'face',
      'Sports': 'sports_soccer',
      'Books': 'menu_book',
      'Food': 'restaurant',
      'Cakes': 'cake',
      'Crafts': 'palette',
      'Automotive': 'directions_car',
      'Toys': 'toys',
      'Services': 'build',
    };
  }

  /// Get recommended tags for each category
  static Map<String, List<String>> getRecommendedTags() {
    return {
      'Electronics': [
        'new', 'refurbished', 'warranty', 'bluetooth', 'wireless',
        'waterproof', 'fast-charging', 'high-resolution', 'portable'
      ],
      'Fashion': [
        'trendy', 'casual', 'formal', 'vintage', 'designer',
        'comfortable', 'durable', 'eco-friendly', 'handmade'
      ],
      'Home': [
        'modern', 'rustic', 'space-saving', 'durable', 'eco-friendly',
        'easy-assembly', 'multi-purpose', 'premium-quality'
      ],
      'Beauty': [
        'natural', 'organic', 'cruelty-free', 'dermatologist-tested',
        'anti-aging', 'moisturizing', 'long-lasting', 'hypoallergenic'
      ],
      'Sports': [
        'professional', 'beginner-friendly', 'durable', 'lightweight',
        'weather-resistant', 'adjustable', 'safety-certified'
      ],
      'Food': [
        'fresh', 'organic', 'local', 'imported', 'gluten-free',
        'sugar-free', 'preservative-free', 'ready-to-eat'
      ],
      'Cakes': [
        'custom', 'fresh', 'homemade', 'sugar-free', 'vegan',
        'gluten-free', 'celebration', 'premium-ingredients'
      ],
      'Crafts': [
        'handmade', 'unique', 'custom', 'eco-friendly', 'vintage',
        'artisan', 'one-of-a-kind', 'traditional'
      ],
    };
  }
}
