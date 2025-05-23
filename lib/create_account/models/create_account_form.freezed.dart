// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateAccountForm {
  CreateAccountStatus get status => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAccountFormCopyWith<CreateAccountForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountFormCopyWith<$Res> {
  factory $CreateAccountFormCopyWith(
          CreateAccountForm value, $Res Function(CreateAccountForm) then) =
      _$CreateAccountFormCopyWithImpl<$Res, CreateAccountForm>;
  @useResult
  $Res call({CreateAccountStatus status, Email email, Password password});

  $EmailCopyWith<$Res> get email;
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class _$CreateAccountFormCopyWithImpl<$Res, $Val extends CreateAccountForm>
    implements $CreateAccountFormCopyWith<$Res> {
  _$CreateAccountFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateAccountStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ) as $Val);
  }

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasswordCopyWith<$Res> get password {
    return $PasswordCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateAccountFormImplCopyWith<$Res>
    implements $CreateAccountFormCopyWith<$Res> {
  factory _$$CreateAccountFormImplCopyWith(_$CreateAccountFormImpl value,
          $Res Function(_$CreateAccountFormImpl) then) =
      __$$CreateAccountFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CreateAccountStatus status, Email email, Password password});

  @override
  $EmailCopyWith<$Res> get email;
  @override
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class __$$CreateAccountFormImplCopyWithImpl<$Res>
    extends _$CreateAccountFormCopyWithImpl<$Res, _$CreateAccountFormImpl>
    implements _$$CreateAccountFormImplCopyWith<$Res> {
  __$$CreateAccountFormImplCopyWithImpl(_$CreateAccountFormImpl _value,
      $Res Function(_$CreateAccountFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$CreateAccountFormImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateAccountStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$CreateAccountFormImpl extends _CreateAccountForm {
  const _$CreateAccountFormImpl(
      {this.status = CreateAccountStatus.initial,
      this.email = Email.empty,
      this.password = Password.empty})
      : super._();

  @override
  @JsonKey()
  final CreateAccountStatus status;
  @override
  @JsonKey()
  final Email email;
  @override
  @JsonKey()
  final Password password;

  @override
  String toString() {
    return 'CreateAccountForm(status: $status, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAccountFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password);

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAccountFormImplCopyWith<_$CreateAccountFormImpl> get copyWith =>
      __$$CreateAccountFormImplCopyWithImpl<_$CreateAccountFormImpl>(
          this, _$identity);
}

abstract class _CreateAccountForm extends CreateAccountForm {
  const factory _CreateAccountForm(
      {final CreateAccountStatus status,
      final Email email,
      final Password password}) = _$CreateAccountFormImpl;
  const _CreateAccountForm._() : super._();

  @override
  CreateAccountStatus get status;
  @override
  Email get email;
  @override
  Password get password;

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAccountFormImplCopyWith<_$CreateAccountFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
