// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_error_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalErrorHash() => r'd9b7896e377bc611e63e6a39359b560fd8332177';

/// Global error provider for managing app-wide error states
///
/// Copied from [GlobalError].
@ProviderFor(GlobalError)
final globalErrorProvider =
    AutoDisposeNotifierProvider<GlobalError, ErrorState>.internal(
  GlobalError.new,
  name: r'globalErrorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$globalErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalError = AutoDisposeNotifier<ErrorState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
