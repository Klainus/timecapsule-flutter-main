import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final errorText = context.select(
      (LoginBloc bloc) => bloc.state.form.emailErrorText(l10n),
    );

    return TextField(
      textInputAction: TextInputAction.next,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        errorText: errorText,
        labelText: l10n.emailLabelText,
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(
              LoginEmailChanged(value),
            );
      },
    );
  }
}
