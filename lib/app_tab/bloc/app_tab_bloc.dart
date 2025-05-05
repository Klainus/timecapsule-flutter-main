import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/app_tab/app_tab.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_tab_event.dart';

class AppTabBloc extends Bloc<AppTabEvent, AppTab> {
  AppTabBloc() : super(AppTab.initial) {
    on<AppTabPressed>(_onPressed);
  }

  void _onPressed(
    AppTabPressed event,
    Emitter<AppTab> emit,
  ) {
    emit(
      AppTab.values[event.index],
    );
  }
}
