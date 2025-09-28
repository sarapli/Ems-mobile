import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/animations/ems_3d_button.dart';

class ProfessionalCapture3DPage extends StatefulWidget {
  const ProfessionalCapture3DPage({super.key});

  @override
  State<ProfessionalCapture3DPage> createState() => _ProfessionalCapture3DPageState();
}

class _ProfessionalCapture3DPageState extends State<ProfessionalCapture3DPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0033A0),
        title: Row(
          children: [
            Image.asset(
              'image/Laposte.PNG',
              height: 40,
            ),
            const SizedBox(width: 12),
            Text(
              'EMS Sénégal',
              style: GoogleFonts.arimo(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.2),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(32),
                margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enregistrement d\'un envoi professionnel',
                      style: GoogleFonts.arimo(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0033A0),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Nom du client',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Téléphone',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Adresse',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Type d\'envoi',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Poids (kg)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Destination',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Nature de l\'envoi',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Observations',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        EMS3DButton(
                          label: 'Enregistrer',
                          onTap: () {
                            // Action d'enregistrement (à compléter plus tard)
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Envoi enregistré (démo frontend)')),
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        EMS3DButton(
                          label: 'Annuler',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
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

