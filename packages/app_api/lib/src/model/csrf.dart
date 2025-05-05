//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'csrf.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CSRF {
  /// Returns a new [CSRF] instance.
  CSRF({
    required this.csrfToken,
  });

  @JsonKey(
    name: r'csrf_token',
    required: true,
    includeIfNull: false,
  )
  final String csrfToken;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CSRF &&
            runtimeType == other.runtimeType &&
            equals([
              csrfToken,
            ], [
              other.csrfToken,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          csrfToken,
        ],
      );

  factory CSRF.fromJson(Map<String, dynamic> json) => _$CSRFFromJson(json);

  Map<String, dynamic> toJson() => _$CSRFToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
