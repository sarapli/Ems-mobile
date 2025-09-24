import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/animations/ems_3d_button.dart';

class Dashboard3DPage extends StatelessWidget {
  const Dashboard3DPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard EMS 3D'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue la direction generale de la poste',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            EMS3DButton(
              label: 'Nouvel envoi professionnel',
              onTap: () {
                context.go('/capture-professionnel');
              },
            ),
          ],
        ),
      ),
    );
  }
}
