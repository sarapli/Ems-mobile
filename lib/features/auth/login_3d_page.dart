import 'package:flutter/material.dart';
import '../../core/animations/ems_3d_button.dart';

class Login3DPage extends StatefulWidget {
  const Login3DPage({super.key});

  @override
  State<Login3DPage> createState() => _Login3DPageState();
}

class _Login3DPageState extends State<Login3DPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F7),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/Laposte.PNG',
              fit: BoxFit.cover,
            ),
          ),
          // Animation de fond 3D (particules simplifiées)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _ParticlePainter(_controller.value),
                child: Container(),
              );
            },
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EMS Sénégal',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
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
                      labelText: 'Mot de passe',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  EMS3DButton(
                    label: 'Connexion',
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
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
