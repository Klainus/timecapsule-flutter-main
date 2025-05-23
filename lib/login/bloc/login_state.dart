import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginForm()) LoginForm form,
  }) = _LoginState;
}
