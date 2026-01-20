import 'package:flutter/material.dart';
import 'screens/browser_screen.dart';

void main() {
  runApp(const SalyanFileManager());
}

class SalyanFileManager extends StatelessWidget {
  const SalyanFileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salyan File Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blueGrey,
      ),
      home: const BrowserScreen(),
    );
  }
}
