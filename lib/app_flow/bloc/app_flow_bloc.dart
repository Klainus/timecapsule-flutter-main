import 'dart:async';

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/app_flow/bloc/app_flow_state.dart';
import 'package:as_boilerplate_flutter/app_flow/models/app_flow.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'app_flow_event.dart';

class AppFlowBloc extends HydratedBloc<AppFlowEvent, AppFlowState> {
  AppFlowBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(
          AppFlowState(
            flow: AppFlow.from(
              const AppFlow(),
              userRepository.currentUser,
            ),
          ),
        ) {
    on<_AppFlowUserChanged>(_onUserChanged);
    on<AppFlowEnableAnalyticsCompleted>(_onEnableAnalyticsCompleted);

    _subscription = _userRepository.user.listen(
      (user) => add(
        _AppFlowUserChanged(user),
      ),
    );
  }

  final UserRepository _userRepository;
  late StreamSubscription<User> _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  void _onUserChanged(
    _AppFlowUserChanged event,
    Emitter<AppFlowState> emit,
  ) {
    emit(
      state.copyWith(
        flow: AppFlow.from(state.flow, event.user),
      ),
    );
  }

  Future<void> _onEnableAnalyticsCompleted(
    AppFlowEnableAnalyticsCompleted event,
    Emitter<AppFlowState> emit,
  ) async {
    emit(
      state.copyWith.flow(
        isEnableAnalyticsCompleted: true,
      ),
    );
  }

  @override
  AppFlowState fromJson(Map<String, dynamic> json) {
    final persistedState = AppFlowState.fromJson(json);
    final user = _userRepository.currentUser;
    return persistedState.copyWith(
      flow: AppFlow.from(persistedState.flow, user),
    );
  }

  @override
  Map<String, dynamic> toJson(AppFlowState state) => state.toJson();
}
