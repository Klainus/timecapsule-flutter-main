//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'patched_user_me.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PatchedUserMe {
  /// Returns a new [PatchedUserMe] instance.
  PatchedUserMe({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.isStaff,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  final String? id;

  @JsonKey(
    name: r'email',
    required: false,
    includeIfNull: false,
  )
  final String? email;

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
    required: false,
    includeIfNull: false,
  )
  final bool? isStaff;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PatchedUserMe &&
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

  factory PatchedUserMe.fromJson(Map<String, dynamic> json) =>
      _$PatchedUserMeFromJson(json);

  Map<String, dynamic> toJson() => _$PatchedUserMeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
