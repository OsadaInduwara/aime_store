// test/services/payment_service_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aime_store/core/services/payment/payment_service.dart';
import 'package:aime_store/core/services/payment/payment_gateway.dart';
import 'package:aime_store/core/data/models/payment_models.dart';

@GenerateMocks([PaymentGateway, FirebaseFirestore])
void main() {
  group('PaymentService', () {
    late PaymentService paymentService;
    late MockPaymentGateway mockGateway;

    setUp(() {
      mockGateway = MockPaymentGateway();
      paymentService = PaymentService(gateway: mockGateway);
    });

    test('should initialize gateway on creation', () {
      verify(mockGateway.initialize()).called(1);
    });

    test('should process payment successfully', () async {
      // Arrange
      final request = PaymentRequest(
        orderId: 'test_order_123',
        amount: 1000.0,
        currency: 'LKR',
        customerName: 'Test User',
        customerEmail: 'test@example.com',
        customerPhone: '+94771234567',
        metadata: {'userId': 'user_123'},
      );

      final expectedResult = PaymentResult(
        success: true,
        transactionId: 'txn_123',
        paymentId: 'pay_123',
      );

      when(mockGateway.processPayment(any))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await paymentService.processPayment(request);

      // Assert
      expect(result.success, true);
      expect(result.transactionId, isNotNull);
      verify(mockGateway.processPayment(request)).called(1);
    });

    test('should handle payment failure', () async {
      // Arrange
      final request = PaymentRequest(
        orderId: 'test_order_123',
        amount: 1000.0,
        currency: 'LKR',
        customerName: 'Test User',
        customerEmail: 'test@example.com',
        customerPhone: '+94771234567',
      );

      final expectedResult = PaymentResult(
        success: false,
        errorMessage: 'Insufficient funds',
        errorCode: 'INSUFFICIENT_FUNDS',
      );

      when(mockGateway.processPayment(any))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await paymentService.processPayment(request);

      // Assert
      expect(result.success, false);
      expect(result.errorMessage, 'Insufficient funds');
      expect(result.errorCode, 'INSUFFICIENT_FUNDS');
    });

    test('should process cash on delivery successfully', () async {
      // Arrange
      final request = PaymentRequest(
        orderId: 'test_order_123',
        amount: 1000.0,
        currency: 'LKR',
        customerName: 'Test User',
        customerEmail: 'test@example.com',
        customerPhone: '+94771234567',
        metadata: {'userId': 'user_123'},
      );

      // Act
      final result = await paymentService.processCashOnDelivery(request);

      // Assert
      expect(result.success, true);
      expect(result.transactionId, isNotNull);
      expect(result.paymentId, startsWith('COD-'));
    });

    test('should verify payment', () async {
      // Arrange
      const transactionId = 'txn_123';
      when(mockGateway.verifyPayment(transactionId))
          .thenAnswer((_) async => true);

      // Act
      final result = await paymentService.verifyPayment(transactionId);

      // Assert
      expect(result, true);
      verify(mockGateway.verifyPayment(transactionId)).called(1);
    });

    test('should get supported payment methods', () {
      // Arrange
      final expectedMethods = [
        PaymentMethod.creditCard,
        PaymentMethod.debitCard,
        PaymentMethod.mobileWallet,
      ];

      when(mockGateway.getSupportedPaymentMethods())
          .thenReturn(expectedMethods);

      // Act
      final methods = paymentService.getSupportedPaymentMethods();

      // Assert
      expect(methods, contains(PaymentMethod.cashOnDelivery));
      expect(methods.length, expectedMethods.length + 1);
    });

    test('should switch payment gateway', () {
      // Arrange
      final newGateway = MockPaymentGateway();

      // Act
      paymentService.switchGateway(newGateway);

      // Assert
      verify(mockGateway.dispose()).called(1);
      verify(newGateway.initialize()).called(1);
    });
  });
}
