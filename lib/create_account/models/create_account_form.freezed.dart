// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAccountForm {
  CreateAccountStatus get status;
  Email get email;
  Password get password;

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateAccountFormCopyWith<CreateAccountForm> get copyWith =>
      _$CreateAccountFormCopyWithImpl<CreateAccountForm>(
          this as CreateAccountForm, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateAccountForm &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password);

  @override
  String toString() {
    return 'CreateAccountForm(status: $status, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $CreateAccountFormCopyWith<$Res> {
  factory $CreateAccountFormCopyWith(
          CreateAccountForm value, $Res Function(CreateAccountForm) _then) =
      _$CreateAccountFormCopyWithImpl;
  @useResult
  $Res call({CreateAccountStatus status, Email email, Password password});

  $EmailCopyWith<$Res> get email;
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class _$CreateAccountFormCopyWithImpl<$Res>
    implements $CreateAccountFormCopyWith<$Res> {
  _$CreateAccountFormCopyWithImpl(this._self, this._then);

  final CreateAccountForm _self;
  final $Res Function(CreateAccountForm) _then;

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateAccountStatus,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of CreateAccountForm
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

class _CreateAccountForm extends CreateAccountForm {
  const _CreateAccountForm(
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

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateAccountFormCopyWith<_CreateAccountForm> get copyWith =>
      __$CreateAccountFormCopyWithImpl<_CreateAccountForm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateAccountForm &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password);

  @override
  String toString() {
    return 'CreateAccountForm(status: $status, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$CreateAccountFormCopyWith<$Res>
    implements $CreateAccountFormCopyWith<$Res> {
  factory _$CreateAccountFormCopyWith(
          _CreateAccountForm value, $Res Function(_CreateAccountForm) _then) =
      __$CreateAccountFormCopyWithImpl;
  @override
  @useResult
  $Res call({CreateAccountStatus status, Email email, Password password});

  @override
  $EmailCopyWith<$Res> get email;
  @override
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class __$CreateAccountFormCopyWithImpl<$Res>
    implements _$CreateAccountFormCopyWith<$Res> {
  __$CreateAccountFormCopyWithImpl(this._self, this._then);

  final _CreateAccountForm _self;
  final $Res Function(_CreateAccountForm) _then;

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_CreateAccountForm(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateAccountStatus,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }

  /// Create a copy of CreateAccountForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of CreateAccountForm
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
