import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/feature_cycle.dart';

class EMS3DScaffold extends StatelessWidget {
  final String title;
  final String currentRoute;
  final Widget body;
  final String? backgroundImageAsset;
  final bool showGo;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final Color? backgroundColor; // when set, use plain color instead of background image + gradient

  const EMS3DScaffold({
    super.key,
    required this.title,
    required this.currentRoute,
    required this.body,
    this.backgroundImageAsset,
    this.showGo = true,
    this.actions,
    this.titleWidget,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: backgroundColor == null, // only overlay when using image background
      appBar: AppBar(
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: 0,
        title: titleWidget ?? Text(title),
        actions: [
          ...?actions,
          if (showGo)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () => context.go(FeatureCycle.next(currentRoute)),
                child: const Text('Go'),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          if (backgroundColor != null)
            Positioned.fill(child: Container(color: backgroundColor))
          else ...[
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
                      Colors.black.withValues(alpha: 0.10),
                      Colors.black.withValues(alpha: 0.40),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
