import 'package:freezed_annotation/freezed_annotation.dart';

part 'persisted_user_state.freezed.dart';
part 'persisted_user_state.g.dart';

@freezed
class PersistedUserState with _$PersistedUserState {
  const factory PersistedUserState({
    @Default(false) bool isAnalyticsCollectionEnabled,
  }) = _PersistedUserState;

  factory PersistedUserState.fromJson(Map<String, dynamic> json) =>
      _$PersistedUserStateFromJson(json);
}
