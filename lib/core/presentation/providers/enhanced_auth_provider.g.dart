// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enhanced_auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangesHash() => r'06c05eec5a6c9127c308a9d2edb0019c311705c4';

/// Provider for auth state changes stream
///
/// Copied from [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangesRef = AutoDisposeStreamProviderRef<User?>;
String _$enhancedAuthServicesHash() =>
    r'59cccfe660344cd7a308f4713a59a20413a557b0';

/// Provider for enhanced auth service
///
/// Copied from [enhancedAuthServices].
@ProviderFor(enhancedAuthServices)
final enhancedAuthServicesProvider = AutoDisposeProvider<AuthService>.internal(
  enhancedAuthServices,
  name: r'enhancedAuthServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enhancedAuthServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnhancedAuthServicesRef = AutoDisposeProviderRef<AuthService>;
String _$enhancedAuthNotifierHash() =>
    r'ee5bc6375b562fa350aca8f07a95bd174c7b0433';

/// Enhanced auth provider with proper error handling and loading states
///
/// Copied from [EnhancedAuthNotifier].
@ProviderFor(EnhancedAuthNotifier)
final enhancedAuthNotifierProvider =
    AutoDisposeNotifierProvider<EnhancedAuthNotifier, User?>.internal(
  EnhancedAuthNotifier.new,
  name: r'enhancedAuthNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enhancedAuthNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnhancedAuthNotifier = AutoDisposeNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
