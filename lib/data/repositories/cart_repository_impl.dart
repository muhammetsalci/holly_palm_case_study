import 'package:flutter/foundation.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/variant.dart';
import '../../domain/repositories/cart_repository.dart';

/// Local cart repository with in-memory state management.
/// 
/// Uses in-memory storage instead of persistent storage to support
/// optimistic UI pattern (immediate state updates without async I/O).
class CartRepositoryImpl implements CartRepository {
  CartState _cartState = const CartState();
  int _itemIdCounter = 0;

  @override
  CartState getCartState() => _cartState;

  @override
  Future<(CartState?, Failure?)> addToCart({
    required Variant variant,
    required String productTitle,
    String? imageUrl,
    int quantity = 1,
  }) async {
    try {
      if (!variant.availableForSale) {
        return (null, const StockFailure('Bu ürün stokta yok'));
      }

      if (quantity <= 0) {
        return (null, const CartFailure('Geçersiz miktar'));
      }

      final existingIndex = _cartState.items.indexWhere(
        (item) => item.variant.id == variant.id,
      );

      List<CartItem> updatedItems;

      if (existingIndex >= 0) {
        final existingItem = _cartState.items[existingIndex];
        final updatedItem = existingItem.copyWith(
          quantity: existingItem.quantity + quantity,
        );
        updatedItems = List.from(_cartState.items);
        updatedItems[existingIndex] = updatedItem;
      } else {
        final newItem = CartItem(
          id: 'cart_item_${++_itemIdCounter}',
          variant: variant,
          productTitle: productTitle,
          imageUrl: variant.imageUrl ?? imageUrl,
          quantity: quantity,
        );
        updatedItems = [..._cartState.items, newItem];
      }

      _cartState = _cartState.copyWith(
        items: updatedItems,
        lastUpdated: DateTime.now(),
        error: null,
      );

      if (kDebugMode) {
        print(
          'Cart updated: ${_cartState.totalItems} items, '
          'total: ${_cartState.formattedTotalValue}',
        );
      }

      return (_cartState, null);
    } catch (e) {
      return (null, CartFailure('Sepete ekleme hatası: ${e.toString()}'));
    }
  }

  @override
  Future<(CartState?, Failure?)> removeFromCart(String cartItemId) async {
    try {
      final updatedItems = _cartState.items
          .where((item) => item.id != cartItemId)
          .toList();

      _cartState = _cartState.copyWith(
        items: updatedItems,
        lastUpdated: DateTime.now(),
        error: null,
      );

      return (_cartState, null);
    } catch (e) {
      return (null, CartFailure('Sepetten çıkarma hatası: ${e.toString()}'));
    }
  }

  @override
  Future<(CartState?, Failure?)> updateQuantity({
    required String cartItemId,
    required int quantity,
  }) async {
    try {
      if (quantity <= 0) {
        return removeFromCart(cartItemId);
      }

      final index = _cartState.items.indexWhere(
        (item) => item.id == cartItemId,
      );

      if (index < 0) {
        return (null, const CartFailure('Ürün sepette bulunamadı'));
      }

      final updatedItem = _cartState.items[index].copyWith(quantity: quantity);
      final updatedItems = List<CartItem>.from(_cartState.items);
      updatedItems[index] = updatedItem;

      _cartState = _cartState.copyWith(
        items: updatedItems,
        lastUpdated: DateTime.now(),
        error: null,
      );

      return (_cartState, null);
    } catch (e) {
      return (null, CartFailure('Miktar güncelleme hatası: ${e.toString()}'));
    }
  }

  @override
  Future<(CartState?, Failure?)> clearCart() async {
    try {
      _cartState = const CartState();
      return (_cartState, null);
    } catch (e) {
      return (null, CartFailure('Sepet temizleme hatası: ${e.toString()}'));
    }
  }

  // MARK: - Helpers

  /// Rolls back to previous state when optimistic update fails.
  void rollbackState(CartState previousState) {
    _cartState = previousState;
    if (kDebugMode) {
      print('Cart rolled back to previous state');
    }
  }

  void setLoading(bool isLoading) {
    _cartState = _cartState.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    _cartState = _cartState.copyWith(error: error);
  }
}
