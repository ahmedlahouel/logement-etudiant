import 'package:flutter/material.dart';

import '../data/annonces_test.dart';
import '../widgets/annonce_card.dart';
import '../widgets/search_box.dart';
import 'favoris_screen.dart';
import 'publier_screen.dart';

class AccueilScreen extends StatefulWidget {
  const AccueilScreen({super.key});

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logement Étudiant'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavorisScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBox(onChanged: (texte) {}),
          Expanded(
            child: ListView(
              children: annoncesTest
                  .map((a) => AnnonceCard(annonce: a))
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PublierScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
