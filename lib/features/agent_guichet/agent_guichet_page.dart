import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class AgentGuichetPage extends StatelessWidget {
  const AgentGuichetPage({super.key});
  static const String routePath = '/agent_guichet';

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
            icon: Icons.add_box_outlined,
            title: 'Saisie des envois',
            subtitle: 'Nationaux & Internationaux (abonné, occasionnel)'
          ),
          EMSFeatureTile(
            icon: Icons.qr_code_2_outlined,
            title: 'Impression bordereaux',
            subtitle: 'Transport avec codes à barres'
          ),
          EMSFeatureTile(
            icon: Icons.send_outlined,
            title: 'Transmission des envois',
            subtitle: 'Vers bureaux suivants'
          ),
          EMSFeatureTile(
            icon: Icons.work_history_outlined,
            title: 'Fermeture des dépêches',
            subtitle: 'Préparation et clôture'
          ),
          EMSFeatureTile(
            icon: Icons.inbox_outlined,
            title: 'Réception des dépêches',
            subtitle: 'Bureau suivant'
          ),
          EMSFeatureTile(
            icon: Icons.mark_email_read_outlined,
            title: 'Réception des envois',
            subtitle: 'Enregistrement des arrivées'
          ),
          EMSFeatureTile(
            icon: Icons.update,
            title: 'Mise à jour statuts',
            subtitle: 'Envois reçus'
          ),
          EMSFeatureTile(
            icon: Icons.search_outlined,
            title: 'Recherche',
            subtitle: 'Par numéro, dépêche, bureau, date, client'
          ),
        ],
      ),
    );
  }
}
