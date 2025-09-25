import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/feature_cycle.dart';

class EMS3DScaffold extends StatelessWidget {
  final String title;
  final String currentRoute;
  final Widget body;
  final String? backgroundImageAsset;
  final bool showGo;

  const EMS3DScaffold({
    super.key,
    required this.title,
    required this.currentRoute,
    required this.body,
    this.backgroundImageAsset,
    this.showGo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
        actions: [
          if (showGo)
            TextButton(
              onPressed: () => context.go(FeatureCycle.next(currentRoute)),
              child: const Text('Go'),
            )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: backgroundImageAsset != null
                ? Image.asset(backgroundImageAsset!, fit: BoxFit.cover)
                : Container(color: const Color(0xFF0D1B2A)),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.10),
                    Colors.black.withOpacity(0.40),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
