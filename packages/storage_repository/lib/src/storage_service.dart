import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService({FirebaseStorage? firebaseStorage})
      : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;
  final FirebaseStorage _firebaseStorage;

  Future<String> uploadFile(File file, String path) async {
    try {
      final ref = _firebaseStorage.ref().child(path);
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('File upload failed: $e');
    }
  }
}
