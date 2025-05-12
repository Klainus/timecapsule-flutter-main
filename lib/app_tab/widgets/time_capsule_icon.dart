import 'package:flutter/material.dart';

class TimeCapsuleIcon extends StatelessWidget {
  const TimeCapsuleIcon({
    super.key,
    this.size = 24.0,
    this.color = Colors.black,
  });
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TimeCapsulePainter(color),
    );
  }
}

class _TimeCapsulePainter extends CustomPainter {
  _TimeCapsulePainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw capsule body
    final rect = Rect.fromLTWH(4, 8, size.width - 8, size.height - 16);
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(8));
    canvas.drawRRect(rRect, paint);

    // Draw capsule top and bottom circles
    final topCircle = Offset(size.width / 2, 8);
    final bottomCircle = Offset(size.width / 2, size.height - 8);
    canvas
      ..drawCircle(topCircle, 4, paint)
      ..drawCircle(bottomCircle, 4, paint);

    // Draw "+" sign
    final plusPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Vertical line of "+"
    canvas
      ..drawLine(
        Offset(centerX, centerY - 6),
        Offset(centerX, centerY + 6),
        plusPaint,
      )

      // Horizontal line of "+"
      ..drawLine(
        Offset(centerX - 6, centerY),
        Offset(centerX + 6, centerY),
        plusPaint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
