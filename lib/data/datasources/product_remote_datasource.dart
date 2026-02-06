import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../models/product_model.dart';
import 'graphql_queries.dart';

/// Product remote data source contract.
abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductByHandle(String handle);
}

/// GraphQL-based product data source with error translation.
/// 
/// Translates GraphQL errors to application-specific exceptions
/// for consistent error handling across data layer.
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<ProductModel> getProductByHandle(String handle) async {
    try {
      final result = await GraphQLClientProvider.query(
        GraphQLQueries.getProductByHandle,
        variables: {'handle': handle},
      );

      if (result.hasException) {
        final errorMessage =
            result.exception?.graphqlErrors.firstOrNull?.message ??
            result.exception?.linkException?.toString() ??
            'Unknown GraphQL error';
        throw ServerException(errorMessage);
      }

      final data = result.data;
      if (data == null || data['product'] == null) {
        throw const NotFoundException('Ürün bulunamadı');
      }

      return ProductModel.fromGraphQL(data);
    } on AppException {
      rethrow;
    } catch (e) {
      throw ServerException('API isteği başarısız: ${e.toString()}');
    }
  }
}
