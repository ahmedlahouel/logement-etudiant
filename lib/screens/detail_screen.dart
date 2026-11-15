import 'package:flutter/material.dart';

import '../models/annonce.dart';
import 'favoris_screen.dart';

class DetailScreen extends StatelessWidget {
  final Annonce annonce;

  const DetailScreen({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(annonce.titre),
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
      body: Center(child: Text('${annonce.prix} DT · ${annonce.quartier}')),
    );
  }
}
