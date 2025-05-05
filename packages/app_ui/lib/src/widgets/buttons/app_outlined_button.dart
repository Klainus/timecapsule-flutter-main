import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton._({
    required this.text,
    required this.onPressed,
    required this.isLoading,
    required this.size,
    super.key,
  });

  const AppOutlinedButton.shrink({
    required String text,
    required void Function()? onPressed,
    bool isLoading = false,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          size: AppButtonSize.shrink,
        );

  const AppOutlinedButton.expand({
    required void Function()? onPressed,
    required String text,
    bool isLoading = false,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          size: AppButtonSize.expand,
        );

  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  final AppButtonSize size;

  @override
  Widget build(BuildContext context) {
    final onPressed = this.onPressed;
    final style = OutlinedButtonTheme.of(context).style;
    final foregroundColor = style?.foregroundColor?.resolve({});
    final isDisabled = onPressed == null;

    return OutlinedButton(
      onPressed: isDisabled
          ? null
          : () {
              if (isLoading) return;
              onPressed();
            },
      style: style?.copyWith(
        minimumSize: WidgetStatePropertyAll(size.value),
      ),
      child: isLoading ? ButtonSpinner(foregroundColor) : Text(text),
    );
  }
}
