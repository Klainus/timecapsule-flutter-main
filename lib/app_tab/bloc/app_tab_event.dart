part of 'app_tab_bloc.dart';

sealed class AppTabEvent extends Equatable {
  const AppTabEvent();
}

final class AppTabPressed extends AppTabEvent with Analytic {
  const AppTabPressed(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
