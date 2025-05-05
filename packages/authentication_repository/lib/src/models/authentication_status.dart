import 'package:authentication_api/authentication_api.dart' as api;

enum AuthenticationStatus {
  unauthenticated,
  authenticated;

  factory AuthenticationStatus.from(api.AuthenticationStatus status) =>
      switch (status) {
        api.AuthenticationStatus.initial => unauthenticated,
        api.AuthenticationStatus.unauthenticated => unauthenticated,
        api.AuthenticationStatus.authenticated => authenticated,
      };

  bool get isAuthenticated => this == authenticated;
  bool get isUnauthenticated => this == unauthenticated;
}
