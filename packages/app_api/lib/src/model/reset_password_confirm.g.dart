// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_confirm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordConfirm _$ResetPasswordConfirmFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ResetPasswordConfirm',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['password', 'token'],
        );
        final val = ResetPasswordConfirm(
          password: $checkedConvert('password', (v) => v as String),
          token: $checkedConvert('token', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ResetPasswordConfirmToJson(
        ResetPasswordConfirm instance) =>
    <String, dynamic>{
      'password': instance.password,
      'token': instance.token,
    };
