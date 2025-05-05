// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedChangePassword _$PatchedChangePasswordFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedChangePassword',
      json,
      ($checkedConvert) {
        final val = PatchedChangePassword(
          currentPassword:
              $checkedConvert('current_password', (v) => v as String?),
          newPassword: $checkedConvert('new_password', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'currentPassword': 'current_password',
        'newPassword': 'new_password'
      },
    );

Map<String, dynamic> _$PatchedChangePasswordToJson(
        PatchedChangePassword instance) =>
    <String, dynamic>{
      if (instance.currentPassword case final value?) 'current_password': value,
      if (instance.newPassword case final value?) 'new_password': value,
    };
