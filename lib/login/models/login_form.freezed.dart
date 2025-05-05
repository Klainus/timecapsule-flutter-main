// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginForm {
  LoginFormStatus get status;
  Email get email;
  Password get password;
  LoginFailure? get failure;

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginFormCopyWith<LoginForm> get copyWith =>
      _$LoginFormCopyWithImpl<LoginForm>(this as LoginForm, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginForm &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, email, password, failure);

  @override
  String toString() {
    return 'LoginForm(status: $status, email: $email, password: $password, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $LoginFormCopyWith<$Res> {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) _then) =
      _$LoginFormCopyWithImpl;
  @useResult
  $Res call(
      {LoginFormStatus status,
      Email email,
      Password password,
      LoginFailure? failure});

  $EmailCopyWith<$Res> get email;
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class _$LoginFormCopyWithImpl<$Res> implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._self, this._then);

  final LoginForm _self;
  final $Res Function(LoginForm) _then;

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginFormStatus,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as LoginFailure?,
    ));
  }

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasswordCopyWith<$Res> get password {
    return $PasswordCopyWith<$Res>(_self.password, (value) {
      return _then(_self.copyWith(password: value));
    });
  }
}

/// @nodoc

class _LoginForm extends LoginForm {
  const _LoginForm(
      {this.status = LoginFormStatus.initial,
      this.email = Email.empty,
      this.password = Password.empty,
      this.failure})
      : super._();

  @override
  @JsonKey()
  final LoginFormStatus status;
  @override
  @JsonKey()
  final Email email;
  @override
  @JsonKey()
  final Password password;
  @override
  final LoginFailure? failure;

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginFormCopyWith<_LoginForm> get copyWith =>
      __$LoginFormCopyWithImpl<_LoginForm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginForm &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, email, password, failure);

  @override
  String toString() {
    return 'LoginForm(status: $status, email: $email, password: $password, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$LoginFormCopyWith<$Res>
    implements $LoginFormCopyWith<$Res> {
  factory _$LoginFormCopyWith(
          _LoginForm value, $Res Function(_LoginForm) _then) =
      __$LoginFormCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoginFormStatus status,
      Email email,
      Password password,
      LoginFailure? failure});

  @override
  $EmailCopyWith<$Res> get email;
  @override
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class __$LoginFormCopyWithImpl<$Res> implements _$LoginFormCopyWith<$Res> {
  __$LoginFormCopyWithImpl(this._self, this._then);

  final _LoginForm _self;
  final $Res Function(_LoginForm) _then;

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? failure = freezed,
  }) {
    return _then(_LoginForm(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginFormStatus,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as LoginFailure?,
    ));
  }

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of LoginForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PasswordCopyWith<$Res> get password {
    return $PasswordCopyWith<$Res>(_self.password, (value) {
      return _then(_self.copyWith(password: value));
    });
  }
}

// dart format on
