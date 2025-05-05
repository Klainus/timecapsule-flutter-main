// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePassword _$ChangePasswordFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChangePassword',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['current_password', 'new_password'],
        );
        final val = ChangePassword(
          currentPassword:
              $checkedConvert('current_password', (v) => v as String),
          newPassword: $checkedConvert('new_password', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'currentPassword': 'current_password',
        'newPassword': 'new_password'
      },
    );

Map<String, dynamic> _$ChangePasswordToJson(ChangePassword instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
    };
