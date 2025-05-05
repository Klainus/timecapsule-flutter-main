import 'package:analytics_repository/analytics_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.system) {
    on<ThemeOptionPressed>(_onOptionPressed);
  }

  void _onOptionPressed(
    ThemeOptionPressed event,
    Emitter<ThemeMode> emit,
  ) {
    emit(
      event.theme,
    );
  }
}
