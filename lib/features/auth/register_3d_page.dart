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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Inscription'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/bckround_authentification.PNG',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.45),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 520),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 36),
                margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.98),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 40,
                      offset: const Offset(0, 16),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFF0033A0), width: 1.2),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'image/bckround_authentification.PNG',
                              height: 44,
                              width: 44,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Inscription',
                            style: TextStyle(
                              fontFamily: 'Arimo',
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: const Color(0xFF0033A0),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nom complet',
                          prefixIcon: const Icon(Icons.person_outline_rounded, color: Color(0xFF0033A0)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF0033A0)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Identifiant',
                          prefixIcon: const Icon(Icons.badge_outlined, color: Color(0xFF0033A0)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF0033A0)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                      ),
                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: InputDecoration(
                          labelText: 'Catégorie',
                          prefixIcon: const Icon(Icons.category_outlined, color: Color(0xFF0033A0)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
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
                      const SizedBox(height: 36),
                      EMS3DButton(
                        label: 'S\'inscrire',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.go('/login');
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            context.go('/login');
                          },
                          child: const Text('Déjà inscrit ? Se connecter', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
