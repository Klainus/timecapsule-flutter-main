// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppFlowState _$AppFlowStateFromJson(Map<String, dynamic> json) {
  return _AppFlowState.fromJson(json);
}

/// @nodoc
mixin _$AppFlowState {
  AppFlow get flow => throw _privateConstructorUsedError;

  /// Serializes this AppFlowState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppFlowStateCopyWith<AppFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFlowStateCopyWith<$Res> {
  factory $AppFlowStateCopyWith(
          AppFlowState value, $Res Function(AppFlowState) then) =
      _$AppFlowStateCopyWithImpl<$Res, AppFlowState>;
  @useResult
  $Res call({AppFlow flow});

  $AppFlowCopyWith<$Res> get flow;
}

/// @nodoc
class _$AppFlowStateCopyWithImpl<$Res, $Val extends AppFlowState>
    implements $AppFlowStateCopyWith<$Res> {
  _$AppFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flow = null,
  }) {
    return _then(_value.copyWith(
      flow: null == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as AppFlow,
    ) as $Val);
  }

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFlowCopyWith<$Res> get flow {
    return $AppFlowCopyWith<$Res>(_value.flow, (value) {
      return _then(_value.copyWith(flow: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppFlowStateImplCopyWith<$Res>
    implements $AppFlowStateCopyWith<$Res> {
  factory _$$AppFlowStateImplCopyWith(
          _$AppFlowStateImpl value, $Res Function(_$AppFlowStateImpl) then) =
      __$$AppFlowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppFlow flow});

  @override
  $AppFlowCopyWith<$Res> get flow;
}

/// @nodoc
class __$$AppFlowStateImplCopyWithImpl<$Res>
    extends _$AppFlowStateCopyWithImpl<$Res, _$AppFlowStateImpl>
    implements _$$AppFlowStateImplCopyWith<$Res> {
  __$$AppFlowStateImplCopyWithImpl(
      _$AppFlowStateImpl _value, $Res Function(_$AppFlowStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flow = null,
  }) {
    return _then(_$AppFlowStateImpl(
      flow: null == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as AppFlow,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppFlowStateImpl implements _AppFlowState {
  const _$AppFlowStateImpl({required this.flow});

  factory _$AppFlowStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppFlowStateImplFromJson(json);

  @override
  final AppFlow flow;

  @override
  String toString() {
    return 'AppFlowState(flow: $flow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFlowStateImpl &&
            (identical(other.flow, flow) || other.flow == flow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, flow);

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppFlowStateImplCopyWith<_$AppFlowStateImpl> get copyWith =>
      __$$AppFlowStateImplCopyWithImpl<_$AppFlowStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppFlowStateImplToJson(
      this,
    );
  }
}

abstract class _AppFlowState implements AppFlowState {
  const factory _AppFlowState({required final AppFlow flow}) =
      _$AppFlowStateImpl;

  factory _AppFlowState.fromJson(Map<String, dynamic> json) =
      _$AppFlowStateImpl.fromJson;

  @override
  AppFlow get flow;

  /// Create a copy of AppFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppFlowStateImplCopyWith<_$AppFlowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
