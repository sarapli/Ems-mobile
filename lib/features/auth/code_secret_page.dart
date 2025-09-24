import 'package:flutter/material.dart';
import '../../core/animations/ems_3d_button.dart';

class CodeSecretPage extends StatefulWidget {
  final String? role;
  const CodeSecretPage({super.key, this.role});

  @override
  State<CodeSecretPage> createState() => _CodeSecretPageState();
}

class _CodeSecretPageState extends State<CodeSecretPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/backround_code_secret.png',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.90),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.role != null ? widget.role!.toUpperCase() : 'CODE SECRET',
                      style: const TextStyle(
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 26,
                        color: Color(0xFF0033A0),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Veuillez entrer le code secret de votre catégorie pour accéder à votre espace.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[800], fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _codeController,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        labelText: 'Code secret',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        suffixIcon: IconButton(
                          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                    ),
                    const SizedBox(height: 32),
                    EMS3DButton(
                      label: 'Valider',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Simuler la validation et la redirection selon le rôle
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Code secret accepté (démo frontend)')),
                          );
                          // TODO: Rediriger vers le dashboard de la catégorie
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
