import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});
  static const String routePath = '/client';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(FeatureCycle.labelOf(routePath)),
        actions: [
          TextButton(
            onPressed: () => context.go(FeatureCycle.next(routePath)),
            child: const Text('Go'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/Backround_client.PNG',
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
                    Colors.black.withOpacity(0.10),
                    Colors.black.withOpacity(0.35),
                  ],
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Espace CLIENT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
