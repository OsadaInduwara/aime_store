// lib/core/services/firestore_init_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreInitService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Initialize Firestore collections and indexes for the personalization system
  static Future<void> initializePersonalizationCollections() async {
    try {
      // Create sample collections if they don't exist
      await _ensureCollectionExists('user_behaviors');
      await _ensureCollectionExists('user_preferences');
      await _ensureCollectionExists('product_affinities');
      await _ensureCollectionExists('recommendations');

      print('Firestore personalization collections initialized successfully');
    } catch (e) {
      print('Error initializing Firestore collections: $e');
    }
  }

  /// Ensure a collection exists by creating a dummy document if needed
  static Future<void> _ensureCollectionExists(String collectionName) async {
    try {
      final collection = _firestore.collection(collectionName);
      final snapshot = await collection.limit(1).get();

      if (snapshot.docs.isEmpty) {
        // Create a dummy document to initialize the collection
        await collection.doc('_init').set({
          'initialized': true,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Delete the dummy document
        await collection.doc('_init').delete();
      }
    } catch (e) {
      print('Error ensuring collection $collectionName exists: $e');
    }
  }

  /// Create sample product data for testing recommendations
  static Future<void> createSampleProducts() async {
    try {
      final productsRef = _firestore.collection('products');

      // Check if products already exist
      final existingProducts = await productsRef.limit(1).get();
      if (existingProducts.docs.isNotEmpty) {
        print('Sample products already exist');
        return;
      }

      // Create sample categories first
      await _createSampleCategories();

      // Sample products data
      final sampleProducts = [
        {
          'id': 'product_1',
          'storeId': 'store_1',
          'categoryId': 'electronics',
          'name': 'Wireless Headphones',
          'description': 'High-quality wireless headphones with noise cancellation',
          'shortDescription': 'Premium wireless headphones',
          'images': ['https://example.com/headphones1.jpg'],
          'videos': [],
          'thumbnailImage': 'https://example.com/headphones1.jpg',
          'pricing': {
            'basePrice': 5999.0,
            'salePrice': 4999.0,
            'currency': 'LKR',
            'priceType': 'fixed',
          },
          'inventory': {
            'trackInventory': true,
            'stockQuantity': 50,
            'allowBackorder': false,
            'stockStatus': 'in_stock',
          },
          'variants': [],
          'customAttributes': {},
          'tags': ['wireless', 'headphones', 'audio', 'bluetooth'],
          'searchKeywords': ['headphones', 'wireless', 'audio', 'music'],
          'settings': {
            'isActive': true,
            'isFeatured': true,
            'allowReviews': true,
            'requiresApproval': false,
          },
          'stats': {
            'viewCount': 150,
            'orderCount': 25,
            'rating': 4.5,
            'reviewCount': 18,
            'wishlistCount': 35,
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'publishedAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'product_2',
          'storeId': 'store_1',
          'categoryId': 'electronics',
          'name': 'Smartphone Case',
          'description': 'Durable protective case for smartphones',
          'shortDescription': 'Protective phone case',
          'images': ['https://example.com/case1.jpg'],
          'videos': [],
          'thumbnailImage': 'https://example.com/case1.jpg',
          'pricing': {
            'basePrice': 1999.0,
            'currency': 'LKR',
            'priceType': 'fixed',
          },
          'inventory': {
            'trackInventory': true,
            'stockQuantity': 100,
            'allowBackorder': false,
            'stockStatus': 'in_stock',
          },
          'variants': [],
          'customAttributes': {},
          'tags': ['phone', 'case', 'protection', 'accessory'],
          'searchKeywords': ['phone case', 'protection', 'mobile'],
          'settings': {
            'isActive': true,
            'isFeatured': false,
            'allowReviews': true,
            'requiresApproval': false,
          },
          'stats': {
            'viewCount': 89,
            'orderCount': 15,
            'rating': 4.2,
            'reviewCount': 12,
            'wishlistCount': 22,
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'publishedAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'product_3',
          'storeId': 'store_2',
          'categoryId': 'fashion',
          'name': 'Cotton T-Shirt',
          'description': 'Comfortable cotton t-shirt for everyday wear',
          'shortDescription': 'Cotton t-shirt',
          'images': ['https://example.com/tshirt1.jpg'],
          'videos': [],
          'thumbnailImage': 'https://example.com/tshirt1.jpg',
          'pricing': {
            'basePrice': 2500.0,
            'currency': 'LKR',
            'priceType': 'fixed',
          },
          'inventory': {
            'trackInventory': true,
            'stockQuantity': 75,
            'allowBackorder': false,
            'stockStatus': 'in_stock',
          },
          'variants': [],
          'customAttributes': {},
          'tags': ['clothing', 'tshirt', 'cotton', 'casual'],
          'searchKeywords': ['t-shirt', 'shirt', 'clothing', 'cotton'],
          'settings': {
            'isActive': true,
            'isFeatured': false,
            'allowReviews': true,
            'requiresApproval': false,
          },
          'stats': {
            'viewCount': 67,
            'orderCount': 12,
            'rating': 4.0,
            'reviewCount': 8,
            'wishlistCount': 15,
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'publishedAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'product_4',
          'storeId': 'store_2',
          'categoryId': 'books',
          'name': 'Programming Guide',
          'description': 'Complete guide to modern programming languages',
          'shortDescription': 'Programming book',
          'images': ['https://example.com/book1.jpg'],
          'videos': [],
          'thumbnailImage': 'https://example.com/book1.jpg',
          'pricing': {
            'basePrice': 3500.0,
            'currency': 'LKR',
            'priceType': 'fixed',
          },
          'inventory': {
            'trackInventory': true,
            'stockQuantity': 30,
            'allowBackorder': true,
            'stockStatus': 'in_stock',
          },
          'variants': [],
          'customAttributes': {},
          'tags': ['book', 'programming', 'education', 'technology'],
          'searchKeywords': ['programming', 'book', 'coding', 'development'],
          'settings': {
            'isActive': true,
            'isFeatured': true,
            'allowReviews': true,
            'requiresApproval': false,
          },
          'stats': {
            'viewCount': 45,
            'orderCount': 8,
            'rating': 4.8,
            'reviewCount': 6,
            'wishlistCount': 18,
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'publishedAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'product_5',
          'storeId': 'store_3',
          'categoryId': 'home',
          'name': 'Coffee Mug',
          'description': 'Ceramic coffee mug with ergonomic design',
          'shortDescription': 'Ceramic coffee mug',
          'images': ['https://example.com/mug1.jpg'],
          'videos': [],
          'thumbnailImage': 'https://example.com/mug1.jpg',
          'pricing': {
            'basePrice': 1200.0,
            'currency': 'LKR',
            'priceType': 'fixed',
          },
          'inventory': {
            'trackInventory': true,
            'stockQuantity': 200,
            'allowBackorder': false,
            'stockStatus': 'in_stock',
          },
          'variants': [],
          'customAttributes': {},
          'tags': ['mug', 'coffee', 'ceramic', 'kitchen'],
          'searchKeywords': ['mug', 'coffee', 'cup', 'kitchen'],
          'settings': {
            'isActive': true,
            'isFeatured': false,
            'allowReviews': true,
            'requiresApproval': false,
          },
          'stats': {
            'viewCount': 78,
            'orderCount': 22,
            'rating': 4.3,
            'reviewCount': 15,
            'wishlistCount': 12,
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'publishedAt': FieldValue.serverTimestamp(),
        },
      ];

      // Create products
      final batch = _firestore.batch();
      for (final productData in sampleProducts) {
        final docRef = productsRef.doc(productData['id'] as String);
        batch.set(docRef, productData);
      }
      await batch.commit();

      print('Sample products created successfully');
    } catch (e) {
      print('Error creating sample products: $e');
    }
  }

  /// Create sample categories
  static Future<void> _createSampleCategories() async {
    try {
      final categoriesRef = _firestore.collection('categories');

      final sampleCategories = [
        {
          'id': 'electronics',
          'name': 'Electronics',
          'description': 'Electronic devices and accessories',
          'image': 'https://example.com/electronics.jpg',
          'isActive': true,
          'sortOrder': 1,
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'fashion',
          'name': 'Fashion',
          'description': 'Clothing and fashion accessories',
          'image': 'https://example.com/fashion.jpg',
          'isActive': true,
          'sortOrder': 2,
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'books',
          'name': 'Books',
          'description': 'Books and educational materials',
          'image': 'https://example.com/books.jpg',
          'isActive': true,
          'sortOrder': 3,
          'createdAt': FieldValue.serverTimestamp(),
        },
        {
          'id': 'home',
          'name': 'Home & Kitchen',
          'description': 'Home and kitchen essentials',
          'image': 'https://example.com/home.jpg',
          'isActive': true,
          'sortOrder': 4,
          'createdAt': FieldValue.serverTimestamp(),
        },
      ];

      final batch = _firestore.batch();
      for (final categoryData in sampleCategories) {
        final docRef = categoriesRef.doc(categoryData['id'] as String);
        batch.set(docRef, categoryData);
      }
      await batch.commit();

      print('Sample categories created successfully');
    } catch (e) {
      print('Error creating sample categories: $e');
    }
  }

  /// Test the recommendation system with sample data
  static Future<void> testRecommendationSystem() async {
    try {
      // This would typically be called after user authentication
      print('Testing recommendation system...');

      // The actual testing would be done through the RecommendationService
      // This is just a placeholder to verify the setup

      print('Recommendation system test completed');
    } catch (e) {
      print('Error testing recommendation system: $e');
    }
  }
}