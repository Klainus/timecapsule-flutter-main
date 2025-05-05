import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver(
    this._logger,
    this._analyticsRepository,
  );

  final Logger _logger;
  final AnalyticsRepository _analyticsRepository;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    final runtimeType = event.runtimeType;
    final eventName = runtimeType.toString();

    if (eventName.startsWith('_')) {
      _logger.fine(eventName);
    } else {
      _logger.info(eventName);
    }

    if (event case Analytic(:final event)) {
      _analyticsRepository.send(
        event ?? DefaultEvent.from(runtimeType),
      );
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _logger.severe('error ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _logger.info('opened ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    _logger.info('closed ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
