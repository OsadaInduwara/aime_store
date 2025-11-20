// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://api.aimestore.lk';
  static const String apiVersion = 'v1';
  
  // Endpoints
  static const String productsEndpoint = '/products';
  static const String categoriesEndpoint = '/categories';
  static const String storesEndpoint = '/stores';
  static const String ordersEndpoint = '/orders';
  static const String usersEndpoint = '/users';
  
  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

