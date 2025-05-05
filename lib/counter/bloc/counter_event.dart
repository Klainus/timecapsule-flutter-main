part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

final class CounterIncrementPressed extends CounterEvent with Analytic {
  const CounterIncrementPressed();
}

final class CounterDecrementPressed extends CounterEvent with Analytic {
  const CounterDecrementPressed();
}
