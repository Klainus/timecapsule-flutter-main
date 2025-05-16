import 'dart:io';

import 'storage_service.dart';

class StorageRepository {
  StorageRepository({StorageService? storageService})
      : _storageService = storageService ?? StorageService();
  final StorageService _storageService;

  Future<String> uploadFile(File file, String path) {
    return _storageService.uploadFile(file, path);
  }
}
