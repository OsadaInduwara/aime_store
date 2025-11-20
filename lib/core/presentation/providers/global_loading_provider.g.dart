// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_loading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalLoadingHash() => r'e37d4344c8c8171095f50b5564f66394aa62a2a5';

/// Global loading provider for managing app-wide loading states
///
/// Copied from [GlobalLoading].
@ProviderFor(GlobalLoading)
final globalLoadingProvider =
    AutoDisposeNotifierProvider<GlobalLoading, LoadingState>.internal(
  GlobalLoading.new,
  name: r'globalLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalLoading = AutoDisposeNotifier<LoadingState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
