import 'dart:async';

import 'package:app_api/app_api.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

class UserService extends Cubit<User> {
  UserService({
    required UsersApi usersApi,
  })  : _usersApi = usersApi,
        super(User.empty);

  final UsersApi _usersApi;

  Future<void> fetch() async {
    try {
      final response = await _usersApi.usersMeRetrieve();
      final userMe = response.data!;
      final user = User.from(userMe);
      emit(user);
    } catch (_) {
      emit(User.empty);
      rethrow;
    }
  }

  Future<void> patch(PatchedUserMe patchedUser) async {
    final response = await _usersApi.usersMePartialUpdate(
      patchedUserMe: patchedUser,
    );
    final userMe = response.data!;
    final updatedUser = User.from(userMe);
    emit(updatedUser);
  }

  void clear() {
    emit(User.empty);
  }
}
