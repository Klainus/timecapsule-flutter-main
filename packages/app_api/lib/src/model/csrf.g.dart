// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'csrf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CSRF _$CSRFFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CSRF',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['csrf_token'],
        );
        final val = CSRF(
          csrfToken: $checkedConvert('csrf_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'csrfToken': 'csrf_token'},
    );

Map<String, dynamic> _$CSRFToJson(CSRF instance) => <String, dynamic>{
      'csrf_token': instance.csrfToken,
    };
