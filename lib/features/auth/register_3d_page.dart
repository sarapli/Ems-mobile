import 'package:flutter/material.dart';
import '../../core/animations/ems_3d_button.dart';

import 'package:go_router/go_router.dart';

class Register3DPage extends StatefulWidget {
  const Register3DPage({super.key});

  @override
  State<Register3DPage> createState() => _Register3DPageState();
}

class _Register3DPageState extends State<Register3DPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final List<String> _categories = [
    'Agent de guichet',
    'Chef d’agence',
    'Contrôleur',
    'Facturation',
    'Comptabilité',
    'Commercial',
    'Top management',
    'Administrateur technique',
    'Administrateur fonctionnel',
    'Client',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F7),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.92),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inscription',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nom complet',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Identifiant',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Catégorie',
                      border: OutlineInputBorder(),
                    ),
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ))
                        .toList(),
                    onChanged: (val) => setState(() => _selectedCategory = val),
                    validator: (value) => value == null ? 'Sélectionnez une catégorie' : null,
                  ),
                  const SizedBox(height: 32),
                  EMS3DButton(
                    label: 'S\'inscrire',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (_selectedCategory == 'Client') {
                          // Redirige vers l'espace client (à adapter)
                          Navigator.of(context).pushReplacementNamed('/dashboard-client');
                        } else {
                          // Redirige vers la page de login pour authentification
                          Navigator.of(context).pushReplacementNamed('/login');
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Déjà inscrit ? Se connecter'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double progress;
  _ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0033A0).withOpacity(0.12)
      ..style = PaintingStyle.fill;
    for (int i = 0; i < 18; i++) {
      final dx = size.width * (i / 18.0);
      final dy = size.height * (0.4 + 0.2 * (progress + i % 3));
      canvas.drawCircle(Offset(dx, dy), 18 + 8 * (progress), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
