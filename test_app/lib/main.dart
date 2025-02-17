import 'package:flutter/material.dart';
import 'package:test_app/modules/home/presentation/home_screen.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
