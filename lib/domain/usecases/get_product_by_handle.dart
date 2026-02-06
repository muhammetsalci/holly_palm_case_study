import '../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

/// Fetches product by Shopify handle with validation.
/// 
/// Returns tuple (Product?, Failure?) to support functional error handling
/// pattern used throughout domain layer.
class GetProductByHandle {
  final ProductRepository _repository;

  GetProductByHandle(this._repository);

  Future<(Product?, Failure?)> call(String handle) async {
    if (handle.isEmpty) {
      return (null, const NotFoundFailure('Ürün handle\'ı boş olamaz'));
    }

    return _repository.getProductByHandle(handle);
  }
}
