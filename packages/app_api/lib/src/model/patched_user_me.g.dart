// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_user_me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedUserMe _$PatchedUserMeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedUserMe',
      json,
      ($checkedConvert) {
        final val = PatchedUserMe(
          id: $checkedConvert('id', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          isStaff: $checkedConvert('is_staff', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'isStaff': 'is_staff'
      },
    );

Map<String, dynamic> _$PatchedUserMeToJson(PatchedUserMe instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.email case final value?) 'email': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.isStaff case final value?) 'is_staff': value,
    };
