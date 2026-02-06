import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';

part 'variant.freezed.dart';

/// Product variant with pricing, availability, and selection options.
@freezed
class Variant with _$Variant {
  const factory Variant({
    required String id,
    required String title,
    required Money price,
    Money? compareAtPrice,
    required bool availableForSale,
    int? quantityAvailable,
    required List<SelectedOption> selectedOptions,
    String? imageUrl,
  }) = _Variant;

  const Variant._();

  // MARK: - Computed Properties

  String? get color {
    try {
      return selectedOptions
          .firstWhere((o) => o.name.toLowerCase() == 'color')
          .value;
    } catch (_) {
      return null;
    }
  }

  String? get size {
    try {
      return selectedOptions
          .firstWhere((o) => o.name.toLowerCase() == 'size')
          .value;
    } catch (_) {
      return null;
    }
  }

  /// Checks if variant has discount by comparing prices.
  /// Used for discount badge display and price styling.
  bool get hasDiscount =>
      compareAtPrice != null &&
      (double.tryParse(compareAtPrice!.amount) ?? 0) >
          (double.tryParse(price.amount) ?? 0);
}

/// Selected option for variant (e.g., Color: Ice, Size: 154).
@freezed
class SelectedOption with _$SelectedOption {
  const factory SelectedOption({required String name, required String value}) =
      _SelectedOption;
}
