//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'patched_reset_password_confirm.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PatchedResetPasswordConfirm {
  /// Returns a new [PatchedResetPasswordConfirm] instance.
  PatchedResetPasswordConfirm({
    this.password,
    this.token,
  });

  @JsonKey(
    name: r'password',
    required: false,
    includeIfNull: false,
  )
  final String? password;

  @JsonKey(
    name: r'token',
    required: false,
    includeIfNull: false,
  )
  final String? token;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PatchedResetPasswordConfirm &&
            runtimeType == other.runtimeType &&
            equals([
              password,
              token,
            ], [
              other.password,
              other.token,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          password,
          token,
        ],
      );

  factory PatchedResetPasswordConfirm.fromJson(Map<String, dynamic> json) =>
      _$PatchedResetPasswordConfirmFromJson(json);

  Map<String, dynamic> toJson() => _$PatchedResetPasswordConfirmToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
