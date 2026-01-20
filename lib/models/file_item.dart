import 'dart:io';

class FileItem {
  final FileSystemEntity entity;

  FileItem(this.entity);

  String get name =>
      entity.path.split(Platform.pathSeparator).last;

  bool get isDirectory => entity is Directory;
}
