import 'package:flutter/material.dart';

class CreateCapsulePage extends StatefulWidget {
  const CreateCapsulePage({super.key});

  @override
  _CreateCapsulePageState createState() => _CreateCapsulePageState();
}

class _CreateCapsulePageState extends State<CreateCapsulePage> {
  final TextEditingController _thoughtsController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  DateTime? _revealDate;

  @override
  void dispose() {
    _thoughtsController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _revealDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _saveCapsule(BuildContext context) {
    final thoughts = _thoughtsController.text;
    final goal = _goalController.text;

    if (_revealDate == null || thoughts.isEmpty) {
      _showErrorDialog(context, 'Please fill in all fields and select a date.');
      return;
    }

    // Save capsule logic here
    _showSuccessDialog(context, 'Capsule saved successfully!');
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to the previous screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Capsule')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _thoughtsController,
              decoration: const InputDecoration(
                labelText: 'Your Thoughts Today',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _goalController,
              decoration: const InputDecoration(
                labelText: 'Your Goal',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickDate(context),
              child: Text(
                _revealDate == null
                    ? 'Select Unlock Date'
                    : 'Unlock Date: ${_revealDate!.toLocal()}',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveCapsule(context),
              child: const Text('Save Capsule'),
            ),
          ],
        ),
      ),
    );
  }
}
