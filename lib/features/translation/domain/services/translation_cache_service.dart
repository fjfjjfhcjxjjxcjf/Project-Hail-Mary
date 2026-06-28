import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../entities/translation_cache.dart';

/// Smart Cache - avoids re-translating identical text.
/// Uses content hashing for fast lookups.
class TranslationCacheService {
  final LocalStorageService _storage;
  final Map<String, CacheEntry> _memoryCache = {};

  TranslationCacheService(this._storage);

  /// Generate a cache key from translation parameters.
  String _buildKey({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    String profileId = '',
    String modelId = '',
  }) {
    final content = '$sourceLanguage|$targetLanguage|$profileId|$modelId|$text';
    return sha256.convert(utf8.encode(content)).toString();
  }

  /// Look up a cached translation.
  CacheEntry? lookup({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    String profileId = '',
    String modelId = '',
  }) {
    final key = _buildKey(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profileId: profileId,
      modelId: modelId,
    );

    // Check memory cache first
    if (_memoryCache.containsKey(key)) {
      final entry = _memoryCache[key]!;
      _memoryCache[key] = entry.copyWith(
        hitCount: entry.hitCount + 1,
        lastUsedAt: DateTime.now(),
      );
      return _memoryCache[key];
    }

    return null;
  }

  /// Store a translation in cache.
  Future<void> store({
    required String sourceText,
    required String translatedText,
    required String sourceLanguage,
    required String targetLanguage,
    String profileId = '',
    String providerId = '',
    String modelId = '',
  }) async {
    final key = _buildKey(
      text: sourceText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profileId: profileId,
      modelId: modelId,
    );

    final entry = CacheEntry(
      id: key,
      sourceHash: key,
      sourceText: sourceText,
      translatedText: translatedText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profileId: profileId,
      providerId: providerId,
      modelId: modelId,
      hitCount: 0,
      createdAt: DateTime.now(),
      lastUsedAt: DateTime.now(),
    );

    _memoryCache[key] = entry;
  }

  /// Get cache statistics.
  CacheStats getStats() {
    final entries = _memoryCache.values;
    final totalHits = entries.fold<int>(0, (sum, e) => sum + e.hitCount);
    return CacheStats(
      entryCount: entries.length,
      totalHits: totalHits,
    );
  }

  /// Clear the cache.
  void clear() {
    _memoryCache.clear();
  }
}

class CacheStats {
  final int entryCount;
  final int totalHits;

  const CacheStats({required this.entryCount, required this.totalHits});
}
