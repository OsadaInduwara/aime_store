// test/services/validation_service_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:aime_store/core/services/validation_service.dart';

void main() {
  group('ValidationService', () {
    group('Email Validation', () {
      test('should return null for valid email', () {
        expect(ValidationService.validateEmail('test@example.com'), null);
        expect(ValidationService.validateEmail('user.name@domain.co.uk'), null);
      });

      test('should return error for invalid email', () {
        expect(ValidationService.validateEmail('invalid'), isNotNull);
        expect(ValidationService.validateEmail('test@'), isNotNull);
        expect(ValidationService.validateEmail('@example.com'), isNotNull);
      });

      test('should return error for empty email', () {
        expect(ValidationService.validateEmail(''), isNotNull);
        expect(ValidationService.validateEmail(null), isNotNull);
      });
    });

    group('Phone Validation', () {
      test('should return null for valid Sri Lankan phone', () {
        expect(ValidationService.validatePhone('+94771234567'), null);
        expect(ValidationService.validatePhone('0771234567'), null);
      });

      test('should return error for invalid phone', () {
        expect(ValidationService.validatePhone('123'), isNotNull);
        expect(ValidationService.validatePhone('+1234567890'), isNotNull);
      });

      test('should return error for empty phone', () {
        expect(ValidationService.validatePhone(''), isNotNull);
        expect(ValidationService.validatePhone(null), isNotNull);
      });
    });

    group('Password Validation', () {
      test('should return null for valid password', () {
        expect(ValidationService.validatePassword('Pass123'), null);
        expect(ValidationService.validatePassword('MySecure1Pass'), null);
      });

      test('should return error for password without numbers', () {
        expect(ValidationService.validatePassword('Password'), isNotNull);
      });

      test('should return error for password without letters', () {
        expect(ValidationService.validatePassword('123456'), isNotNull);
      });

      test('should return error for short password', () {
        expect(ValidationService.validatePassword('Pa1'), isNotNull);
      });

      test('should return error for empty password', () {
        expect(ValidationService.validatePassword(''), isNotNull);
        expect(ValidationService.validatePassword(null), isNotNull);
      });
    });

    group('Price Validation', () {
      test('should return null for valid price', () {
        expect(ValidationService.validatePrice('100'), null);
        expect(ValidationService.validatePrice('1000.50'), null);
      });

      test('should return error for negative price', () {
        expect(ValidationService.validatePrice('-100'), isNotNull);
      });

      test('should return error for invalid price', () {
        expect(ValidationService.validatePrice('abc'), isNotNull);
      });

      test('should return error for empty price', () {
        expect(ValidationService.validatePrice(''), isNotNull);
        expect(ValidationService.validatePrice(null), isNotNull);
      });
    });

    group('Card Number Validation (Luhn)', () {
      test('should return null for valid card number', () {
        // Valid test card numbers
        expect(ValidationService.validateCardNumber('4532015112830366'), null);
        expect(ValidationService.validateCardNumber('5425233430109903'), null);
      });

      test('should return error for invalid card number', () {
        expect(ValidationService.validateCardNumber('1234567890123456'), isNotNull);
      });

      test('should return error for empty card number', () {
        expect(ValidationService.validateCardNumber(''), isNotNull);
        expect(ValidationService.validateCardNumber(null), isNotNull);
      });
    });

    group('Input Sanitization', () {
      test('should remove HTML tags', () {
        final input = '<script>alert("xss")</script>Hello';
        final sanitized = ValidationService.sanitizeInput(input);
        expect(sanitized, 'Hello');
      });

      test('should trim whitespace', () {
        final input = '  Hello World  ';
        final sanitized = ValidationService.sanitizeInput(input);
        expect(sanitized, 'Hello World');
      });
    });

    group('File Validation', () {
      test('should validate image file size', () {
        expect(ValidationService.isValidFileSize(1024 * 1024, 10), true); // 1MB < 10MB
        expect(ValidationService.isValidFileSize(11 * 1024 * 1024, 10), false); // 11MB > 10MB
      });

      test('should validate image file type', () {
        expect(ValidationService.isValidImageType('photo.jpg'), true);
        expect(ValidationService.isValidImageType('image.png'), true);
        expect(ValidationService.isValidImageType('document.pdf'), false);
      });

      test('should validate video file type', () {
        expect(ValidationService.isValidVideoType('video.mp4'), true);
        expect(ValidationService.isValidVideoType('clip.mov'), true);
        expect(ValidationService.isValidVideoType('audio.mp3'), false);
      });
    });
  });
}
