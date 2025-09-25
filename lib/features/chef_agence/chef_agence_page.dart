import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class ChefAgencePage extends StatelessWidget {
  const ChefAgencePage({super.key});
  static const String routePath = '/chef_agence';

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
            icon: Icons.assignment_ind_outlined,
            title: 'Affecter les envois',
            subtitle: 'Aux agents distributeurs',
          ),
          EMSFeatureTile(
            icon: Icons.pending_actions_outlined,
            title: 'Mise en instance',
            subtitle: 'Motifs & actions à mener',
          ),
          EMSFeatureTile(
            icon: Icons.mark_email_read_outlined,
            title: 'Réception & Livraison',
            subtitle: 'Suivi des livraisons, en différé/manuelle',
          ),
          EMSFeatureTile(
            icon: Icons.article_outlined,
            title: 'Avis d’arrivée',
            subtitle: 'Génération des avis',
          ),
          EMSFeatureTile(
            icon: Icons.summarize_outlined,
            title: 'Rapports de situation',
            subtitle: 'Journalière, mensuelle, annuelle',
          ),
        ],
      ),
    );
  }
}
