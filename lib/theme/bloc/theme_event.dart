part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class ThemeOptionPressed extends ThemeEvent with Analytic {
  const ThemeOptionPressed(this.theme);

  final ThemeMode theme;
}
