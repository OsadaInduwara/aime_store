// lib/core/services/validation_service.dart
import '../exceptions/app_exceptions.dart';

/// Centralized validation service for input validation
class ValidationService {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  // Phone number validation (Sri Lankan format)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    
    // Remove spaces and dashes
    final cleanPhone = value.replaceAll(RegExp(r'[\s-]'), '');
    
    // Sri Lankan phone formats: +94XXXXXXXXX or 0XXXXXXXXX
    final phoneRegex = RegExp(r'^(\+94|0)[0-9]{9}$');
    if (!phoneRegex.hasMatch(cleanPhone)) {
      return 'Please enter a valid Sri Lankan phone number';
    }
    
    return null;
  }

  // Password validation
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    
    // Check for at least one letter and one number
    if (!value.contains(RegExp(r'[A-Za-z]')) || !value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain both letters and numbers';
    }
    
    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  // Name validation
  static String? validateName(String? value, {int minLength = 2, int maxLength = 50}) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    
    if (value.trim().length < minLength) {
      return 'Name must be at least $minLength characters';
    }
    
    if (value.trim().length > maxLength) {
      return 'Name must be less than $maxLength characters';
    }
    
    // Only letters, spaces, and common name characters
    if (!RegExp(r'^[a-zA-Z\s\'-]+$').hasMatch(value.trim())) {
      return 'Name can only contain letters, spaces, hyphens, and apostrophes';
    }
    
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Price validation
  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }
    
    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid price';
    }
    
    if (price < 0) {
      return 'Price cannot be negative';
    }
    
    if (price > 10000000) {
      return 'Price is too high';
    }
    
    return null;
  }

  // Stock/Quantity validation
  static String? validateQuantity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Quantity is required';
    }
    
    final quantity = int.tryParse(value);
    if (quantity == null) {
      return 'Please enter a valid quantity';
    }
    
    if (quantity < 0) {
      return 'Quantity cannot be negative';
    }
    
    if (quantity > 1000000) {
      return 'Quantity is too high';
    }
    
    return null;
  }

  // URL validation
  static String? validateUrl(String? value, {bool required = false}) {
    if (value == null || value.trim().isEmpty) {
      return required ? 'URL is required' : null;
    }
    
    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$'
    );
    
    if (!urlRegex.hasMatch(value.trim())) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }

  // Address validation
  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required';
    }
    
    if (value.trim().length < 10) {
      return 'Please enter a complete address';
    }
    
    if (value.trim().length > 200) {
      return 'Address is too long';
    }
    
    return null;
  }

  // City validation
  static String? validateCity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'City is required';
    }
    
    if (value.trim().length < 2) {
      return 'Please enter a valid city name';
    }
    
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
      return 'City name can only contain letters and spaces';
    }
    
    return null;
  }

  // Postal code validation (Sri Lankan format)
  static String? validatePostalCode(String? value, {bool required = false}) {
    if (value == null || value.trim().isEmpty) {
      return required ? 'Postal code is required' : null;
    }
    
    // Sri Lankan postal codes are 5 digits
    if (!RegExp(r'^\d{5}$').hasMatch(value.trim())) {
      return 'Please enter a valid 5-digit postal code';
    }
    
    return null;
  }

  // Description validation
  static String? validateDescription(String? value, {int minLength = 10, int maxLength = 1000}) {
    if (value == null || value.trim().isEmpty) {
      return 'Description is required';
    }
    
    if (value.trim().length < minLength) {
      return 'Description must be at least $minLength characters';
    }
    
    if (value.trim().length > maxLength) {
      return 'Description must be less than $maxLength characters';
    }
    
    return null;
  }

  // OTP validation
  static String? validateOTP(String? value, {int length = 6}) {
    if (value == null || value.trim().isEmpty) {
      return 'OTP is required';
    }
    
    if (value.trim().length != length) {
      return 'OTP must be $length digits';
    }
    
    if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
      return 'OTP must contain only numbers';
    }
    
    return null;
  }

  // Credit card number validation (basic Luhn algorithm)
  static String? validateCardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Card number is required';
    }
    
    final cleanNumber = value.replaceAll(RegExp(r'\s'), '');
    
    if (!RegExp(r'^\d{13,19}$').hasMatch(cleanNumber)) {
      return 'Please enter a valid card number';
    }
    
    // Luhn algorithm
    int sum = 0;
    bool alternate = false;
    
    for (int i = cleanNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cleanNumber[i]);
      
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      
      sum += digit;
      alternate = !alternate;
    }
    
    if (sum % 10 != 0) {
      return 'Invalid card number';
    }
    
    return null;
  }

  // CVV validation
  static String? validateCVV(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'CVV is required';
    }
    
    if (!RegExp(r'^\d{3,4}$').hasMatch(value.trim())) {
      return 'CVV must be 3 or 4 digits';
    }
    
    return null;
  }

  // Expiry date validation (MM/YY format)
  static String? validateExpiryDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Expiry date is required';
    }
    
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value.trim())) {
      return 'Please enter date in MM/YY format';
    }
    
    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);
    
    if (month == null || year == null || month < 1 || month > 12) {
      return 'Invalid expiry date';
    }
    
    final now = DateTime.now();
    final expiryDate = DateTime(2000 + year, month);
    
    if (expiryDate.isBefore(DateTime(now.year, now.month))) {
      return 'Card has expired';
    }
    
    return null;
  }

  // Sanitize input (remove potentially dangerous characters)
  static String sanitizeInput(String input) {
    // Remove HTML tags
    String sanitized = input.replaceAll(RegExp(r'<[^>]*>'), '');
    
    // Remove script tags and their content
    sanitized = sanitized.replaceAll(RegExp(r'<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>', caseSensitive: false), '');
    
    // Trim whitespace
    sanitized = sanitized.trim();
    
    return sanitized;
  }

  // Validate file size
  static bool isValidFileSize(int sizeInBytes, int maxSizeInMB) {
    return sizeInBytes <= (maxSizeInMB * 1024 * 1024);
  }

  // Validate image file type
  static bool isValidImageType(String fileName) {
    final validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    final extension = fileName.split('.').last.toLowerCase();
    return validExtensions.contains(extension);
  }

  // Validate video file type
  static bool isValidVideoType(String fileName) {
    final validExtensions = ['mp4', 'mov', 'avi', 'mkv', 'webm'];
    final extension = fileName.split('.').last.toLowerCase();
    return validExtensions.contains(extension);
  }

  // Throw validation exception
  static void throwValidationError(String message) {
    throw ValidationException(message);
  }
}
