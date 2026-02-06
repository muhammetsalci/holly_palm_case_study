import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/api_constants.dart';
import '../../core/error/failures.dart';
import '../../data/datasources/product_remote_datasource.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_product_by_handle.dart';

part 'product_provider.g.dart';

/// Product state patterns for UI rendering.
sealed class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final Product product;
  const ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final Failure failure;
  const ProductError(this.failure);
}

/// Product provider managing API fetch and state transitions.
/// 
/// Auto-fetches product on initialization to reduce boilerplate
/// in consuming widgets (no manual fetch calls needed).
@riverpod
class ProductNotifier extends _$ProductNotifier {
  late final GetProductByHandle _getProductByHandle;

  @override
  ProductState build() {
    final dataSource = ProductRemoteDataSourceImpl();
    final repository = ProductRepositoryImpl(remoteDataSource: dataSource);
    _getProductByHandle = GetProductByHandle(repository);

    _fetchProduct();

    return const ProductLoading();
  }

  Future<void> _fetchProduct() async {
    state = const ProductLoading();

    final (product, failure) = await _getProductByHandle(
      ApiConstants.productHandle,
    );

    if (failure != null) {
      state = ProductError(failure);
    } else if (product != null) {
      state = ProductLoaded(product);
    } else {
      state = const ProductError(NotFoundFailure('Ürün bulunamadı'));
    }
  }

  Future<void> retry() async {
    await _fetchProduct();
  }
}
