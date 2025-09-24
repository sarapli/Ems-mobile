import 'package:flutter/material.dart';

class Dashboard3DPage extends StatelessWidget {
  const Dashboard3DPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard EMS 3D'),
      ),
      body: Center(
        child: Text(
          'Bienvenue sur le Dashboard 3D EMS',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
