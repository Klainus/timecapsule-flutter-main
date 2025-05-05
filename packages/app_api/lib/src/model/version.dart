//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'version.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Version {
  /// Returns a new [Version] instance.
  Version({
    required this.minimumVersion,
  });

  @JsonKey(
    name: r'minimum_version',
    required: true,
    includeIfNull: false,
  )
  final String minimumVersion;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Version &&
            runtimeType == other.runtimeType &&
            equals([
              minimumVersion,
            ], [
              other.minimumVersion,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          minimumVersion,
        ],
      );

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
