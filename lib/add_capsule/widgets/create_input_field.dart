import 'package:flutter/material.dart';

class CapsuleTextField extends StatelessWidget {
  const CapsuleTextField({
    required this.labelText,
    required this.onChanged,
    super.key,
  });
  final String labelText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
      ),
    );
  }
}
