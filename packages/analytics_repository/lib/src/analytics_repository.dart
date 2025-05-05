import 'package:analytics_repository/analytics_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

class SendAnalyticsEventFailure with EquatableMixin implements Exception {
  const SendAnalyticsEventFailure(this.event, this.error);

  final AnalyticsEvent event;
  final Object error;

  @override
  List<Object?> get props => [event, error];
}

class AnalyticsRepository {
  const AnalyticsRepository(
    FirebaseApp _,
    FirebaseAnalytics firebaseAnalytics, {
    required this.debug,
  }) : _firebaseAnalytics = firebaseAnalytics;

  final FirebaseAnalytics _firebaseAnalytics;
  final bool debug;

  Future<void> disableAnalyticsCollection() async {
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(false);
  }

  Future<void> enableAnalyticsCollection() async {
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(!debug);
  }

  Future<void> send(AnalyticsEvent event) async {
    try {
      await event.send(_firebaseAnalytics);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SendAnalyticsEventFailure(event, error),
        stackTrace,
      );
    }
  }
}
