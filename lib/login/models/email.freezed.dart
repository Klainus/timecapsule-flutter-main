// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Email {
  EmailValidator get validator => throw _privateConstructorUsedError;
  EmailErrorTranslator get translator => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailCopyWith<Email> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailCopyWith<$Res> {
  factory $EmailCopyWith(Email value, $Res Function(Email) then) =
      _$EmailCopyWithImpl<$Res, Email>;
  @useResult
  $Res call(
      {EmailValidator validator,
      EmailErrorTranslator translator,
      String value});
}

/// @nodoc
class _$EmailCopyWithImpl<$Res, $Val extends Email>
    implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validator = null,
    Object? translator = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as EmailValidator,
      translator: null == translator
          ? _value.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as EmailErrorTranslator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailImplCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$$EmailImplCopyWith(
          _$EmailImpl value, $Res Function(_$EmailImpl) then) =
      __$$EmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailValidator validator,
      EmailErrorTranslator translator,
      String value});
}

/// @nodoc
class __$$EmailImplCopyWithImpl<$Res>
    extends _$EmailCopyWithImpl<$Res, _$EmailImpl>
    implements _$$EmailImplCopyWith<$Res> {
  __$$EmailImplCopyWithImpl(
      _$EmailImpl _value, $Res Function(_$EmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validator = null,
    Object? translator = null,
    Object? value = null,
  }) {
    return _then(_$EmailImpl(
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as EmailValidator,
      translator: null == translator
          ? _value.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as EmailErrorTranslator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailImpl extends _Email {
  const _$EmailImpl(
      {required this.validator, required this.translator, required this.value})
      : super._();

  @override
  final EmailValidator validator;
  @override
  final EmailErrorTranslator translator;
  @override
  final String value;

  @override
  String toString() {
    return 'Email(validator: $validator, translator: $translator, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailImpl &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.translator, translator) ||
                other.translator == translator) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validator, translator, value);

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailImplCopyWith<_$EmailImpl> get copyWith =>
      __$$EmailImplCopyWithImpl<_$EmailImpl>(this, _$identity);
}

abstract class _Email extends Email {
  const factory _Email(
      {required final EmailValidator validator,
      required final EmailErrorTranslator translator,
      required final String value}) = _$EmailImpl;
  const _Email._() : super._();

  @override
  EmailValidator get validator;
  @override
  EmailErrorTranslator get translator;
  @override
  String get value;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailImplCopyWith<_$EmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
