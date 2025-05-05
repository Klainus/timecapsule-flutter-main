//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'patched_change_password.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PatchedChangePassword {
  /// Returns a new [PatchedChangePassword] instance.
  PatchedChangePassword({
    this.currentPassword,
    this.newPassword,
  });

  @JsonKey(
    name: r'current_password',
    required: false,
    includeIfNull: false,
  )
  final String? currentPassword;

  @JsonKey(
    name: r'new_password',
    required: false,
    includeIfNull: false,
  )
  final String? newPassword;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PatchedChangePassword &&
            runtimeType == other.runtimeType &&
            equals([
              currentPassword,
              newPassword,
            ], [
              other.currentPassword,
              other.newPassword,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          currentPassword,
          newPassword,
        ],
      );

  factory PatchedChangePassword.fromJson(Map<String, dynamic> json) =>
      _$PatchedChangePasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PatchedChangePasswordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
