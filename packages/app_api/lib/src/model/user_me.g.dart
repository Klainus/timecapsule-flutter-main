// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMe _$UserMeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserMe',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'email', 'is_staff'],
        );
        final val = UserMe(
          id: $checkedConvert('id', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          isStaff: $checkedConvert('is_staff', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'isStaff': 'is_staff'
      },
    );

Map<String, dynamic> _$UserMeToJson(UserMe instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      'is_staff': instance.isStaff,
    };
