/// Application exceptions thrown by data sources.
/// 
/// Caught and translated to Failures by repositories to maintain
/// clean architecture separation between data and domain layers.
library;

/// Base exception class.
sealed class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// Exception thrown when a server/API error occurs
class ServerException extends AppException {
  final int? statusCode;

  const ServerException(super.message, {super.code, this.statusCode});

  @override
  String toString() =>
      'ServerException: $message (statusCode: $statusCode, code: $code)';
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Network connection failed']);

  @override
  String toString() => 'NetworkException: $message';
}

class ParsingException extends AppException {
  const ParsingException([super.message = 'Failed to parse data']);

  @override
  String toString() => 'ParsingException: $message';
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resource not found']);

  @override
  String toString() => 'NotFoundException: $message';
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache operation failed']);

  @override
  String toString() => 'CacheException: $message';
}
