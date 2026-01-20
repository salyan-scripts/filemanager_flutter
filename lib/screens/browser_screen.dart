import 'dart:io';
import 'package:flutter/material.dart';
import '../models/file_item.dart';
import '../services/file_service.dart';

class BrowserScreen extends StatefulWidget {
  const BrowserScreen({super.key});

  @override
  State<BrowserScreen> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  String currentPath = '/storage/emulated/0';
  List<FileItem> items = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() {
    items = FileService
        .list(currentPath)
        .map((e) => FileItem(e))
        .toList();
    setState(() {});
  }

  void open(FileItem item) {
    if (item.isDirectory) {
      currentPath = item.entity.path;
      load();
    }
  }

  IconData iconFor(FileItem item) {
    if (item.isDirectory) return Icons.folder;
    final n = item.name.toLowerCase();
    if (n.endsWith('.mp4') || n.endsWith('.mkv')) return Icons.movie;
    if (n.endsWith('.mp3')) return Icons.music_note;
    if (n.endsWith('.jpg') || n.endsWith('.png')) return Icons.image;
    return Icons.insert_drive_file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPath),
        leading: currentPath != '/storage/emulated/0'
            ? IconButton(
                icon: const Icon(Icons.arrow_upward),
                onPressed: () {
                  currentPath = Directory(currentPath).parent.path;
                  load();
                },
              )
            : null,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return ListTile(
            leading: Icon(iconFor(item)),
            title: Text(item.name),
            onTap: () => open(item),
          );
        },
      ),
    );
  }
}
