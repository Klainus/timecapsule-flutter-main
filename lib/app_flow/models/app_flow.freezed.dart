// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppFlow _$AppFlowFromJson(Map<String, dynamic> json) {
  return _AppFlow.fromJson(json);
}

/// @nodoc
mixin _$AppFlow {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  bool get isEnableAnalyticsCompleted => throw _privateConstructorUsedError;

  /// Serializes this AppFlow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppFlowCopyWith<AppFlow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFlowCopyWith<$Res> {
  factory $AppFlowCopyWith(AppFlow value, $Res Function(AppFlow) then) =
      _$AppFlowCopyWithImpl<$Res, AppFlow>;
  @useResult
  $Res call({bool isLoggedIn, bool isEnableAnalyticsCompleted});
}

/// @nodoc
class _$AppFlowCopyWithImpl<$Res, $Val extends AppFlow>
    implements $AppFlowCopyWith<$Res> {
  _$AppFlowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isEnableAnalyticsCompleted = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableAnalyticsCompleted: null == isEnableAnalyticsCompleted
          ? _value.isEnableAnalyticsCompleted
          : isEnableAnalyticsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppFlowImplCopyWith<$Res> implements $AppFlowCopyWith<$Res> {
  factory _$$AppFlowImplCopyWith(
          _$AppFlowImpl value, $Res Function(_$AppFlowImpl) then) =
      __$$AppFlowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn, bool isEnableAnalyticsCompleted});
}

/// @nodoc
class __$$AppFlowImplCopyWithImpl<$Res>
    extends _$AppFlowCopyWithImpl<$Res, _$AppFlowImpl>
    implements _$$AppFlowImplCopyWith<$Res> {
  __$$AppFlowImplCopyWithImpl(
      _$AppFlowImpl _value, $Res Function(_$AppFlowImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isEnableAnalyticsCompleted = null,
  }) {
    return _then(_$AppFlowImpl(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableAnalyticsCompleted: null == isEnableAnalyticsCompleted
          ? _value.isEnableAnalyticsCompleted
          : isEnableAnalyticsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppFlowImpl extends _AppFlow {
  const _$AppFlowImpl(
      {this.isLoggedIn = false, this.isEnableAnalyticsCompleted = false})
      : super._();

  factory _$AppFlowImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppFlowImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  @JsonKey()
  final bool isEnableAnalyticsCompleted;

  @override
  String toString() {
    return 'AppFlow(isLoggedIn: $isLoggedIn, isEnableAnalyticsCompleted: $isEnableAnalyticsCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFlowImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.isEnableAnalyticsCompleted,
                    isEnableAnalyticsCompleted) ||
                other.isEnableAnalyticsCompleted ==
                    isEnableAnalyticsCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoggedIn, isEnableAnalyticsCompleted);

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppFlowImplCopyWith<_$AppFlowImpl> get copyWith =>
      __$$AppFlowImplCopyWithImpl<_$AppFlowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppFlowImplToJson(
      this,
    );
  }
}

abstract class _AppFlow extends AppFlow {
  const factory _AppFlow(
      {final bool isLoggedIn,
      final bool isEnableAnalyticsCompleted}) = _$AppFlowImpl;
  const _AppFlow._() : super._();

  factory _AppFlow.fromJson(Map<String, dynamic> json) = _$AppFlowImpl.fromJson;

  @override
  bool get isLoggedIn;
  @override
  bool get isEnableAnalyticsCompleted;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppFlowImplCopyWith<_$AppFlowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
