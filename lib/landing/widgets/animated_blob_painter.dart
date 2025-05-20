import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBlobPainter extends CustomPainter {
  AnimatedBlobPainter({required this.progress});
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Colors.deepPurple.withOpacity(0.5);
    final paint2 = Paint()..color = Colors.greenAccent.withOpacity(0.5);
    final paint3 = Paint()..color = Colors.orangeAccent.withOpacity(0.5);

    double floatOffset(double baseY, double amplitude, double phase) {
      return baseY + sin(progress * 2 * pi + phase) * amplitude;
    }

    canvas
      ..drawCircle(
        Offset(size.width * 0.2, floatOffset(size.height * 0.3, 20, 0)),
        100,
        paint1,
      )
      ..drawCircle(
        Offset(size.width * 0.8, floatOffset(size.height * 0.2, 25, pi / 2)),
        120,
        paint2,
      )
      ..drawCircle(
        Offset(size.width * 0.6, floatOffset(size.height * 0.8, 30, pi)),
        150,
        paint3,
      );
  }

  @override
  bool shouldRepaint(covariant AnimatedBlobPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
