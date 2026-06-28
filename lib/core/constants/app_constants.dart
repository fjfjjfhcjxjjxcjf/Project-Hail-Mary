class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'DocLingo';
  static const String appVersion = '2.0.0';

  // Storage keys
  static const String themeKey = 'theme_mode';
  static const String localeKey = 'locale';
  static const String apiKeyPrefix = 'api_key_';
  static const String providerPriorityKey = 'provider_priority';
  static const String translationProfileKey = 'translation_profile';
  static const String chunkSizeKey = 'chunk_size';
  static const String temperatureKey = 'temperature';

  // Defaults
  static const int defaultChunkSize = 2000;
  static const double defaultTemperature = 0.3;
  static const int maxConcurrentTranslations = 3;
  static const int maxRetryAttempts = 3;

  // Supported formats
  static const List<String> supportedDocumentFormats = [
    'pdf', 'epub', 'mobi', 'azw3', 'docx', 'doc',
    'txt', 'rtf', 'md', 'markdown', 'html', 'htm',
    'csv', 'odt',
  ];

  static const List<String> supportedImageFormats = [
    'png', 'jpg', 'jpeg', 'webp', 'bmp', 'tiff',
  ];

  static const List<String> supportedArchiveFormats = ['zip'];
}
