// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persisted_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersistedUserState _$PersistedUserStateFromJson(Map<String, dynamic> json) {
  return _PersistedUserState.fromJson(json);
}

/// @nodoc
mixin _$PersistedUserState {
  bool get isAnalyticsCollectionEnabled => throw _privateConstructorUsedError;

  /// Serializes this PersistedUserState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersistedUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersistedUserStateCopyWith<PersistedUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistedUserStateCopyWith<$Res> {
  factory $PersistedUserStateCopyWith(
          PersistedUserState value, $Res Function(PersistedUserState) then) =
      _$PersistedUserStateCopyWithImpl<$Res, PersistedUserState>;
  @useResult
  $Res call({bool isAnalyticsCollectionEnabled});
}

/// @nodoc
class _$PersistedUserStateCopyWithImpl<$Res, $Val extends PersistedUserState>
    implements $PersistedUserStateCopyWith<$Res> {
  _$PersistedUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersistedUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnalyticsCollectionEnabled = null,
  }) {
    return _then(_value.copyWith(
      isAnalyticsCollectionEnabled: null == isAnalyticsCollectionEnabled
          ? _value.isAnalyticsCollectionEnabled
          : isAnalyticsCollectionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistedUserStateImplCopyWith<$Res>
    implements $PersistedUserStateCopyWith<$Res> {
  factory _$$PersistedUserStateImplCopyWith(_$PersistedUserStateImpl value,
          $Res Function(_$PersistedUserStateImpl) then) =
      __$$PersistedUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAnalyticsCollectionEnabled});
}

/// @nodoc
class __$$PersistedUserStateImplCopyWithImpl<$Res>
    extends _$PersistedUserStateCopyWithImpl<$Res, _$PersistedUserStateImpl>
    implements _$$PersistedUserStateImplCopyWith<$Res> {
  __$$PersistedUserStateImplCopyWithImpl(_$PersistedUserStateImpl _value,
      $Res Function(_$PersistedUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersistedUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnalyticsCollectionEnabled = null,
  }) {
    return _then(_$PersistedUserStateImpl(
      isAnalyticsCollectionEnabled: null == isAnalyticsCollectionEnabled
          ? _value.isAnalyticsCollectionEnabled
          : isAnalyticsCollectionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersistedUserStateImpl implements _PersistedUserState {
  const _$PersistedUserStateImpl({this.isAnalyticsCollectionEnabled = false});

  factory _$PersistedUserStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersistedUserStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isAnalyticsCollectionEnabled;

  @override
  String toString() {
    return 'PersistedUserState(isAnalyticsCollectionEnabled: $isAnalyticsCollectionEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistedUserStateImpl &&
            (identical(other.isAnalyticsCollectionEnabled,
                    isAnalyticsCollectionEnabled) ||
                other.isAnalyticsCollectionEnabled ==
                    isAnalyticsCollectionEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isAnalyticsCollectionEnabled);

  /// Create a copy of PersistedUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersistedUserStateImplCopyWith<_$PersistedUserStateImpl> get copyWith =>
      __$$PersistedUserStateImplCopyWithImpl<_$PersistedUserStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersistedUserStateImplToJson(
      this,
    );
  }
}

abstract class _PersistedUserState implements PersistedUserState {
  const factory _PersistedUserState({final bool isAnalyticsCollectionEnabled}) =
      _$PersistedUserStateImpl;

  factory _PersistedUserState.fromJson(Map<String, dynamic> json) =
      _$PersistedUserStateImpl.fromJson;

  @override
  bool get isAnalyticsCollectionEnabled;

  /// Create a copy of PersistedUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersistedUserStateImplCopyWith<_$PersistedUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
