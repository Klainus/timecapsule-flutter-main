import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPasswordTextField extends StatefulWidget {
  const CreateAccountPasswordTextField({super.key});

  @override
  State<CreateAccountPasswordTextField> createState() =>
      _CreateAccountPasswordTextFieldState();
}

class _CreateAccountPasswordTextFieldState
    extends State<CreateAccountPasswordTextField> {
  bool _isPasswordVisible = false;

  void _onVisibilityPressed() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final errorText = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.passwordErrorText(l10n),
    );

    return TextField(
      obscureText: !_isPasswordVisible,
      autocorrect: false,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: l10n.passwordLabelText,
        suffixIcon: IconButton(
          onPressed: _onVisibilityPressed,
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      onChanged: (value) {
        context.read<CreateAccountBloc>().add(
              CreateAccountPasswordChanged(value),
            );
      },
    );
  }
}
