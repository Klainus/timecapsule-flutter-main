import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, void> {
  AnalyticsBloc(this._analyticsRepository) : super(null) {
    on<AnalyticsEvent>(_onEvent);
  }

  final AnalyticsRepository _analyticsRepository;

  void _onEvent(AnalyticsEvent event, Emitter<void> emit) {
    _analyticsRepository.send(event);
  }
}
