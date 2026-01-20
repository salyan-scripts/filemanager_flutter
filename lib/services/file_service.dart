import 'dart:io';

class FileService {
  static List<FileSystemEntity> list(String path) {
    final dir = Directory(path);
    if (!dir.existsSync()) return [];
    return dir.listSync();
  }
}
