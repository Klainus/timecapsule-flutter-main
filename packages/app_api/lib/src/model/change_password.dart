//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'change_password.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChangePassword {
  /// Returns a new [ChangePassword] instance.
  ChangePassword({
    required this.currentPassword,
    required this.newPassword,
  });

  @JsonKey(
    name: r'current_password',
    required: true,
    includeIfNull: false,
  )
  final String currentPassword;

  @JsonKey(
    name: r'new_password',
    required: true,
    includeIfNull: false,
  )
  final String newPassword;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ChangePassword &&
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

  factory ChangePassword.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
