import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPasswordTextField extends StatefulWidget {
  const LoginPasswordTextField({super.key});

  @override
  State<LoginPasswordTextField> createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final errorText = context.select(
      (LoginBloc bloc) => bloc.state.form.passwordErrorText(l10n),
    );

    return TextField(
      obscureText: !_isPasswordVisible,
      textInputAction: TextInputAction.done,
      autocorrect: false,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: l10n.passwordLabelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(
              LoginPasswordChanged(value),
            );
      },
      onSubmitted: (_) {
        context.read<LoginBloc>().add(
              const LoginSubmitted(),
            );
      },
    );
  }
}
