// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Email {
  EmailValidator get validator;
  EmailErrorTranslator get translator;
  String get value;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmailCopyWith<Email> get copyWith =>
      _$EmailCopyWithImpl<Email>(this as Email, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Email &&
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
    return 'Email(validator: $validator, translator: $translator, value: $value)';
  }
}

/// @nodoc
abstract mixin class $EmailCopyWith<$Res> {
  factory $EmailCopyWith(Email value, $Res Function(Email) _then) =
      _$EmailCopyWithImpl;
  @useResult
  $Res call(
      {EmailValidator validator,
      EmailErrorTranslator translator,
      String value});
}

/// @nodoc
class _$EmailCopyWithImpl<$Res> implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._self, this._then);

  final Email _self;
  final $Res Function(Email) _then;

  /// Create a copy of Email
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
              as EmailValidator,
      translator: null == translator
          ? _self.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as EmailErrorTranslator,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Email extends Email {
  const _Email(
      {required this.validator, required this.translator, required this.value})
      : super._();

  @override
  final EmailValidator validator;
  @override
  final EmailErrorTranslator translator;
  @override
  final String value;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmailCopyWith<_Email> get copyWith =>
      __$EmailCopyWithImpl<_Email>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Email &&
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
    return 'Email(validator: $validator, translator: $translator, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$EmailCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$EmailCopyWith(_Email value, $Res Function(_Email) _then) =
      __$EmailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {EmailValidator validator,
      EmailErrorTranslator translator,
      String value});
}

/// @nodoc
class __$EmailCopyWithImpl<$Res> implements _$EmailCopyWith<$Res> {
  __$EmailCopyWithImpl(this._self, this._then);

  final _Email _self;
  final $Res Function(_Email) _then;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? validator = null,
    Object? translator = null,
    Object? value = null,
  }) {
    return _then(_Email(
      validator: null == validator
          ? _self.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as EmailValidator,
      translator: null == translator
          ? _self.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as EmailErrorTranslator,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
