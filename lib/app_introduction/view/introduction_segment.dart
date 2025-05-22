import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    required this.title,
    required this.description,
    required this.background,
    super.key,
    this.showButton = false,
    this.onButtonPressed,
  });
  final String title;
  final String description;
  final String background;
  final bool showButton;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image or SVG
        if (background.endsWith('.svg'))
          SvgPicture.asset(
            background,
            fit: BoxFit.cover,
          )
        else
          Image.asset(
            background,
            fit: BoxFit.cover,
          ),
        // Overlay with content
        ColoredBox(
          color: Colors.black.withOpacity(0.5), // Dark overlay for contrast
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              if (showButton) ...[
                const SizedBox(height: 150),
                AppFilledButton.shrink(
                  text: 'Get Started',
                  onPressed: () {
                    if (onButtonPressed != null) {
                      onButtonPressed!();
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
