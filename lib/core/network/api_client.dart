import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:logger/logger.dart';
import '../debug/debug_log.dart';

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
      _DebugInterceptor(),
      LogInterceptor(requestBody: false, responseBody: false, logPrint: _logger.d),
      RetryInterceptor(
        dio: _dio,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 3),
          Duration(seconds: 5),
        ],
        logPrint: (msg) {
          dlog('RETRY', msg);
          _logger.d(msg);
        },
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

/// Interceptor that logs every request/response/error to DebugLog
/// so the developer can see exactly what happens on a real device.
class _DebugInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uri = '${options.baseUrl}${options.path}';
    dlog('HTTP', '>>> ${options.method} $uri');

    // Log request body (redacting the API key)
    final sanitizedHeaders = Map<String, dynamic>.from(options.headers);
    if (sanitizedHeaders.containsKey('Authorization')) {
      sanitizedHeaders['Authorization'] = 'Bearer [REDACTED]';
    }
    dlog('HTTP', '    headers: $sanitizedHeaders');

    if (options.data is Map) {
      final body = Map<String, dynamic>.from(options.data as Map);
      // Redact messages to avoid huge log, but show structure
      if (body.containsKey('messages')) {
        final msgs = body['messages'] as List;
        body['messages'] = '${msgs.length} message(s)';
      }
      if (body.containsKey('system')) {
        body['system'] = '${(body['system'] as String).length} chars';
      }
      dlog('HTTP', '    body: $body');
    } else {
      dlog('HTTP', '    body: ${options.data?.runtimeType}');
    }

    dlog('HTTP', '    cancelToken: ${options.cancelToken != null ? "attached" : "NONE"}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final uri = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    dlog('HTTP', '<<< ${response.statusCode} $uri');
    if (response.data is Map) {
      final data = response.data as Map;
      // Log response keys and truncated content
      dlog('HTTP', '    keys: ${data.keys.toList()}');
      if (data.containsKey('choices')) {
        final choices = data['choices'] as List;
        dlog('HTTP', '    choices: ${choices.length}');
        if (choices.isNotEmpty) {
          final msg = choices[0]['message'];
          if (msg is Map) {
            final content = msg['content'] as String? ?? '';
            dlog('HTTP', '    content (${content.length} chars): "${content.length > 200 ? content.substring(0, 200) : content}"');
          }
        }
      }
      if (data.containsKey('error')) {
        dlog('HTTP', '    ERROR: ${data['error']}');
      }
    } else {
      dlog('HTTP', '    data: ${response.data?.runtimeType} (${response.data.toString().length} chars)');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final uri = '${err.requestOptions.baseUrl}${err.requestOptions.path}';
    dlog('HTTP', '!!! ERROR ${err.type.name} $uri');
    dlog('HTTP', '    message: ${err.message}');
    dlog('HTTP', '    statusCode: ${err.response?.statusCode}');
    if (err.response?.data != null) {
      final respData = err.response!.data.toString();
      dlog('HTTP', '    response: ${respData.length > 500 ? respData.substring(0, 500) : respData}');
    }
    dlog('HTTP', '    error: ${err.error}');
    super.onError(err, handler);
  }
}
