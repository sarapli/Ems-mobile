import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class CommercialPage extends StatelessWidget {
  const CommercialPage({super.key});
  static const String routePath = '/commercial';

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
            icon: Icons.request_quote_outlined,
            title: 'Devis (Pro forma)',
            subtitle: 'Établir des devis pour les clients',
          ),
          EMSFeatureTile(
            icon: Icons.groups_outlined,
            title: 'Clients & abonnements',
            subtitle: 'Gestion des comptes et contrats',
          ),
          EMSFeatureTile(
            icon: Icons.campaign_outlined,
            title: 'Campagnes commerciales',
            subtitle: 'Promotions, offres et suivi',
          ),
          EMSFeatureTile(
            icon: Icons.trending_up_outlined,
            title: 'Statistiques commerciales',
            subtitle: 'Volumes, revenus, tendances',
          ),
          EMSFeatureTile(
            icon: Icons.description_outlined,
            title: 'Rapports',
            subtitle: 'Synthèses et exports',
          ),
          EMSFeatureTile(
            icon: Icons.support_agent_outlined,
            title: 'Assistance & support',
            subtitle: 'Suivi des demandes clients',
          ),
        ],
      ),
    );
  }
}
