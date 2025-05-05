// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enable_analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EnableAnalyticsState {
  EnableAnalyticsStatus get status;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnableAnalyticsStateCopyWith<EnableAnalyticsState> get copyWith =>
      _$EnableAnalyticsStateCopyWithImpl<EnableAnalyticsState>(
          this as EnableAnalyticsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnableAnalyticsState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'EnableAnalyticsState(status: $status)';
  }
}

/// @nodoc
abstract mixin class $EnableAnalyticsStateCopyWith<$Res> {
  factory $EnableAnalyticsStateCopyWith(EnableAnalyticsState value,
          $Res Function(EnableAnalyticsState) _then) =
      _$EnableAnalyticsStateCopyWithImpl;
  @useResult
  $Res call({EnableAnalyticsStatus status});
}

/// @nodoc
class _$EnableAnalyticsStateCopyWithImpl<$Res>
    implements $EnableAnalyticsStateCopyWith<$Res> {
  _$EnableAnalyticsStateCopyWithImpl(this._self, this._then);

  final EnableAnalyticsState _self;
  final $Res Function(EnableAnalyticsState) _then;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnableAnalyticsStatus,
    ));
  }
}

/// @nodoc

class _EnableAnalyticsState implements EnableAnalyticsState {
  const _EnableAnalyticsState({this.status = EnableAnalyticsStatus.initial});

  @override
  @JsonKey()
  final EnableAnalyticsStatus status;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnableAnalyticsStateCopyWith<_EnableAnalyticsState> get copyWith =>
      __$EnableAnalyticsStateCopyWithImpl<_EnableAnalyticsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnableAnalyticsState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'EnableAnalyticsState(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$EnableAnalyticsStateCopyWith<$Res>
    implements $EnableAnalyticsStateCopyWith<$Res> {
  factory _$EnableAnalyticsStateCopyWith(_EnableAnalyticsState value,
          $Res Function(_EnableAnalyticsState) _then) =
      __$EnableAnalyticsStateCopyWithImpl;
  @override
  @useResult
  $Res call({EnableAnalyticsStatus status});
}

/// @nodoc
class __$EnableAnalyticsStateCopyWithImpl<$Res>
    implements _$EnableAnalyticsStateCopyWith<$Res> {
  __$EnableAnalyticsStateCopyWithImpl(this._self, this._then);

  final _EnableAnalyticsState _self;
  final $Res Function(_EnableAnalyticsState) _then;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_EnableAnalyticsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnableAnalyticsStatus,
    ));
  }
}

// dart format on
