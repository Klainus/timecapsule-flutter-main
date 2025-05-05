import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();
  Future<void> send(FirebaseAnalytics analytics);

  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AnalyticsEvent {
  const SignUpEvent();

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logSignUp(signUpMethod: 'email');
  }
}

class LoginEvent extends AnalyticsEvent {
  const LoginEvent();

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logLogin();
  }
}

class TutorialBeginEvent extends AnalyticsEvent {
  const TutorialBeginEvent();

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logTutorialBegin();
  }
}

class TutorialCompleteEvent extends AnalyticsEvent {
  const TutorialCompleteEvent();

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logTutorialComplete();
  }
}

class UserIdChangedEvent extends AnalyticsEvent {
  const UserIdChangedEvent(this.userId);

  final String userId;

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.setUserId(
      id: userId.isEmpty ? null : userId,
    );
  }

  @override
  List<Object> get props => [userId];
}
