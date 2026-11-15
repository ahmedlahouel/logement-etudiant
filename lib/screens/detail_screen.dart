import 'package:flutter/material.dart';
import '../models/annonce.dart';

class DetailScreen extends StatelessWidget {
  final Annonce annonce;

  const DetailScreen({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(annonce.titre)),
      body: Center(child: Text('${annonce.prix} DT · ${annonce.quartier}')),
    );
  }
}