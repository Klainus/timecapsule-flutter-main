import 'package:as_boilerplate_flutter/add_capsule/models/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CreateCapsulePage extends StatefulWidget {
  const CreateCapsulePage({super.key});

  @override
  State<CreateCapsulePage> createState() => _CreateCapsulePageState();
}

class _CreateCapsulePageState extends State<CreateCapsulePage> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    final unlockDate = _selectedDate;

    if (content.isEmpty || unlockDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter text and select a date.')),
      );
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saving capsule...')),
      );
    }

    final capsule =
        TimeCapsule(thoughts: content, revealDate: unlockDate, title: title);
    final box = await Hive.openBox<TimeCapsule>('capsules');
    await box.add(capsule);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Time Capsule')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Capsule Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Enter your message',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _selectedDate == null
                    ? 'Pick Unlock Date'
                    : 'Unlocks: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
              ),
              onPressed: _pickDate,
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text('Save Capsule'),
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
