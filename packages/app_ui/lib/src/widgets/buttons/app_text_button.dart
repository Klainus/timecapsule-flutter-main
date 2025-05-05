import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final style = TextButtonTheme.of(context).style;
    final foregroundColor = style?.foregroundColor?.resolve({});

    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.all(21),
        ),
      ),
      child: isLoading ? ButtonSpinner(foregroundColor) : Text(text),
    );
  }
}
