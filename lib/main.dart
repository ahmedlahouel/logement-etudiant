import 'package:flutter/material.dart';
import 'screens/publier_screen.dart';

void main() {
  runApp(const LogementApp());
}

class LogementApp extends StatelessWidget {
  const LogementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logement Étudiant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // change it to your color
        ),
      ),
      // Temporary home: opens the form directly for testing
      home: const PublierScreen(),
    );
  }
}