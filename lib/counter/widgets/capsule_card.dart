import 'package:as_boilerplate_flutter/counter/widgets/capsule_countdown_timer.dart';
import 'package:flutter/material.dart';

class CapsuleCard extends StatelessWidget {
  const CapsuleCard({
    required this.title,
    required this.thoughts,
    required this.revealDate,
    required this.onDelete, // Callback for deletion
    super.key,
    this.onTap,
  });

  final String title;
  final String thoughts;
  final DateTime revealDate;
  final VoidCallback? onTap;
  final VoidCallback onDelete;

  bool get isUnlocked => DateTime.now().isAfter(revealDate);

  void _handleTap(BuildContext context) {
    if (isUnlocked) {
      if (onTap != null) {
        onTap!();
      }
    } else {
      _showDeleteConfirmationDialog(context);
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Capsule'),
          content: const Text(
            'This capsule is locked. Do you want to delete it?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context), // Handle tap based on lock status
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_clock,
                  color: isUnlocked ? Colors.green : Colors.grey,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Thoughts
              Text(
                isUnlocked ? thoughts : 'Locked content',
                style: TextStyle(
                  fontSize: 12,
                  color: isUnlocked ? Colors.black54 : Colors.grey,
                  fontStyle: isUnlocked ? FontStyle.normal : FontStyle.italic,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              CountdownTimer(revealDate: revealDate),
            ],
          ),
        ),
      ),
    );
  }
}
