# Aime Store - Project Structure

## Overview
This Flutter e-commerce application follows Clean Architecture principles with feature-based organization.

## Directory Structure

```
lib/
├── main.dart                           # App entry point
├── app/                               # App-level configuration
│   └── app.dart                       # Main app widget
├── core/                              # Shared/Core functionality
│   ├── constants/                     # App constants
│   │   ├── app_constants.dart         # General app constants
│   │   └── api_constants.dart         # API-related constants
│   ├── config/                        # Configuration files
│   │   └── firebase_options.dart      # Firebase configuration
│   ├── data/                          # Data layer (Clean Architecture)
│   │   └── models/                    # Data models with freezed/json
│   │       ├── user_model.dart
│   │       ├── product_model.dart
│   │       ├── store_model.dart
│   │       ├── category_model.dart
│   │       ├── cart_model.dart
│   │       ├── order_model.dart
│   │       └── banner_model.dart
│   ├── presentation/                  # Presentation layer
│   │   ├── providers/                 # Riverpod state providers
│   │   ├── widgets/                   # Reusable UI components
│   │   └── themes/                    # App themes
│   ├── services/                      # Business logic services
│   ├── utils/                         # Utility functions
│   ├── exceptions/                    # Custom exceptions
│   └── router/                        # App routing
├── features/                          # Feature-based organization
│   ├── auth/                         # Authentication feature
│   │   └── presentation/
│   │       └── screens/              # Auth screens
│   ├── home/                         # Home feature
│   │   └── presentation/
│   │       ├── screens/              # Home screens
│   │       └── widgets/              # Home-specific widgets
│   ├── products/                     # Products feature
│   │   └── presentation/
│   │       └── screens/
│   ├── cart/                         # Shopping cart
│   │   └── presentation/
│   │       └── screens/
│   ├── orders/                       # Order management
│   │   └── presentation/
│   │       └── screens/
│   ├── profile/                      # User profile
│   │   └── presentation/
│   │       └── screens/
│   ├── vendor/                       # Vendor/Store management
│   │   └── presentation/
│   │       └── screens/
│   ├── categories/                   # Product categories
│   │   └── presentation/
│   │       └── screens/
│   ├── search/                       # Search functionality
│   │   └── presentation/
│   │       └── screens/
│   ├── wishlist/                     # User wishlist
│   │   └── presentation/
│   │       └── screens/
│   ├── notifications/                # Notifications
│   │   └── presentation/
│   │       └── screens/
│   ├── settings/                     # App settings
│   │   └── presentation/
│   │       └── screens/
│   ├── addresses/                    # Address management
│   │   └── presentation/
│   │       └── screens/
│   ├── checkout/                     # Checkout process
│   │   └── presentation/
│   │       └── screens/
│   ├── splash/                       # Splash screen
│   │   └── presentation/
│   │       └── screens/
│   ├── store_detail/                 # Store detail view
│   │   └── presentation/
│   │       └── screens/
│   └── not_found/                    # 404/Error screens
│       └── presentation/
│           └── screens/
└── l10n/                             # Localization
    └── app_localizations.dart        # Translation strings
```

## Key Features

### State Management
- **Riverpod** with code generation
- StateNotifierProvider for complex state
- FutureProvider for async operations
- Provider for dependency injection

### Architecture
- **Clean Architecture** principles
- **Feature-based** organization
- **Separation of concerns**
- **SOLID** principles

### Core Features
- Multi-method authentication (Phone, Email, Social)
- Product catalog with search and categories
- Shopping cart and wishlist
- Order management
- Store/Vendor support
- Multi-language support (English/Sinhala)
- Theme switching (Light/Dark)
- Address management
- Push notifications

### Technical Stack
- **Flutter** with Material 3
- **Firebase** (Auth, Firestore, Storage, Analytics)
- **Riverpod** for state management
- **GoRouter** for navigation
- **Freezed** for immutable models
- **Hive** for local storage
- **Google Fonts** for typography

## Import Conventions

### Core imports (from feature files):
```dart
import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/constants/app_constants.dart';
```

### Feature imports (within features):
```dart
import '../widgets/search_bar_widget.dart';
import '../../../other_feature/presentation/screens/screen.dart';
```

## File Naming Conventions
- **snake_case** for all file names
- **screen.dart** suffix for screen files
- **widget.dart** suffix for widget files
- **provider.dart** suffix for provider files
- **service.dart** suffix for service files
- **model.dart** suffix for model files

## Generated Files
Files with `.g.dart` and `.freezed.dart` extensions are generated by:
- **json_serializable** for JSON serialization
- **freezed** for immutable classes
- **riverpod_generator** for providers

Run `flutter packages pub run build_runner build` to regenerate.