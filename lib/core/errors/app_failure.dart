import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const factory AppFailure.server({required String message, int? statusCode}) = ServerFailure;
  const factory AppFailure.network({String message = 'No internet connection'}) = NetworkFailure;
  const factory AppFailure.cache({String message = 'Cache error'}) = CacheFailure;
  const factory AppFailure.parsing({required String message}) = ParsingFailure;
  const factory AppFailure.fileNotFound({required String path}) = FileNotFoundFailure;
  const factory AppFailure.unsupportedFormat({required String format}) = UnsupportedFormatFailure;
  const factory AppFailure.apiKeyMissing({required String provider}) = ApiKeyMissingFailure;
  const factory AppFailure.quotaExceeded({String message = 'API quota exceeded'}) = QuotaExceededFailure;
  const factory AppFailure.translation({required String message}) = TranslationFailure;
  const factory AppFailure.unknown({String message = 'An unexpected error occurred'}) = UnknownFailure;
}
