// lib/features/vendor/presentation/providers/vendor_products_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/models/product_model.dart';
import '../../../../core/services/product_service.dart';
import '../../../../core/presentation/providers/products_provider.dart';

// Provider for vendor products
final vendorProductsProvider = FutureProvider.family<List<ProductModel>, bool?>((ref, isActive) async {
  final productService = ref.read(productServiceProvider);
  return await productService.getVendorProducts(isActive: isActive);
});

// Provider for single vendor product
final vendorProductProvider = FutureProvider.family<ProductModel?, String>((ref, productId) async {
  final productService = ref.read(productServiceProvider);
  return await productService.getProductById(productId);
});
