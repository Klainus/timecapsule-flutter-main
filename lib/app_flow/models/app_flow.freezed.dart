// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFlow {
  bool get isLoggedIn;
  bool get isEnableAnalyticsCompleted;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFlowCopyWith<AppFlow> get copyWith =>
      _$AppFlowCopyWithImpl<AppFlow>(this as AppFlow, _$identity);

  /// Serializes this AppFlow to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFlow &&
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

  @override
  String toString() {
    return 'AppFlow(isLoggedIn: $isLoggedIn, isEnableAnalyticsCompleted: $isEnableAnalyticsCompleted)';
  }
}

/// @nodoc
abstract mixin class $AppFlowCopyWith<$Res> {
  factory $AppFlowCopyWith(AppFlow value, $Res Function(AppFlow) _then) =
      _$AppFlowCopyWithImpl;
  @useResult
  $Res call({bool isLoggedIn, bool isEnableAnalyticsCompleted});
}

/// @nodoc
class _$AppFlowCopyWithImpl<$Res> implements $AppFlowCopyWith<$Res> {
  _$AppFlowCopyWithImpl(this._self, this._then);

  final AppFlow _self;
  final $Res Function(AppFlow) _then;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isEnableAnalyticsCompleted = null,
  }) {
    return _then(_self.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableAnalyticsCompleted: null == isEnableAnalyticsCompleted
          ? _self.isEnableAnalyticsCompleted
          : isEnableAnalyticsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppFlow extends AppFlow {
  const _AppFlow(
      {this.isLoggedIn = false, this.isEnableAnalyticsCompleted = false})
      : super._();
  factory _AppFlow.fromJson(Map<String, dynamic> json) =>
      _$AppFlowFromJson(json);

  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  @JsonKey()
  final bool isEnableAnalyticsCompleted;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFlowCopyWith<_AppFlow> get copyWith =>
      __$AppFlowCopyWithImpl<_AppFlow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppFlowToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFlow &&
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

  @override
  String toString() {
    return 'AppFlow(isLoggedIn: $isLoggedIn, isEnableAnalyticsCompleted: $isEnableAnalyticsCompleted)';
  }
}

/// @nodoc
abstract mixin class _$AppFlowCopyWith<$Res> implements $AppFlowCopyWith<$Res> {
  factory _$AppFlowCopyWith(_AppFlow value, $Res Function(_AppFlow) _then) =
      __$AppFlowCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoggedIn, bool isEnableAnalyticsCompleted});
}

/// @nodoc
class __$AppFlowCopyWithImpl<$Res> implements _$AppFlowCopyWith<$Res> {
  __$AppFlowCopyWithImpl(this._self, this._then);

  final _AppFlow _self;
  final $Res Function(_AppFlow) _then;

  /// Create a copy of AppFlow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoggedIn = null,
    Object? isEnableAnalyticsCompleted = null,
  }) {
    return _then(_AppFlow(
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnableAnalyticsCompleted: null == isEnableAnalyticsCompleted
          ? _self.isEnableAnalyticsCompleted
          : isEnableAnalyticsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
