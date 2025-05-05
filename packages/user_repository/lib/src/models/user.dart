import 'package:app_api/app_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String? firstName,
    required String? lastName,
    required bool isStaff,
  }) = _User;

  factory User.from(UserMe userMe) {
    return User(
      id: userMe.id,
      email: userMe.email,
      firstName: userMe.firstName,
      lastName: userMe.lastName,
      isStaff: userMe.isStaff,
    );
  }

  const User._();

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  static const empty = User(
    id: '',
    email: '',
    firstName: null,
    lastName: null,
    isStaff: false,
  );
}
