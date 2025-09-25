import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class ControleurPage extends StatelessWidget {
  const ControleurPage({super.key});
  static const String routePath = '/controleur';

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
            icon: Icons.rule_sharp,
            title: 'Contrôle des envois',
            subtitle: 'Vérification des statuts et règles',
          ),
          EMSFeatureTile(
            icon: Icons.schedule_outlined,
            title: 'Envois en retard',
            subtitle: 'Suivi des retards de livraison',
          ),
          EMSFeatureTile(
            icon: Icons.pending_actions_outlined,
            title: 'Envois en instance',
            subtitle: 'Motifs et actions recommandées',
          ),
          EMSFeatureTile(
            icon: Icons.public_outlined,
            title: 'Expédiés par destination',
            subtitle: 'Analyses par pays/bureau',
          ),
          EMSFeatureTile(
            icon: Icons.analytics_outlined,
            title: 'Statistiques de contrôle',
            subtitle: 'Origine, type, poids',
          ),
          EMSFeatureTile(
            icon: Icons.description_outlined,
            title: 'Rapports',
            subtitle: 'Listes, synthèses et exports',
          ),
        ],
      ),
    );
  }
}
