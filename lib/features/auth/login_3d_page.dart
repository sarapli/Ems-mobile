import 'package:flutter/material.dart';
import '../../core/animations/ems_3d_button.dart';
import 'package:go_router/go_router.dart';

class Login3DPage extends StatefulWidget {
  const Login3DPage({super.key});

  @override
  State<Login3DPage> createState() => _Login3DPageState();
}

class _Login3DPageState extends State<Login3DPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('EMS Sénégal'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/bckround_authentification.PNG',
              fit: BoxFit.cover,
            ),
          ),
          // Voile dégradé pour améliorer la lisibilité
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.45),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.90),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock_outline, color: Color(0xFF0033A0), size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Authentification',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: const Color(0xFF0033A0),
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: 'Identifiant',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      labelText: 'Mot de passe',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (_) {}),
                      const Text('Se souvenir de moi'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Mot de passe oublié ?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  EMS3DButton(
                    label: 'Connexion',
                    onTap: () {
                      // Après authentification, redirige vers la page code secret (démo, à adapter selon le rôle)
                      context.go('/code-secret');
                    },
                  ),
                  const SizedBox(height: 12),
                  EMS3DButton(
                    label: "S'inscrire",
                    onTap: () {
                      // Redirige vers la page d'inscription
                      context.go('/register');
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '© ${DateTime.now().year} EMS Sénégal',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

