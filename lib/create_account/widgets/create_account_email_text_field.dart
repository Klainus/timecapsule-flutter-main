import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountEmailTextField extends StatelessWidget {
  const CreateAccountEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final errorText = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.emailErrorText(l10n),
    );

    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        errorText: errorText,
        labelText: l10n.emailLabelText,
      ),
      onChanged: (value) {
        context.read<CreateAccountBloc>().add(
              CreateAccountEmailChanged(value),
            );
      },
    );
  }
}
