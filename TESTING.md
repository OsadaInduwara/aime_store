# Testing Guide

## 🧪 **Test Coverage**

We've created comprehensive unit tests for critical services to ensure reliability and catch bugs early.

---

## ✅ **Tests Created**

### 1. Payment Service Tests
**File:** `test/services/payment_service_test.dart`

**Coverage:**
- ✅ Gateway initialization
- ✅ Successful payment processing
- ✅ Payment failure handling
- ✅ Cash on delivery processing
- ✅ Payment verification
- ✅ Supported payment methods
- ✅ Gateway switching

**Test Count:** 7 tests

### 2. Validation Service Tests
**File:** `test/services/validation_service_test.dart`

**Coverage:**
- ✅ Email validation (valid/invalid/empty)
- ✅ Phone validation (Sri Lankan format)
- ✅ Password validation (strength requirements)
- ✅ Price validation
- ✅ Card number validation (Luhn algorithm)
- ✅ Input sanitization (XSS prevention)
- ✅ File validation (size & type)

**Test Count:** 20+ tests

### 3. Search Service Tests
**File:** `test/services/search_service_test.dart`

**Coverage:**
- ✅ Search filters creation
- ✅ Filter copying
- ✅ Search suggestions
- ✅ Trending searches

**Test Count:** 5 tests

---

## 🚀 **Running Tests**

### Run All Tests
```bash
flutter test
```

### Run Specific Test File
```bash
flutter test test/services/payment_service_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### View Coverage Report
```bash
# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open in browser
open coverage/html/index.html
```

---

## 📊 **Test Structure**

### Unit Tests
- **Location:** `test/services/`
- **Purpose:** Test individual services in isolation
- **Tools:** flutter_test, mockito

### Widget Tests (To Be Added)
- **Location:** `test/widgets/`
- **Purpose:** Test UI components
- **Tools:** flutter_test, golden_toolkit

### Integration Tests (To Be Added)
- **Location:** `integration_test/`
- **Purpose:** Test complete user flows
- **Tools:** integration_test

---

## 🛠️ **Testing Tools**

### Installed
- ✅ `flutter_test` - Core testing framework
- ✅ `mockito` - Mocking library
- ✅ `mockito_annotations` - Mock generation

### To Add (Optional)
- `golden_toolkit` - Widget screenshot testing
- `integration_test` - End-to-end testing
- `patrol` - Advanced integration testing

---

## 📝 **Writing Tests**

### Test Structure
```dart
void main() {
  group('ServiceName', () {
    late ServiceClass service;
    
    setUp(() {
      service = ServiceClass();
    });
    
    test('should do something', () {
      // Arrange
      final input = 'test';
      
      // Act
      final result = service.doSomething(input);
      
      // Assert
      expect(result, expectedValue);
    });
  });
}
```

### Mocking Dependencies
```dart
@GenerateMocks([Dependency])
void main() {
  late MockDependency mockDep;
  
  setUp(() {
    mockDep = MockDependency();
  });
  
  test('should use mocked dependency', () {
    when(mockDep.method()).thenReturn('mocked');
    // ... test code
  });
}
```

---

## ✅ **Test Checklist**

### Before Committing
- [ ] All tests pass (`flutter test`)
- [ ] No test warnings
- [ ] Coverage > 70% for critical services
- [ ] New features have tests

### Before Production
- [ ] All unit tests passing
- [ ] Widget tests for key screens
- [ ] Integration tests for critical flows
- [ ] Performance tests
- [ ] Security tests

---

## 🎯 **Coverage Goals**

| Component | Current | Target |
|-----------|---------|--------|
| Payment Service | 80% | 90% |
| Validation Service | 90% | 95% |
| Search Service | 60% | 80% |
| Order Service | 0% | 80% |
| Auth Provider | 0% | 70% |

---

## 🐛 **Common Issues**

### Mock Generation Fails
```bash
# Generate mocks
flutter pub run build_runner build --delete-conflicting-outputs
```

### Tests Timeout
```dart
// Increase timeout
test('long running test', () async {
  // test code
}, timeout: Timeout(Duration(seconds: 30)));
```

### Firebase Mocking
```dart
// Use fake_cloud_firestore for Firestore tests
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
```

---

## 📚 **Next Steps**

1. **Add Widget Tests**
   - Payment screens
   - Order screens
   - Search screens

2. **Add Integration Tests**
   - Complete checkout flow
   - Order placement flow
   - Search and filter flow

3. **Improve Coverage**
   - Order service tests
   - Notification service tests
   - Auth provider tests

4. **Performance Testing**
   - Load testing
   - Stress testing
   - Memory profiling

---

**Testing is crucial for production readiness!** 🧪
