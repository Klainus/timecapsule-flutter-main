// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Password {
  PasswordValidator get validator => throw _privateConstructorUsedError;
  PasswordErrorTranslator get translator => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordCopyWith<Password> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordCopyWith<$Res> {
  factory $PasswordCopyWith(Password value, $Res Function(Password) then) =
      _$PasswordCopyWithImpl<$Res, Password>;
  @useResult
  $Res call(
      {PasswordValidator validator,
      PasswordErrorTranslator translator,
      String value});
}

/// @nodoc
class _$PasswordCopyWithImpl<$Res, $Val extends Password>
    implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Password
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
              as PasswordValidator,
      translator: null == translator
          ? _value.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as PasswordErrorTranslator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordImplCopyWith<$Res>
    implements $PasswordCopyWith<$Res> {
  factory _$$PasswordImplCopyWith(
          _$PasswordImpl value, $Res Function(_$PasswordImpl) then) =
      __$$PasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PasswordValidator validator,
      PasswordErrorTranslator translator,
      String value});
}

/// @nodoc
class __$$PasswordImplCopyWithImpl<$Res>
    extends _$PasswordCopyWithImpl<$Res, _$PasswordImpl>
    implements _$$PasswordImplCopyWith<$Res> {
  __$$PasswordImplCopyWithImpl(
      _$PasswordImpl _value, $Res Function(_$PasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validator = null,
    Object? translator = null,
    Object? value = null,
  }) {
    return _then(_$PasswordImpl(
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as PasswordValidator,
      translator: null == translator
          ? _value.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as PasswordErrorTranslator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordImpl extends _Password {
  const _$PasswordImpl(
      {required this.validator, required this.translator, required this.value})
      : super._();

  @override
  final PasswordValidator validator;
  @override
  final PasswordErrorTranslator translator;
  @override
  final String value;

  @override
  String toString() {
    return 'Password(validator: $validator, translator: $translator, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordImpl &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.translator, translator) ||
                other.translator == translator) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validator, translator, value);

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordImplCopyWith<_$PasswordImpl> get copyWith =>
      __$$PasswordImplCopyWithImpl<_$PasswordImpl>(this, _$identity);
}

abstract class _Password extends Password {
  const factory _Password(
      {required final PasswordValidator validator,
      required final PasswordErrorTranslator translator,
      required final String value}) = _$PasswordImpl;
  const _Password._() : super._();

  @override
  PasswordValidator get validator;
  @override
  PasswordErrorTranslator get translator;
  @override
  String get value;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordImplCopyWith<_$PasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
