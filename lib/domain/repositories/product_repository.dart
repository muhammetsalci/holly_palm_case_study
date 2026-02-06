import '../entities/product.dart';
import '../../core/error/failures.dart';

/// Product repository contract defining data operations.
/// 
/// Returns tuple (Data?, Failure?) to support functional error handling
/// without throwing exceptions (cleaner than try-catch in UI layer).
abstract class ProductRepository {
  Future<(Product?, Failure?)> getProductByHandle(String handle);

  Future<(List<Product>?, Failure?)> getProducts({
    int first = 10,
    String? after,
  });
}
