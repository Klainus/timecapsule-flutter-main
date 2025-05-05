//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_me.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserMe {
  /// Returns a new [UserMe] instance.
  UserMe({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    required this.isStaff,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final String id;

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

  /// Designates whether the user can log into staff site.
  @JsonKey(
    name: r'is_staff',
    required: true,
    includeIfNull: false,
  )
  final bool isStaff;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserMe &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              email,
              firstName,
              lastName,
              isStaff,
            ], [
              other.id,
              other.email,
              other.firstName,
              other.lastName,
              other.isStaff,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          email,
          firstName,
          lastName,
          isStaff,
        ],
      );

  factory UserMe.fromJson(Map<String, dynamic> json) => _$UserMeFromJson(json);

  Map<String, dynamic> toJson() => _$UserMeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
