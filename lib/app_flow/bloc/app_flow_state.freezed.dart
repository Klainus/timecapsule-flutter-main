// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFlowState {
  AppFlow get flow;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFlowStateCopyWith<AppFlowState> get copyWith =>
      _$AppFlowStateCopyWithImpl<AppFlowState>(
          this as AppFlowState, _$identity);

  /// Serializes this AppFlowState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFlowState &&
            (identical(other.flow, flow) || other.flow == flow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, flow);

  @override
  String toString() {
    return 'AppFlowState(flow: $flow)';
  }
}

/// @nodoc
abstract mixin class $AppFlowStateCopyWith<$Res> {
  factory $AppFlowStateCopyWith(
          AppFlowState value, $Res Function(AppFlowState) _then) =
      _$AppFlowStateCopyWithImpl;
  @useResult
  $Res call({AppFlow flow});

  $AppFlowCopyWith<$Res> get flow;
}

/// @nodoc
class _$AppFlowStateCopyWithImpl<$Res> implements $AppFlowStateCopyWith<$Res> {
  _$AppFlowStateCopyWithImpl(this._self, this._then);

  final AppFlowState _self;
  final $Res Function(AppFlowState) _then;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flow = null,
  }) {
    return _then(_self.copyWith(
      flow: null == flow
          ? _self.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as AppFlow,
    ));
  }

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFlowCopyWith<$Res> get flow {
    return $AppFlowCopyWith<$Res>(_self.flow, (value) {
      return _then(_self.copyWith(flow: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AppFlowState implements AppFlowState {
  const _AppFlowState({required this.flow});
  factory _AppFlowState.fromJson(Map<String, dynamic> json) =>
      _$AppFlowStateFromJson(json);

  @override
  final AppFlow flow;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFlowStateCopyWith<_AppFlowState> get copyWith =>
      __$AppFlowStateCopyWithImpl<_AppFlowState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppFlowStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFlowState &&
            (identical(other.flow, flow) || other.flow == flow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, flow);

  @override
  String toString() {
    return 'AppFlowState(flow: $flow)';
  }
}

/// @nodoc
abstract mixin class _$AppFlowStateCopyWith<$Res>
    implements $AppFlowStateCopyWith<$Res> {
  factory _$AppFlowStateCopyWith(
          _AppFlowState value, $Res Function(_AppFlowState) _then) =
      __$AppFlowStateCopyWithImpl;
  @override
  @useResult
  $Res call({AppFlow flow});

  @override
  $AppFlowCopyWith<$Res> get flow;
}

/// @nodoc
class __$AppFlowStateCopyWithImpl<$Res>
    implements _$AppFlowStateCopyWith<$Res> {
  __$AppFlowStateCopyWithImpl(this._self, this._then);

  final _AppFlowState _self;
  final $Res Function(_AppFlowState) _then;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? flow = null,
  }) {
    return _then(_AppFlowState(
      flow: null == flow
          ? _self.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as AppFlow,
    ));
  }

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFlowCopyWith<$Res> get flow {
    return $AppFlowCopyWith<$Res>(_self.flow, (value) {
      return _then(_self.copyWith(flow: value));
    });
  }
}

// dart format on
