import 'package:flutter/material.dart';
import 'data/annonces_test.dart';
import 'widgets/annonce_card.dart';

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
      // Temporary home: shows the cards directly (no AccueilScreen needed)
      home: Scaffold(
        appBar: AppBar(title: const Text('Logement Étudiant')),
        body: ListView.builder(
          itemCount: annoncesTest.length, // <- name of your list in annonces_test.dart
          itemBuilder: (context, index) {
            return AnnonceCard(annonce: annoncesTest[index]);
          },
        ),
      ),
    );
  }
}