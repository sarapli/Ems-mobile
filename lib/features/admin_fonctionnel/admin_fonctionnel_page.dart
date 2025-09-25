import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class AdminFonctionnelPage extends StatelessWidget {
  const AdminFonctionnelPage({super.key});
  static const String routePath = '/admin_fonctionnel';

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
            icon: Icons.rule_folder_outlined,
            title: 'Règles Métier',
            subtitle: 'Configuration des processus et validations',
          ),
          EMSFeatureTile(
            icon: Icons.description_outlined,
            title: 'Modèles de documents',
            subtitle: 'Bordereaux, manifestes, rapports',
          ),
          EMSFeatureTile(
            icon: Icons.tune_outlined,
            title: 'Paramétrage fonctionnel',
            subtitle: 'Catégories, motifs, statuts',
          ),
          EMSFeatureTile(
            icon: Icons.school_outlined,
            title: 'Guides & Formations',
            subtitle: 'Aide en ligne et procédures',
          ),
        ],
      ),
    );
  }
}
