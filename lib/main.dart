import 'package:flutter/material.dart';

void main() {
  runApp(const SalyanFileManager());
}

class SalyanFileManager extends StatelessWidget {
  const SalyanFileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salyan File Manager',
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: Center(child: Text('Salyan File Manager')),
      ),
    );
  }
}
