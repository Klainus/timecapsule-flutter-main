part of 'create_account_bloc.dart';

sealed class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

final class CreateAccountEmailChanged extends CreateAccountEvent with Analytic {
  const CreateAccountEmailChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

final class CreateAccountPasswordChanged extends CreateAccountEvent
    with Analytic {
  const CreateAccountPasswordChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

final class CreateAccountSubmitted extends CreateAccountEvent with Analytic {
  const CreateAccountSubmitted();
}

final class CreateAccountTermsLinkPressed extends CreateAccountEvent
    with Analytic {
  const CreateAccountTermsLinkPressed();
}

final class CreateAccountDataHandlingLinkPressed extends CreateAccountEvent
    with Analytic {
  const CreateAccountDataHandlingLinkPressed();

  @override
  CustomEvent get event => const CustomEvent('ca_data_handling_link_pressed');
}
