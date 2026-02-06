import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

/// Product repository implementation with exception translation.
/// 
/// Converts data layer exceptions to domain layer failures to maintain
/// clean architecture boundaries (domain layer never depends on data layer).
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl({required ProductRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<(Product?, Failure?)> getProductByHandle(String handle) async {
    try {
      final productModel = await _remoteDataSource.getProductByHandle(handle);
      return (productModel.toEntity(), null);
    } on ServerException catch (e) {
      return (null, ServerFailure(e.message, e.statusCode));
    } on NetworkException catch (e) {
      return (null, NetworkFailure(e.message));
    } on NotFoundException catch (e) {
      return (null, NotFoundFailure(e.message));
    } on ParsingException catch (e) {
      return (null, ParsingFailure(e.message));
    } catch (e) {
      return (null, ServerFailure('Beklenmeyen hata: ${e.toString()}'));
    }
  }

  @override
  Future<(List<Product>?, Failure?)> getProducts({
    int first = 10,
    String? after,
  }) async {
    // Not implemented for this case study
    // Would follow similar pattern to getProductByHandle
    return (null, const ServerFailure('Not implemented'));
  }
}
