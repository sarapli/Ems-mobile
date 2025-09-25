import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class TopManagementPage extends StatelessWidget {
  const TopManagementPage({super.key});
  static const String routePath = '/top_management';

  @override
  Widget build(BuildContext context) {
    final title = FeatureCycle.labelOf(routePath);
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1200 ? 4 : width > 900 ? 3 : width > 600 ? 2 : 1;

    return EMS3DScaffold(
      title: title,
      currentRoute: routePath,
      backgroundImageAsset: 'image/bckround_authentification.PNG',
      body: GridView.count(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: const [
          EMSFeatureTile(
            icon: Icons.bar_chart_outlined,
            title: 'Statistiques',
            subtitle: 'Recettes, volumes, délais',
          ),
          EMSFeatureTile(
            icon: Icons.insights_outlined,
            title: 'Tableaux de bord',
            subtitle: 'KPIs temps réel',
          ),
          EMSFeatureTile(
            icon: Icons.trending_up_outlined,
            title: 'Tendances',
            subtitle: 'Origine, destination, type d’envoi',
          ),
          EMSFeatureTile(
            icon: Icons.summarize_outlined,
            title: 'Rapports exécutifs',
            subtitle: 'Synthèses et exports',
          ),
        ],
      ),
    );
  }
}
