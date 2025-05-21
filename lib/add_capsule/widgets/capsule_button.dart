import 'package:flutter/material.dart';

class CapsuleButton extends StatelessWidget {
  const CapsuleButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  });
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
    );
  }
}
