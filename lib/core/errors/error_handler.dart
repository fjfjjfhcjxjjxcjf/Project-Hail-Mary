import 'package:dio/dio.dart';
import 'app_failure.dart';
import '../debug/debug_log.dart';

AppFailure mapDioException(DioException e) {
  dlog('ERR', 'mapDioException: type=${e.type.name}, statusCode=${e.response?.statusCode}');

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      dlog('ERR', '  -> Network timeout');
      return const AppFailure.network(message: 'Connection timed out');
    case DioExceptionType.connectionError:
      dlog('ERR', '  -> Connection error');
      return const AppFailure.network();
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      if (statusCode == 401 || statusCode == 403) {
        dlog('ERR', '  -> Auth failed ($statusCode)');
        return AppFailure.server(message: 'Authentication failed', statusCode: statusCode);
      }
      if (statusCode == 429) {
        dlog('ERR', '  -> Quota exceeded');
        return const AppFailure.quotaExceeded();
      }
      dlog('ERR', '  -> Server error ($statusCode)');
      return AppFailure.server(
        message: e.response?.statusMessage ?? 'Server error',
        statusCode: statusCode,
      );
    case DioExceptionType.cancel:
      dlog('ERR', '  -> Cancelled');
      return const AppFailure.unknown(message: 'Request cancelled');
    default:
      dlog('ERR', '  -> Unknown: ${e.message}');
      return AppFailure.unknown(message: e.message ?? 'Unknown network error');
  }
}
