import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:open_filex/open_filex.dart';

void main() {
  runApp(const SalyanFileManager());
}

class SalyanFileManager extends StatelessWidget {
  const SalyanFileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salyan File Manager',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const FileBrowser(path: "/storage/emulated/0"),
    );
  }
}

class FileBrowser extends StatefulWidget {
  final String path;
  const FileBrowser({super.key, required this.path});

  @override
  State<FileBrowser> createState() => _FileBrowserState();
}

class _FileBrowserState extends State<FileBrowser> {
  late Directory dir;
  late List<FileSystemEntity> items;

  @override
  void initState() {
    super.initState();
    dir = Directory(widget.path);
    items = dir.listSync();
  }

  void open(FileSystemEntity e) {
    if (e is Directory) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FileBrowser(path: e.path),
        ),
      );
    } else {
      OpenFilex.open(e.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.path),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) {
          final e = items[i];
          return ListTile(
            leading: Icon(e is Directory ? Icons.folder : Icons.insert_drive_file),
            title: Text(p.basename(e.path)),
            onTap: () => open(e),
          );
        },
      ),
    );
  }
}
