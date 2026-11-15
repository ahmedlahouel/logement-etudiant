import 'package:flutter/material.dart';
import '../models/annonce.dart';
import '../screens/detail_screen.dart';

class AnnonceCard extends StatelessWidget {
  final Annonce annonce;

  const AnnonceCard({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(annonce: annonce),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ligne 1 : titre à gauche, prix à droite
              Row(
                children: [
                  Expanded(
                    child:
                      Text(
                        annonce.titre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                      Text(
                        '${annonce.prix} DT',
                        style: TextStyle(
                          color: cs.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 8),

              // Ligne 2 : icône + type et quartier
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: cs.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    '${annonce.type} · ${annonce.quartier}',
                    style: TextStyle(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Ligne 3 : meublé et date de disponibilité
              Row(
                children: [
                  Icon(
                    annonce.meuble ? Icons.chair_outlined : Icons.block,
                    size: 16,
                    color: cs.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    annonce.meuble ? 'Meublé' : 'Non meublé',
                    style: TextStyle(color: cs.onSurfaceVariant),
                  ),
                  const Spacer(),
                  Icon(Icons.event, size: 16, color: cs.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    '${annonce.dateDispo.day}/${annonce.dateDispo.month}/${annonce.dateDispo.year}',
                    style: TextStyle(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}