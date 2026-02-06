import 'package:freezed_annotation/freezed_annotation.dart';

import 'variant.dart';

part 'cart_item.freezed.dart';

/// Cart item representing product variant with quantity.
@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required Variant variant,
    required String productTitle,
    String? imageUrl,
    @Default(1) int quantity,
  }) = _CartItem;

  const CartItem._();

  // MARK: - Computed Properties

  double get totalPrice {
    final unitPrice = double.tryParse(variant.price.amount) ?? 0;
    return unitPrice * quantity;
  }

  String get formattedTotalPrice {
    final symbol = _currencySymbol(variant.price.currencyCode);
    return '$symbol${totalPrice.toStringAsFixed(2)}';
  }

  String _currencySymbol(String currencyCode) {
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

/// Cart state aggregate containing all items and metadata.
@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
    @Default(false) bool isLoading,
    String? error,
    DateTime? lastUpdated,
  }) = _CartState;

  const CartState._();

  // MARK: - Computed Properties

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  double get totalValue =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  /// Check if cart is empty
  bool get isEmpty => items.isEmpty;

  /// Formatted total value
  String get formattedTotalValue {
    if (items.isEmpty) return '\$0.00';
    final currencyCode = items.first.variant.price.currencyCode;
    final symbol = _currencySymbol(currencyCode);
    return '$symbol${totalValue.toStringAsFixed(2)}';
  }

  String _currencySymbol(String currencyCode) {
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
