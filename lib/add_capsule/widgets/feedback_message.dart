import 'package:flutter/material.dart';

class FeedbackMessage extends StatelessWidget {
  const FeedbackMessage({
    required this.message,
    required this.isSuccess,
    super.key,
  });
  final String message;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        color: isSuccess ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
