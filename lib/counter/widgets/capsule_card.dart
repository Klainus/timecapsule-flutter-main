import 'package:flutter/material.dart';

class CapsuleCard extends StatelessWidget {
  const CapsuleCard({
    required this.title,
    required this.thoughts,
    required this.revealDate,
    super.key,
    this.onTap,
  });
  final String title;
  final String thoughts;
  final DateTime revealDate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon or Leading Element
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_clock,
                  color: Colors.blueAccent,
                  size: 24, // Smaller icon size
                ),
              ),
              const SizedBox(height: 8),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14, // Smaller font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Thoughts
              Text(
                thoughts,
                style: const TextStyle(
                  fontSize: 12, // Smaller font size
                  color: Colors.black54,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              // Reveal Date
              Text(
                'Reveal: ${revealDate.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(
                  fontSize: 10, // Smaller font size
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
