//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'registration.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Registration {
  /// Returns a new [Registration] instance.
  Registration({
    required this.email,
    this.firstName,
    this.lastName,
    required this.password,
  });

  @JsonKey(
    name: r'email',
    required: true,
    includeIfNull: false,
  )
  final String email;

  @JsonKey(
    name: r'first_name',
    required: false,
    includeIfNull: false,
  )
  final String? firstName;

  @JsonKey(
    name: r'last_name',
    required: false,
    includeIfNull: false,
  )
  final String? lastName;

  @JsonKey(
    name: r'password',
    required: true,
    includeIfNull: false,
  )
  final String password;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Registration &&
            runtimeType == other.runtimeType &&
            equals([
              email,
              firstName,
              lastName,
              password,
            ], [
              other.email,
              other.firstName,
              other.lastName,
              other.password,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          email,
          firstName,
          lastName,
          password,
        ],
      );

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
