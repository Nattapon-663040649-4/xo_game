import 'package:flutter/material.dart';
import 'screens/main_menu_screen.dart';

void main() {
  runApp(const XOGameApp());
}

class XOGameApp extends StatelessWidget {
  const XOGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MainMenuScreen(),
    );
  }
}
