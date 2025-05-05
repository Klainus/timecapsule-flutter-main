import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/enable_analytics/enable_analytics.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'enable_analytics_event.dart';

class EnableAnalyticsBloc
    extends Bloc<EnableAnalyticsEvent, EnableAnalyticsState> {
  EnableAnalyticsBloc(
    this._analyticsRepository,
    this._userRepository,
  ) : super(const EnableAnalyticsState()) {
    on<EnableAnalyticsPressed>(_onPressed);
    on<EnableAnalyticsSkipped>(_onSkipped);
  }

  final AnalyticsRepository _analyticsRepository;
  final UserRepository _userRepository;

  Future<void> _onPressed(
    EnableAnalyticsPressed event,
    Emitter<EnableAnalyticsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EnableAnalyticsStatus.loading,
      ),
    );

    await _analyticsRepository.enableAnalyticsCollection();
    _userRepository.enableAnalyticsCollection();

    emit(
      state.copyWith(
        status: EnableAnalyticsStatus.success,
      ),
    );
  }

  Future<void> _onSkipped(
    EnableAnalyticsSkipped event,
    Emitter<EnableAnalyticsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EnableAnalyticsStatus.loading,
      ),
    );

    await _analyticsRepository.disableAnalyticsCollection();
    _userRepository.disableAnalyticsCollection();

    emit(
      state.copyWith(
        status: EnableAnalyticsStatus.failure,
      ),
    );
  }
}
