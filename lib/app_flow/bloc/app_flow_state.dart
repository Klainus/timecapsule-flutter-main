import 'package:as_boilerplate_flutter/app_flow/models/app_flow.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_flow_state.freezed.dart';
part 'app_flow_state.g.dart';

@freezed
abstract class AppFlowState with _$AppFlowState {
  const factory AppFlowState({
    required AppFlow flow,
  }) = _AppFlowState;

  factory AppFlowState.fromJson(Map<String, dynamic> json) =>
      _$AppFlowStateFromJson(json);
}
