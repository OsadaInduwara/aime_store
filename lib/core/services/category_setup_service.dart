// lib/core/services/category_setup_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../data/models/category_model.dart';

class CategorySetupService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Initialize default categories for the marketplace
  /// This should be called once during app setup or admin initialization
  Future<void> initializeDefaultCategories() async {
    try {
      // Check if categories already exist
      final existingCategories = await _firestore
          .collection('categories')
          .limit(1)
          .get();

      if (existingCategories.docs.isNotEmpty) {
        debugPrint('Categories already exist, skipping initialization');
        return;
      }

      debugPrint('Initializing default categories...');

      final batch = _firestore.batch();
      final categories = _getDefaultCategories();

      for (final category in categories) {
        final categoryRef = _firestore.collection('categories').doc();
        batch.set(categoryRef, category.copyWith(id: categoryRef.id).toJson());
      }

      await batch.commit();
      debugPrint('Successfully initialized ${categories.length} default categories');
    } catch (e) {
      debugPrint('Error initializing categories: $e');
      rethrow;
    }
  }

  /// Create a new category
  Future<String> createCategory(CategoryModel category) async {
    try {
      final categoryRef = _firestore.collection('categories').doc();
      final categoryWithId = category.copyWith(
        id: categoryRef.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await categoryRef.set(categoryWithId.toJson());
      return categoryRef.id;
    } catch (e) {
      throw Exception('Failed to create category: $e');
    }
  }

  /// Update existing category
  Future<void> updateCategory(CategoryModel category) async {
    try {
      await _firestore.collection('categories').doc(category.id).update(
        category.copyWith(updatedAt: DateTime.now()).toJson(),
      );
    } catch (e) {
      throw Exception('Failed to update category: $e');
    }
  }

  /// Delete category (soft delete by setting isActive to false)
  Future<void> deleteCategory(String categoryId) async {
    try {
      await _firestore.collection('categories').doc(categoryId).update({
        'settings.isActive': false,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete category: $e');
    }
  }

  /// Get default categories for a local marketplace
  List<CategoryModel> _getDefaultCategories() {
    final now = DateTime.now();

    return [
      // 1. Electronics & Technology
      CategoryModel(
        id: '', // Will be set when creating
        name: 'Electronics',
        description: 'Mobile phones, laptops, gadgets, and electronic accessories',
        icon: 'phone_android',
        productTemplate: _getElectronicsTemplate(),
        settings: _getDefaultCategorySettings(1),
        createdAt: now,
        updatedAt: now,
      ),

      // 2. Fashion & Apparel
      CategoryModel(
        id: '',
        name: 'Fashion',
        description: 'Clothing, shoes, accessories, and fashion items for all ages',
        icon: 'checkroom',
        productTemplate: _getFashionTemplate(),
        settings: _getDefaultCategorySettings(2),
        createdAt: now,
        updatedAt: now,
      ),

      // 3. Home & Living
      CategoryModel(
        id: '',
        name: 'Home',
        description: 'Furniture, home decor, appliances, and household items',
        icon: 'home_outlined',
        productTemplate: _getHomeTemplate(),
        settings: _getDefaultCategorySettings(3),
        createdAt: now,
        updatedAt: now,
      ),

      // 4. Health & Beauty
      CategoryModel(
        id: '',
        name: 'Beauty',
        description: 'Cosmetics, skincare, health products, and personal care items',
        icon: 'face',
        productTemplate: _getBeautyTemplate(),
        settings: _getDefaultCategorySettings(4),
        createdAt: now,
        updatedAt: now,
      ),

      // 5. Sports & Fitness
      CategoryModel(
        id: '',
        name: 'Sports',
        description: 'Sports equipment, fitness gear, and outdoor activities',
        icon: 'sports_soccer',
        productTemplate: _getSportsTemplate(),
        settings: _getDefaultCategorySettings(5),
        createdAt: now,
        updatedAt: now,
      ),

      // 6. Books & Education
      CategoryModel(
        id: '',
        name: 'Books',
        description: 'Books, educational materials, stationery, and learning resources',
        icon: 'menu_book',
        productTemplate: _getBooksTemplate(),
        settings: _getDefaultCategorySettings(6),
        createdAt: now,
        updatedAt: now,
      ),

      // 7. Food & Beverages
      CategoryModel(
        id: '',
        name: 'Food',
        description: 'Fresh food, packaged goods, beverages, and local delicacies',
        icon: 'restaurant',
        productTemplate: _getFoodTemplate(),
        settings: _getDefaultCategorySettings(7),
        createdAt: now,
        updatedAt: now,
      ),

      // 8. Cakes & Desserts
      CategoryModel(
        id: '',
        name: 'Cakes',
        description: 'Custom cakes, desserts, pastries, and sweet treats',
        icon: 'cake',
        productTemplate: _getCakesTemplate(),
        settings: _getDefaultCategorySettings(8),
        createdAt: now,
        updatedAt: now,
      ),

      // 9. Arts & Crafts
      CategoryModel(
        id: '',
        name: 'Crafts',
        description: 'Handmade items, art supplies, crafts, and creative materials',
        icon: 'palette',
        productTemplate: _getCraftsTemplate(),
        settings: _getDefaultCategorySettings(9),
        createdAt: now,
        updatedAt: now,
      ),

      // 10. Automotive
      CategoryModel(
        id: '',
        name: 'Automotive',
        description: 'Car parts, accessories, tools, and automotive services',
        icon: 'directions_car',
        productTemplate: _getAutomotiveTemplate(),
        settings: _getDefaultCategorySettings(10),
        createdAt: now,
        updatedAt: now,
      ),

      // 11. Toys & Games
      CategoryModel(
        id: '',
        name: 'Toys',
        description: 'Toys, games, educational toys, and entertainment for children',
        icon: 'toys',
        productTemplate: _getToysTemplate(),
        settings: _getDefaultCategorySettings(11),
        createdAt: now,
        updatedAt: now,
      ),

      // 12. Services
      CategoryModel(
        id: '',
        name: 'Services',
        description: 'Local services, repairs, consultations, and professional services',
        icon: 'build',
        productTemplate: _getServicesTemplate(),
        settings: _getDefaultCategorySettings(12),
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  CategorySettings _getDefaultCategorySettings(int displayOrder) {
    return CategorySettings(
      isActive: true,
      isPopular: displayOrder <= 6, // Mark first 6 as popular
      displayOrder: displayOrder,
      requiresApproval: false,
      allowsCustomFields: true,
      maxProductsPerStore: 1000,
    );
  }

  // Product Templates for different categories
  ProductTemplate _getElectronicsTemplate() {
    return ProductTemplate(
      id: 'electronics_template',
      name: 'Electronics Template',
      fields: [
        CustomField(
          id: 'brand',
          label: 'Brand',
          type: 'text',
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'model',
          label: 'Model',
          type: 'text',
          required: true,
          displayOrder: 2,
        ),
        CustomField(
          id: 'warranty',
          label: 'Warranty Period',
          type: 'select',
          options: ['1 month', '3 months', '6 months', '1 year', '2 years'],
          displayOrder: 3,
        ),
        CustomField(
          id: 'color',
          label: 'Color',
          type: 'text',
          displayOrder: 4,
        ),
      ],
    );
  }

  ProductTemplate _getFashionTemplate() {
    return ProductTemplate(
      id: 'fashion_template',
      name: 'Fashion Template',
      fields: [
        CustomField(
          id: 'size',
          label: 'Size',
          type: 'select',
          options: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'color',
          label: 'Color',
          type: 'text',
          required: true,
          displayOrder: 2,
        ),
        CustomField(
          id: 'material',
          label: 'Material',
          type: 'text',
          displayOrder: 3,
        ),
        CustomField(
          id: 'gender',
          label: 'Gender',
          type: 'select',
          options: ['Unisex', 'Men', 'Women', 'Kids'],
          displayOrder: 4,
        ),
      ],
    );
  }

  ProductTemplate _getHomeTemplate() {
    return ProductTemplate(
      id: 'home_template',
      name: 'Home & Living Template',
      fields: [
        CustomField(
          id: 'dimensions',
          label: 'Dimensions (L x W x H)',
          type: 'text',
          displayOrder: 1,
        ),
        CustomField(
          id: 'material',
          label: 'Material',
          type: 'text',
          displayOrder: 2,
        ),
        CustomField(
          id: 'room',
          label: 'Room Type',
          type: 'select',
          options: ['Living Room', 'Bedroom', 'Kitchen', 'Bathroom', 'Office'],
          displayOrder: 3,
        ),
      ],
    );
  }

  ProductTemplate _getBeautyTemplate() {
    return ProductTemplate(
      id: 'beauty_template',
      name: 'Beauty Template',
      fields: [
        CustomField(
          id: 'skin_type',
          label: 'Skin Type',
          type: 'select',
          options: ['All Skin Types', 'Oily', 'Dry', 'Combination', 'Sensitive'],
          displayOrder: 1,
        ),
        CustomField(
          id: 'ingredients',
          label: 'Key Ingredients',
          type: 'textarea',
          displayOrder: 2,
        ),
        CustomField(
          id: 'expiry',
          label: 'Expiry Date',
          type: 'date',
          displayOrder: 3,
        ),
      ],
    );
  }

  ProductTemplate _getSportsTemplate() {
    return ProductTemplate(
      id: 'sports_template',
      name: 'Sports Template',
      fields: [
        CustomField(
          id: 'sport',
          label: 'Sport',
          type: 'select',
          options: ['Football', 'Cricket', 'Basketball', 'Tennis', 'Swimming', 'Gym', 'Other'],
          displayOrder: 1,
        ),
        CustomField(
          id: 'size',
          label: 'Size',
          type: 'text',
          displayOrder: 2,
        ),
        CustomField(
          id: 'age_group',
          label: 'Age Group',
          type: 'select',
          options: ['Kids', 'Youth', 'Adult', 'All Ages'],
          displayOrder: 3,
        ),
      ],
    );
  }

  ProductTemplate _getBooksTemplate() {
    return ProductTemplate(
      id: 'books_template',
      name: 'Books Template',
      fields: [
        CustomField(
          id: 'author',
          label: 'Author',
          type: 'text',
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'isbn',
          label: 'ISBN',
          type: 'text',
          displayOrder: 2,
        ),
        CustomField(
          id: 'language',
          label: 'Language',
          type: 'select',
          options: ['English', 'Sinhala', 'Tamil'],
          displayOrder: 3,
        ),
        CustomField(
          id: 'condition',
          label: 'Condition',
          type: 'select',
          options: ['New', 'Like New', 'Good', 'Fair'],
          displayOrder: 4,
        ),
      ],
    );
  }

  ProductTemplate _getFoodTemplate() {
    return ProductTemplate(
      id: 'food_template',
      name: 'Food Template',
      fields: [
        CustomField(
          id: 'expiry',
          label: 'Expiry Date',
          type: 'date',
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'storage',
          label: 'Storage Instructions',
          type: 'textarea',
          displayOrder: 2,
        ),
        CustomField(
          id: 'ingredients',
          label: 'Ingredients',
          type: 'textarea',
          displayOrder: 3,
        ),
        CustomField(
          id: 'origin',
          label: 'Origin',
          type: 'text',
          displayOrder: 4,
        ),
      ],
    );
  }

  ProductTemplate _getCakesTemplate() {
    return ProductTemplate(
      id: 'cakes_template',
      name: 'Cakes Template',
      fields: [
        CustomField(
          id: 'flavor',
          label: 'Flavor',
          type: 'select',
          options: ['Chocolate', 'Vanilla', 'Strawberry', 'Red Velvet', 'Lemon', 'Custom'],
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'size',
          label: 'Size',
          type: 'select',
          options: ['1lb', '2lb', '3lb', '5lb', 'Custom'],
          required: true,
          displayOrder: 2,
        ),
        CustomField(
          id: 'advance_order',
          label: 'Advance Order Required (days)',
          type: 'number',
          displayOrder: 3,
        ),
        CustomField(
          id: 'customization',
          label: 'Customization Available',
          type: 'boolean',
          displayOrder: 4,
        ),
      ],
    );
  }

  ProductTemplate _getCraftsTemplate() {
    return ProductTemplate(
      id: 'crafts_template',
      name: 'Crafts Template',
      fields: [
        CustomField(
          id: 'material',
          label: 'Material',
          type: 'text',
          displayOrder: 1,
        ),
        CustomField(
          id: 'handmade',
          label: 'Handmade',
          type: 'boolean',
          displayOrder: 2,
        ),
        CustomField(
          id: 'customizable',
          label: 'Customizable',
          type: 'boolean',
          displayOrder: 3,
        ),
      ],
    );
  }

  ProductTemplate _getAutomotiveTemplate() {
    return ProductTemplate(
      id: 'automotive_template',
      name: 'Automotive Template',
      fields: [
        CustomField(
          id: 'vehicle_make',
          label: 'Vehicle Make',
          type: 'text',
          displayOrder: 1,
        ),
        CustomField(
          id: 'vehicle_model',
          label: 'Vehicle Model',
          type: 'text',
          displayOrder: 2,
        ),
        CustomField(
          id: 'year',
          label: 'Year',
          type: 'number',
          displayOrder: 3,
        ),
        CustomField(
          id: 'part_number',
          label: 'Part Number',
          type: 'text',
          displayOrder: 4,
        ),
      ],
    );
  }

  ProductTemplate _getToysTemplate() {
    return ProductTemplate(
      id: 'toys_template',
      name: 'Toys Template',
      fields: [
        CustomField(
          id: 'age_range',
          label: 'Age Range',
          type: 'select',
          options: ['0-2 years', '3-5 years', '6-8 years', '9-12 years', '13+ years'],
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'educational',
          label: 'Educational Toy',
          type: 'boolean',
          displayOrder: 2,
        ),
        CustomField(
          id: 'safety_certified',
          label: 'Safety Certified',
          type: 'boolean',
          displayOrder: 3,
        ),
      ],
    );
  }

  ProductTemplate _getServicesTemplate() {
    return ProductTemplate(
      id: 'services_template',
      name: 'Services Template',
      fields: [
        CustomField(
          id: 'service_type',
          label: 'Service Type',
          type: 'select',
          options: ['Repair', 'Consultation', 'Installation', 'Maintenance', 'Other'],
          required: true,
          displayOrder: 1,
        ),
        CustomField(
          id: 'duration',
          label: 'Duration',
          type: 'text',
          displayOrder: 2,
        ),
        CustomField(
          id: 'location',
          label: 'Service Location',
          type: 'select',
          options: ['At Customer Location', 'At Service Center', 'Both'],
          displayOrder: 3,
        ),
      ],
    );
  }
}
