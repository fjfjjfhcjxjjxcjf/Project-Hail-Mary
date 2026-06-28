import 'package:dio/dio.dart';
import 'app_failure.dart';

AppFailure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const AppFailure.network(message: 'Connection timed out');
    case DioExceptionType.connectionError:
      return const AppFailure.network();
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      if (statusCode == 401 || statusCode == 403) {
        return AppFailure.server(message: 'Authentication failed', statusCode: statusCode);
      }
      if (statusCode == 429) {
        return const AppFailure.quotaExceeded();
      }
      return AppFailure.server(
        message: e.response?.statusMessage ?? 'Server error',
        statusCode: statusCode,
      );
    case DioExceptionType.cancel:
      return const AppFailure.unknown(message: 'Request cancelled');
    default:
      return AppFailure.unknown(message: e.message ?? 'Unknown network error');
  }
}
