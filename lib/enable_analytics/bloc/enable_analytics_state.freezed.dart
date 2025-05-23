// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enable_analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnableAnalyticsState {
  EnableAnalyticsStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnableAnalyticsStateCopyWith<EnableAnalyticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnableAnalyticsStateCopyWith<$Res> {
  factory $EnableAnalyticsStateCopyWith(EnableAnalyticsState value,
          $Res Function(EnableAnalyticsState) then) =
      _$EnableAnalyticsStateCopyWithImpl<$Res, EnableAnalyticsState>;
  @useResult
  $Res call({EnableAnalyticsStatus status});
}

/// @nodoc
class _$EnableAnalyticsStateCopyWithImpl<$Res,
        $Val extends EnableAnalyticsState>
    implements $EnableAnalyticsStateCopyWith<$Res> {
  _$EnableAnalyticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnableAnalyticsStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnableAnalyticsStateImplCopyWith<$Res>
    implements $EnableAnalyticsStateCopyWith<$Res> {
  factory _$$EnableAnalyticsStateImplCopyWith(_$EnableAnalyticsStateImpl value,
          $Res Function(_$EnableAnalyticsStateImpl) then) =
      __$$EnableAnalyticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EnableAnalyticsStatus status});
}

/// @nodoc
class __$$EnableAnalyticsStateImplCopyWithImpl<$Res>
    extends _$EnableAnalyticsStateCopyWithImpl<$Res, _$EnableAnalyticsStateImpl>
    implements _$$EnableAnalyticsStateImplCopyWith<$Res> {
  __$$EnableAnalyticsStateImplCopyWithImpl(_$EnableAnalyticsStateImpl _value,
      $Res Function(_$EnableAnalyticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$EnableAnalyticsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnableAnalyticsStatus,
    ));
  }
}

/// @nodoc

class _$EnableAnalyticsStateImpl implements _EnableAnalyticsState {
  const _$EnableAnalyticsStateImpl(
      {this.status = EnableAnalyticsStatus.initial});

  @override
  @JsonKey()
  final EnableAnalyticsStatus status;

  @override
  String toString() {
    return 'EnableAnalyticsState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnableAnalyticsStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnableAnalyticsStateImplCopyWith<_$EnableAnalyticsStateImpl>
      get copyWith =>
          __$$EnableAnalyticsStateImplCopyWithImpl<_$EnableAnalyticsStateImpl>(
              this, _$identity);
}

abstract class _EnableAnalyticsState implements EnableAnalyticsState {
  const factory _EnableAnalyticsState({final EnableAnalyticsStatus status}) =
      _$EnableAnalyticsStateImpl;

  @override
  EnableAnalyticsStatus get status;

  /// Create a copy of EnableAnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnableAnalyticsStateImplCopyWith<_$EnableAnalyticsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
