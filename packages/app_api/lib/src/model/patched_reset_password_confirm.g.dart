// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_reset_password_confirm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedResetPasswordConfirm _$PatchedResetPasswordConfirmFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedResetPasswordConfirm',
      json,
      ($checkedConvert) {
        final val = PatchedResetPasswordConfirm(
          password: $checkedConvert('password', (v) => v as String?),
          token: $checkedConvert('token', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PatchedResetPasswordConfirmToJson(
        PatchedResetPasswordConfirm instance) =>
    <String, dynamic>{
      if (instance.password case final value?) 'password': value,
      if (instance.token case final value?) 'token': value,
    };
