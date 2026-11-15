class Annonce {
  final String id;
  final String titre;
  final int prix;
  final String type;
  final String quartier;
  final DateTime dateDispo;
  final String contact;
  final bool meuble;

  const Annonce({
    required this.id,
    required this.titre,
    required this.prix,
    required this.type,
    required this.quartier,
    required this.dateDispo,
    required this.contact,
    required this.meuble,
  });
}