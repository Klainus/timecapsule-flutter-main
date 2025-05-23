import 'package:flutter/material.dart';

class TimeCapsuleIcon extends StatelessWidget {
  const TimeCapsuleIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // Resolve the color dynamically based on the theme
    final iconTheme = IconTheme.of(context);
    Color? iconColor = color ?? iconTheme.color ?? Colors.black;

    // Apply opacity if defined in the theme
    final iconOpacity = iconTheme.opacity ?? 1.0;
    if (iconOpacity != 1.0) {
      iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
    }

    // Adjust brightness for better visibility
    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      iconColor = iconColor.withOpacity(0.8); // Slightly lighter in dark mode
    } else {
      iconColor = iconColor.withOpacity(0.9); // Slightly darker in light mode
    }

    return CustomPaint(
      size: Size(size, size),
      painter: _TimeCapsulePainter(iconColor),
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
