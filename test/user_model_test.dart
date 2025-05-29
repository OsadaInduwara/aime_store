// test/user_model_test.dart - Test to verify Freezed models work
import 'package:flutter_test/flutter_test.dart';
import 'package:aime_store/core/models/user_model.dart';

void main() {
  group('UserModel Tests', () {
    test('should create UserModel with default preferences', () {
      final user = UserModel(
        id: 'test123',
        phoneNumber: '+94771234567',
        displayName: 'Test User',
        email: 'test@example.com',
        userType: UserType.customer,
        addresses: const [],
        preferences: const UserPreferences(
          language: 'en',
          currency: 'LKR',
          notifications: NotificationSettings(
            push: true,
            sms: true,
            email: true,
            orderUpdates: true,
            promotions: false,
          ),
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(user.id, 'test123');
      expect(user.displayName, 'Test User');
      expect(user.preferences.language, 'en');
      expect(user.preferences.notifications.push, true);
    });

    test('should serialize and deserialize UserModel', () {
      final originalUser = UserModel(
        id: 'test123',
        phoneNumber: '+94771234567',
        displayName: 'Test User',
        email: 'test@example.com',
        userType: UserType.customer,
        addresses: const [],
        preferences: const UserPreferences(
          language: 'en',
          currency: 'LKR',
          notifications: NotificationSettings(
            push: true,
            sms: true,
            email: true,
            orderUpdates: true,
            promotions: false,
          ),
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Convert to JSON
      final json = originalUser.toJson();

      // Add the ID (as it's usually added by Firestore)
      json['id'] = originalUser.id;

      // Convert back from JSON
      final deserializedUser = UserModel.fromJson(json);

      expect(deserializedUser.id, originalUser.id);
      expect(deserializedUser.displayName, originalUser.displayName);
      expect(deserializedUser.preferences.language, originalUser.preferences.language);
    });
  });
}