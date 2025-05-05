import 'dart:async';

import 'package:user_repository/user_repository.dart';

class UserStorageWrapper {
  UserStorageWrapper({
    UserStorage Function(String)? createStorage,
  }) : _createStorage = createStorage ?? UserStorage.new;

  final UserStorage Function(String) _createStorage;
  UserStorage? _storage;

  StreamSubscription<PersistedUserState>? _subscription;

  final _controller = StreamController<PersistedUserState>.broadcast();
  Stream<PersistedUserState> get stream => _controller.stream;

  PersistedUserState get persistedUserState =>
      _storage?.state ?? const PersistedUserState();

  void subscribe(String id) {
    unsubscribe();
    final storage = _createStorage(id);
    _storage = storage;
    _subscription = storage.stream.listen(_controller.add);
  }

  void unsubscribe() {
    _subscription?.cancel();
    _storage?.close();
    _storage = null;
  }

  void enableAnalyticsCollection() {
    _storage?.enableAnalyticsCollection();
  }

  void disableAnalyticsCollection() {
    _storage?.disableAnalyticsCollection();
  }
}
