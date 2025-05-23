import 'package:as_boilerplate_flutter/add_capsule/models/hive.dart';
import 'package:as_boilerplate_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<TimeCapsule>('capsules'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('Capsules')),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Capsules')),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          final box = Hive.box<TimeCapsule>('capsules');
          return Scaffold(
            appBar: AppBar(
              title: const Text('Time Capsules'),
              centerTitle: true,
              backgroundColor: AppColors.primary,
            ),
            body: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box<TimeCapsule> box, _) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text(
                      'No capsules yet!',
                      style:
                          TextStyle(fontSize: 18, color: AppColors.background),
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final capsule = box.getAt(index);
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            capsule?.title ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                capsule?.thoughts ?? 'No Thoughts',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Reveal Date: ${capsule?.revealDate.toString() ?? 'No Date'}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blueAccent,
                          ),
                          onTap: () {
                            // Handle tap (e.g., navigate to details page)
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add functionality to create a new capsule
              },
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.add),
            ),
          );
        }
      },
    );
  }
}
