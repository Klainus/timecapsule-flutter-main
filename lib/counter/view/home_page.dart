import 'package:as_boilerplate_flutter/add_capsule/models/hive.dart';
import 'package:as_boilerplate_flutter/counter/widgets/capsule_card.dart';
import 'package:as_boilerplate_flutter/counter/widgets/capsule_deletion_modal.dart';
import 'package:as_boilerplate_flutter/counter/widgets/capsule_details_modal.dart';
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
            ),
            body: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box<TimeCapsule> box, _) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text(
                      'No capsules yet!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final capsule = box.getAt(index);
                      return CapsuleCard(
                        onDelete: () {
                          CapsuleDeletionConfirmation
                              .showDeleteConfirmationDialog(
                            context: context,
                            onDelete: () {
                              box.deleteAt(index);
                            },
                          );
                        },
                        title: capsule?.title ?? 'No Title',
                        thoughts: capsule?.thoughts ?? 'No Thoughts',
                        revealDate: capsule?.revealDate ?? DateTime.now(),
                        onTap: () {
                          CapsuleDetailsBottomSheet.show(
                            context: context,
                            capsule: capsule,
                            onDelete: () {
                              box.deleteAt(index);
                            },
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
