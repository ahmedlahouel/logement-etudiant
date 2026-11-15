import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PublierScreen extends StatefulWidget {
  const PublierScreen({super.key});

  @override
  State<PublierScreen> createState() => _PublierScreenState();
}

class _PublierScreenState extends State<PublierScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titreCtrl = TextEditingController();
  final _prixCtrl = TextEditingController();
  final _contactCtrl = TextEditingController();

  AutovalidateMode _mode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _titreCtrl.dispose();
    _prixCtrl.dispose();
    _contactCtrl.dispose();
    super.dispose();
  }

  String? _validerTitre(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Le titre est obligatoire';
    }
    if (v.trim().length < 3) {
      return 'Au moins 3 caractères';
    }
    return null;
  }

  String? _validerPrix(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Le prix est obligatoire';
    }
    final prix = int.tryParse(v.trim());
    if (prix == null || prix <= 0) {
      return 'Entrez un prix supérieur à 0';
    }
    return null;
  }

  String? _validerContact(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Le contact est obligatoire';
    }
    if (!RegExp(r'^\d{8}$').hasMatch(v.trim())) {
      return '8 chiffres attendus';
    }
    return null;
  }

  void _valider() {
    setState(() => _mode = AutovalidateMode.onUserInteraction);
    if (!_formKey.currentState!.validate()) return;

    // Provisoire : l'étape 5 renverra l'annonce avec pop
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Annonce valide : ${_titreCtrl.text.trim()}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publier une annonce')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _mode,
          child: Column(
            children: [
              TextFormField(
                controller: _titreCtrl,
                decoration: const InputDecoration(
                  labelText: 'Titre',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                validator: _validerTitre,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prixCtrl,
                decoration: const InputDecoration(
                  labelText: 'Prix mensuel (DT)',
                  prefixIcon: Icon(Icons.payments_outlined),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputAction: TextInputAction.next,
                validator: _validerPrix,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contactCtrl,
                decoration: const InputDecoration(
                  labelText: 'Contact (téléphone)',
                  prefixIcon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8),
                ],
                validator: _validerContact,
              ),
              // 4b : type, quartier, date, meublé viendront ici
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: _valider,
            child: const Text('Publier'),
          ),
        ),
      ),
    );
  }
}