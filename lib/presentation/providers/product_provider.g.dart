// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productNotifierHash() => r'63f64e9d6a9e3b6ce6cd342e3369f654060bb2fb';

/// Product Provider using riverpod_generator
/// Fetches the product by handle and manages loading/error states
///
/// Copied from [ProductNotifier].
@ProviderFor(ProductNotifier)
final productNotifierProvider =
    AutoDisposeNotifierProvider<ProductNotifier, ProductState>.internal(
      ProductNotifier.new,
      name: r'productNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductNotifier = AutoDisposeNotifier<ProductState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
