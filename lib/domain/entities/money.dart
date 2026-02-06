import 'package:freezed_annotation/freezed_annotation.dart';

part 'money.freezed.dart';

/// Money value object with currency formatting.
@freezed
class Money with _$Money {
  const factory Money({required String amount, required String currencyCode}) =
      _Money;

  const Money._();

  /// Formats amount with currency symbol based on currency code.
  /// Returns locale-appropriate symbol (₺ for TRY, $ for USD).
  String get formatted {
    final double value = double.tryParse(amount) ?? 0;
    final symbol = _currencySymbol;
    return '$symbol${value.toStringAsFixed(2)}';
  }

  String get _currencySymbol {
    switch (currencyCode) {
      case 'TRY':
        return '₺';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      default:
        return '$currencyCode ';
    }
  }
}
