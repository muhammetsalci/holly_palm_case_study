import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/variant.dart';
import 'product_provider.dart';

part 'variant_selection_provider.g.dart';

/// Represents variant selection state with no default value.
/// 
/// Forces explicit user choice to prevent accidental orders of wrong variants,
/// reducing return rates and customer dissatisfaction.
class VariantSelectionState {
  final Variant? selectedVariant;

  const VariantSelectionState({this.selectedVariant});

  VariantSelectionState copyWith({
    Variant? selectedVariant,
    bool clearVariant = false,
  }) {
    return VariantSelectionState(
      selectedVariant: clearVariant
          ? null
          : (selectedVariant ?? this.selectedVariant),
    );
  }

  bool get hasSelection => selectedVariant != null;
  bool get isAvailableForSale => selectedVariant?.availableForSale ?? false;
  String? get currentImageUrl => selectedVariant?.imageUrl;
}

/// Manages variant selection with forced user choice pattern.
/// 
/// Unlike auto-selection patterns, starts with null state to ensure
/// users explicitly choose size/color/type before adding to cart.
/// This UX pattern reduces mis-orders and associated return costs.
@riverpod
class VariantSelection extends _$VariantSelection {
  @override
  VariantSelectionState build() {
    ref.watch(productNotifierProvider);
    return const VariantSelectionState(selectedVariant: null);
  }

  void selectVariant(Variant variant) {
    state = VariantSelectionState(selectedVariant: variant);
  }

  void clearSelection() {
    state = const VariantSelectionState(selectedVariant: null);
  }
}
