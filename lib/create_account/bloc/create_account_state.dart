import 'package:as_boilerplate_flutter/create_account/models/create_account_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

@freezed
abstract class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState({
    @Default(CreateAccountForm()) CreateAccountForm form,
  }) = _CreateAccountState;
}
