import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class ComptabilitePage extends StatelessWidget {
  const ComptabilitePage({super.key});
  static const String routePath = '/comptabilite';

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
            icon: Icons.receipt_long_outlined,
            title: 'Facturation',
            subtitle: 'Validation et comptabilisation',
          ),
          EMSFeatureTile(
            icon: Icons.attach_money_outlined,
            title: 'Encaissements',
            subtitle: 'Saisie et rapprochement',
          ),
          EMSFeatureTile(
            icon: Icons.money_off_csred_outlined,
            title: 'Décaissements',
            subtitle: 'Gestion des sorties',
          ),
          EMSFeatureTile(
            icon: Icons.list_alt_outlined,
            title: 'Brouillard de caisse',
            subtitle: 'Consolidation et édition',
          ),
          EMSFeatureTile(
            icon: Icons.query_stats_outlined,
            title: 'Statistiques financières',
            subtitle: 'Recettes, dépenses, marges',
          ),
          EMSFeatureTile(
            icon: Icons.description_outlined,
            title: 'Rapports comptables',
            subtitle: 'Exports et synthèses',
          ),
        ],
      ),
    );
  }
}
