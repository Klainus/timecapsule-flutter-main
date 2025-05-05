// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Password {
  PasswordValidator get validator;
  PasswordErrorTranslator get translator;
  String get value;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PasswordCopyWith<Password> get copyWith =>
      _$PasswordCopyWithImpl<Password>(this as Password, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Password &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.translator, translator) ||
                other.translator == translator) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validator, translator, value);

  @override
  String toString() {
    return 'Password(validator: $validator, translator: $translator, value: $value)';
  }
}

/// @nodoc
abstract mixin class $PasswordCopyWith<$Res> {
  factory $PasswordCopyWith(Password value, $Res Function(Password) _then) =
      _$PasswordCopyWithImpl;
  @useResult
  $Res call(
      {PasswordValidator validator,
      PasswordErrorTranslator translator,
      String value});
}

/// @nodoc
class _$PasswordCopyWithImpl<$Res> implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._self, this._then);

  final Password _self;
  final $Res Function(Password) _then;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validator = null,
    Object? translator = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      validator: null == validator
          ? _self.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as PasswordValidator,
      translator: null == translator
          ? _self.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as PasswordErrorTranslator,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Password extends Password {
  const _Password(
      {required this.validator, required this.translator, required this.value})
      : super._();

  @override
  final PasswordValidator validator;
  @override
  final PasswordErrorTranslator translator;
  @override
  final String value;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PasswordCopyWith<_Password> get copyWith =>
      __$PasswordCopyWithImpl<_Password>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Password &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.translator, translator) ||
                other.translator == translator) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validator, translator, value);

  @override
  String toString() {
    return 'Password(validator: $validator, translator: $translator, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$PasswordCopyWith<$Res>
    implements $PasswordCopyWith<$Res> {
  factory _$PasswordCopyWith(_Password value, $Res Function(_Password) _then) =
      __$PasswordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PasswordValidator validator,
      PasswordErrorTranslator translator,
      String value});
}

/// @nodoc
class __$PasswordCopyWithImpl<$Res> implements _$PasswordCopyWith<$Res> {
  __$PasswordCopyWithImpl(this._self, this._then);

  final _Password _self;
  final $Res Function(_Password) _then;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? validator = null,
    Object? translator = null,
    Object? value = null,
  }) {
    return _then(_Password(
      validator: null == validator
          ? _self.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as PasswordValidator,
      translator: null == translator
          ? _self.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as PasswordErrorTranslator,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
