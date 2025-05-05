import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:user_repository/user_repository.dart';

class UserRepository {
  UserRepository({
    required AuthenticationApi authenticationApi,
    required UserService userService,
    required UserStorageWrapper userStorageWrapper,
  })  : _userService = userService,
        _storage = userStorageWrapper {
    authenticationApi.status.listen((status) async {
      switch (status) {
        case AuthenticationStatus.initial:
          await _userService.fetch();
          authenticationApi.authenticate();
          _storage.subscribe(currentUser.id);
        case AuthenticationStatus.authenticated:
          if (currentUser.isNotEmpty) return;
          await _userService.fetch();
          _storage.subscribe(currentUser.id);
        case AuthenticationStatus.unauthenticated:
          _userService.clear();
          _storage.unsubscribe();
      }
    });
  }

  final UserService _userService;
  final UserStorageWrapper _storage;

  Stream<User> get user => _userService.stream;
  User get currentUser => _userService.state;

  Stream<PersistedUserState> get persistedUserState => _storage.stream;
  PersistedUserState get currentPersistedUserState =>
      _storage.persistedUserState;

  Future<void> changeEmail(String email) async {
    await _userService.patch(
      PatchedUserMe(email: email),
    );
  }

  void enableAnalyticsCollection() {
    _storage.enableAnalyticsCollection();
  }

  void disableAnalyticsCollection() {
    _storage.disableAnalyticsCollection();
  }
}
