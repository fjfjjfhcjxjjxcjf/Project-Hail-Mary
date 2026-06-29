import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const factory AppFailure.server({required String message, int? statusCode}) = ServerFailure;
  const factory AppFailure.network({@Default('No internet connection') String message}) = NetworkFailure;
  const factory AppFailure.cache({@Default('Cache error') String message}) = CacheFailure;
  const factory AppFailure.parsing({required String message}) = ParsingFailure;
  const factory AppFailure.fileNotFound({required String path}) = FileNotFoundFailure;
  const factory AppFailure.unsupportedFormat({required String format}) = UnsupportedFormatFailure;
  const factory AppFailure.apiKeyMissing({required String provider}) = ApiKeyMissingFailure;
  const factory AppFailure.quotaExceeded({@Default('API quota exceeded') String message}) = QuotaExceededFailure;
  const factory AppFailure.translation({required String message}) = TranslationFailure;
  const factory AppFailure.unknown({@Default('An unexpected error occurred') String message}) = UnknownFailure;
}
