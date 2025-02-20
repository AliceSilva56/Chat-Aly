import 'package:flutter/material.dart';
import 'message_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remover a fita de debug
      home: MessageScreen(),
    );
  }
}