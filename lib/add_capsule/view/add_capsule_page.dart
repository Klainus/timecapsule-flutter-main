import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AddTimeCapsulePage extends StatelessWidget {
  const AddTimeCapsulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var title = '';
    var description = '';
    DateTime? selectedDate;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Time Capsule')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (value) => title = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a title' : null,
              ),
              SizedBox(height: context.spacing.verticalValue),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value ?? '',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                child: const Text('Select Date'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // Save to Firebase
                    // saveTimeCapsuleToFirebase(title, description, selectedDate);
                    Navigator.of(context).pushNamed('login');
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void saveTimeCapsuleToFirebase(
  //   String title,
  //   String description,
  //   DateTime? date,
  // ) {

  //   FirebaseFirestore.instance.collection('timecapsules').add({
  //     'title': title,
  //     'description': description,
  //     'date': date?.toIso8601String(),
  //     'createdAt': DateTime.now().toIso8601String(),
  //   });
  // }
}
