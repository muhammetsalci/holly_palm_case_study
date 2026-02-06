import '../../core/error/failures.dart';
import '../entities/cart_item.dart';
import '../entities/variant.dart';
import '../repositories/cart_repository.dart';

/// Adds product variant to cart with stock validation.
/// 
/// Validates availability and quantity before delegating to repository
/// to prevent optimistic UI from attempting impossible operations.
class AddToCart {
  final CartRepository _repository;

  AddToCart(this._repository);

  Future<(CartState?, Failure?)> call({
    required Variant variant,
    required String productTitle,
    String? imageUrl,
    int quantity = 1,
  }) async {
    if (!variant.availableForSale) {
      return (null, StockFailure('${variant.title} stokta bulunmamaktadır'));
    }

    if (quantity <= 0) {
      return (null, const CartFailure('Miktar en az 1 olmalıdır'));
    }

    if (variant.quantityAvailable != null &&
        variant.quantityAvailable! < quantity) {
      return (
        null,
        StockFailure('Yeterli stok yok. Mevcut: ${variant.quantityAvailable}'),
      );
    }

    return _repository.addToCart(
      variant: variant,
      productTitle: productTitle,
      imageUrl: imageUrl,
      quantity: quantity,
    );
  }
}

class RemoveFromCart {
  final CartRepository _repository;

  RemoveFromCart(this._repository);

  Future<(CartState?, Failure?)> call(String cartItemId) async {
    if (cartItemId.isEmpty) {
      return (null, const CartFailure('Geçersiz sepet öğesi'));
    }

    return _repository.removeFromCart(cartItemId);
  }
}

class UpdateCartQuantity {
  final CartRepository _repository;

  UpdateCartQuantity(this._repository);

  Future<(CartState?, Failure?)> call({
    required String cartItemId,
    required int quantity,
  }) async {
    if (cartItemId.isEmpty) {
      return (null, const CartFailure('Geçersiz sepet öğesi'));
    }

    return _repository.updateQuantity(
      cartItemId: cartItemId,
      quantity: quantity,
    );
  }
}

class ClearCart {
  final CartRepository _repository;

  ClearCart(this._repository);

  Future<(CartState?, Failure?)> call() async {
    return _repository.clearCart();
  }
}
