import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:logger/logger.dart';

class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  ApiClient({String? baseUrl, Map<String, String>? defaultHeaders})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? '',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(minutes: 5),
          headers: {
            'Content-Type': 'application/json',
            if (defaultHeaders != null) ...defaultHeaders,
          },
        )) {
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: false, responseBody: false, logPrint: _logger.d),
      RetryInterceptor(
        dio: _dio,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 3),
          Duration(seconds: 5),
        ],
      ),
    ]);
  }

  Dio get dio => _dio;

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParams, CancelToken? cancelToken}) {
    return _dio.get<T>(path, queryParameters: queryParams, cancelToken: cancelToken);
  }

  Future<Response<T>> post<T>(String path, {dynamic data, CancelToken? cancelToken}) {
    return _dio.post<T>(path, data: data, cancelToken: cancelToken);
  }

  void dispose() {
    _dio.close();
  }
}
