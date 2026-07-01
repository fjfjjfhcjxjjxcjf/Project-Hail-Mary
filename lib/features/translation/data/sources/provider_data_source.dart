import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/ai_provider.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/network/api_client.dart';

abstract class ProviderDataSource {
  Future<List<String>> fetchModels(AiProvider provider);
  Future<bool> validateApiKey(AiProvider provider);
}

class ProviderDataSourceImpl implements ProviderDataSource {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  Future<List<String>> fetchModels(AiProvider provider) async {
    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) {
        client.setAuthToken(provider.apiKey);
      }

      String endpoint;
      switch (provider.type) {
        case ProviderType.gemini:
          endpoint = '/v1beta/models';
          break;
        case ProviderType.googleAI:
          endpoint = '/models';
          break;
        case ProviderType.ollama:
        case ProviderType.lmStudio:
          endpoint = '/api/tags';
          break;
        default:
          // OpenAI, OpenRouter, NaraRouter, DeepSeek, Custom, etc.
          endpoint = '/models';
      }

      final response = await client.get<Map<String, dynamic>>(endpoint);
      final data = response.data;
      if (data == null) return [];

      // Parse models based on provider type
      if (provider.type == ProviderType.ollama || provider.type == ProviderType.lmStudio) {
        final models = data['models'] as List? ?? [];
        return models.map((m) => m['name'] as String).toList();
      }

      if (provider.type == ProviderType.gemini) {
        final models = data['models'] as List? ?? [];
        return models.map((m) => (m['name'] as String).replaceAll('models/', '')).toList();
      }

      // OpenAI-compatible
      final models = data['data'] as List? ?? [];
      return models.map((m) => m['id'] as String).toList();
    } on DioException catch (e) {
      _logger.e('Fetch models error: ${e.message}');
      throw mapDioException(e);
    } finally {
      client.dispose();
    }
  }

  @override
  Future<bool> validateApiKey(AiProvider provider) async {
    try {
      await fetchModels(provider);
      return true;
    } catch (_) {
      return false;
    }
  }
}
