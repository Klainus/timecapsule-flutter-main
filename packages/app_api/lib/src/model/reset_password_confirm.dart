//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'reset_password_confirm.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResetPasswordConfirm {
  /// Returns a new [ResetPasswordConfirm] instance.
  ResetPasswordConfirm({
    required this.password,
    required this.token,
  });

  @JsonKey(
    name: r'password',
    required: true,
    includeIfNull: false,
  )
  final String password;

  @JsonKey(
    name: r'token',
    required: true,
    includeIfNull: false,
  )
  final String token;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ResetPasswordConfirm &&
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

  factory ResetPasswordConfirm.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordConfirmFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordConfirmToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
