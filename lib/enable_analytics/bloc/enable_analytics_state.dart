import 'package:freezed_annotation/freezed_annotation.dart';

part 'enable_analytics_state.freezed.dart';

enum EnableAnalyticsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
}

@freezed
abstract class EnableAnalyticsState with _$EnableAnalyticsState {
  const factory EnableAnalyticsState({
    @Default(EnableAnalyticsStatus.initial) EnableAnalyticsStatus status,
  }) = _EnableAnalyticsState;
}
