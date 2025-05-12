import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginInvalidCredentialsExeption implements Exception {}

class RegisterValidationException implements Exception {}

class EmailUnverifiedException implements Exception {}

class AuthenticationApi {
  AuthenticationApi({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth;

  Stream<AuthenticationStatus> get status {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
        return AuthenticationStatus.unauthenticated;
      } else {
        return AuthenticationStatus.authenticated;
      }
    });
  }

  AuthenticationStatus get currentStatus {
    final user = _firebaseAuth.currentUser;
    return user == null
        ? AuthenticationStatus.unauthenticated
        : AuthenticationStatus.authenticated;
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw LoginInvalidCredentialsExeption();
      } else if (e.code == 'email-not-verified') {
        throw EmailUnverifiedException();
      } else {
        rethrow;
      }
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw RegisterValidationException();
    }
  }

  Future<void> unauthenticate() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
