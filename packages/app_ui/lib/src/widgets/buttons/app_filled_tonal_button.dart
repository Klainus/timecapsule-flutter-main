import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppFilledTonalButton extends StatelessWidget {
  const AppFilledTonalButton._({
    required this.text,
    required this.onPressed,
    required this.isLoading,
    required this.size,
    super.key,
  });

  const AppFilledTonalButton.shrink({
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

  const AppFilledTonalButton.expand({
    required String text,
    required void Function()? onPressed,
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
    final style = FilledButtonTheme.of(context).style;
    final foregroundColor = style?.foregroundColor?.resolve({});
    final isDisabled = onPressed == null;

    return FilledButton(
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
