/// Failure classes for domain layer error handling.
/// 
/// Returned by repositories to presentation layer, avoiding
/// exception throwing for cleaner functional error handling.
library;

/// Base failure class with message.
sealed class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure([
    super.message = 'Sunucu hatası oluştu',
    this.statusCode,
  ]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'İnternet bağlantısı bulunamadı']);
}

class ParsingFailure extends Failure {
  const ParsingFailure([super.message = 'Veri işleme hatası']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Ürün bulunamadı']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Önbellek hatası']);
}

class CartFailure extends Failure {
  const CartFailure([super.message = 'Sepet işlemi başarısız']);
}

class StockFailure extends Failure {
  const StockFailure([super.message = 'Ürün stokta yok']);
}
