import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error_model.freezed.dart';

/// App error model for error handling
@freezed
class AppErrorModel with _$AppErrorModel {
  /// Not found error (404 Status code)
  const factory AppErrorModel.notFound() = _AppErrorNotFoundModel;

  /// Not found error (500> Status code)
  const factory AppErrorModel.notAvailable() = _AppErrorNotAvailableModel;
}
