// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Version',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['minimum_version'],
        );
        final val = Version(
          minimumVersion:
              $checkedConvert('minimum_version', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'minimumVersion': 'minimum_version'},
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'minimum_version': instance.minimumVersion,
    };
