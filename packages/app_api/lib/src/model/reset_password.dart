//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'reset_password.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResetPassword {
  /// Returns a new [ResetPassword] instance.
  ResetPassword({
    required this.email,
  });

  @JsonKey(
    name: r'email',
    required: true,
    includeIfNull: false,
  )
  final String email;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ResetPassword &&
            runtimeType == other.runtimeType &&
            equals([
              email,
            ], [
              other.email,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          email,
        ],
      );

  factory ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
