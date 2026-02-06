import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/variant.dart';
import '../../domain/usecases/cart_usecases.dart';

part 'cart_provider.g.dart';

/// Global cart state manager with Optimistic UI pattern.
/// 
/// Updates UI immediately for instant feedback, executes backend operations
/// asynchronously, and rolls back on failure to maintain data integrity.
@riverpod
class CartNotifier extends _$CartNotifier {
  late final CartRepositoryImpl _repository;
  late final AddToCart _addToCart;
  late final RemoveFromCart _removeFromCart;
  late final UpdateCartQuantity _updateQuantity;
  late final ClearCart _clearCart;

  @override
  CartState build() {
    _repository = CartRepositoryImpl();
    _addToCart = AddToCart(_repository);
    _removeFromCart = RemoveFromCart(_repository);
    _updateQuantity = UpdateCartQuantity(_repository);
    _clearCart = ClearCart(_repository);

    return const CartState();
  }

  // MARK: - Cart Operations

  /// Adds item to cart with Optimistic UI pattern.
  /// 
  /// Strategy:
  /// 1. Validates stock availability
  /// 2. Updates UI immediately (creates temporary ID)
  /// 3. Executes backend operation asynchronously
  /// 4. Rolls back to previous state if operation fails
  /// 
  /// Returns `true` if successfully added, `false` otherwise.
  Future<bool> addToCart({
    required Variant variant,
    required String productTitle,
    String? imageUrl,
  }) async {
    if (!variant.availableForSale) {
      state = state.copyWith(error: '${variant.title} stokta bulunmamaktadır');
      return false;
    }

    final previousState = state;

    final optimisticItem = CartItem(
      id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
      variant: variant,
      productTitle: productTitle,
      imageUrl: variant.imageUrl ?? imageUrl,
      quantity: 1,
    );

    final existingIndex = state.items.indexWhere(
      (item) => item.variant.id == variant.id,
    );

    if (existingIndex >= 0) {
      final updatedItems = List<CartItem>.from(state.items);
      final existingItem = updatedItems[existingIndex];
      updatedItems[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
      state = state.copyWith(items: updatedItems, isLoading: true, error: null);
    } else {
      state = state.copyWith(
        items: [...state.items, optimisticItem],
        isLoading: true,
        error: null,
      );
    }

    if (kDebugMode) {
      print('Optimistic UI: Cart updated to ${state.totalItems} items');
    }

    final (newState, failure) = await _addToCart(
      variant: variant,
      productTitle: productTitle,
      imageUrl: imageUrl,
    );

    if (failure != null) {
      state = previousState.copyWith(error: failure.message, isLoading: false);

      if (kDebugMode) {
        print('Optimistic UI: Rolled back due to error: ${failure.message}');
      }

      return false;
    }

    if (newState != null) {
      state = newState.copyWith(isLoading: false, error: null);
    }

    if (kDebugMode) {
      print('Optimistic UI: Confirmed, cart has ${state.totalItems} items');
    }

    return true;
  }

  /// Removes item from cart with optimistic update.
  Future<void> removeFromCart(String cartItemId) async {
    final previousState = state;

    state = state.copyWith(
      items: state.items.where((item) => item.id != cartItemId).toList(),
      isLoading: true,
    );

    final (newState, failure) = await _removeFromCart(cartItemId);

    if (failure != null) {
      state = previousState.copyWith(error: failure.message, isLoading: false);
      return;
    }

    if (newState != null) {
      state = newState.copyWith(isLoading: false);
    }
  }

  /// Updates item quantity with optimistic update.
  Future<void> updateQuantity({
    required String cartItemId,
    required int quantity,
  }) async {
    final previousState = state;

    final updatedItems = state.items.map((item) {
      if (item.id == cartItemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    state = state.copyWith(items: updatedItems, isLoading: true);

    final (newState, failure) = await _updateQuantity(
      cartItemId: cartItemId,
      quantity: quantity,
    );

    if (failure != null) {
      state = previousState.copyWith(error: failure.message, isLoading: false);
      return;
    }

    if (newState != null) {
      state = newState.copyWith(isLoading: false);
    }
  }

  /// Clears all items from cart.
  Future<void> clearCart() async {
    final previousState = state;

    state = const CartState(isLoading: true);

    final (newState, failure) = await _clearCart();

    if (failure != null) {
      state = previousState.copyWith(error: failure.message, isLoading: false);
      return;
    }

    if (newState != null) {
      state = newState.copyWith(isLoading: false);
    }
  }

  // MARK: - Helpers

  void clearError() {
    state = state.copyWith(error: null);
  }
}
