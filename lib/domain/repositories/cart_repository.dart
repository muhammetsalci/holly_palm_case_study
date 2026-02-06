import '../entities/cart_item.dart';
import '../entities/variant.dart';
import '../../core/error/failures.dart';

/// Cart repository contract for local cart operations.
/// 
/// Local implementation chosen over Shopify Cart API to support
/// optimistic UI pattern (immediate updates without API latency).
abstract class CartRepository {
  Future<(CartState?, Failure?)> addToCart({
    required Variant variant,
    required String productTitle,
    String? imageUrl,
    int quantity = 1,
  });

  Future<(CartState?, Failure?)> removeFromCart(String cartItemId);

  Future<(CartState?, Failure?)> updateQuantity({
    required String cartItemId,
    required int quantity,
  });

  Future<(CartState?, Failure?)> clearCart();

  CartState getCartState();
}
