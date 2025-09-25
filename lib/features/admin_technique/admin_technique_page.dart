import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class AdminTechniquePage extends StatelessWidget {
  const AdminTechniquePage({super.key});
  static const String routePath = '/admin_technique';

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
        children: [
          EMSFeatureTile(
            icon: Icons.admin_panel_settings_outlined,
            title: 'Droits d’accès',
            subtitle: 'Gestion des rôles et permissions par position',
            onTap: () {},
          ),
          EMSFeatureTile(
            icon: Icons.storage_outlined,
            title: 'Synchronisation IPS.POST',
            subtitle: 'Paramétrer l’API et la mise à jour des bases',
            onTap: () {},
          ),
          EMSFeatureTile(
            icon: Icons.analytics_outlined,
            title: 'Outil d’analyse',
            subtitle: 'Dashboards techniques et logs',
            onTap: () {},
          ),
          EMSFeatureTile(
            icon: Icons.settings_suggest_outlined,
            title: 'Paramètres système',
            subtitle: 'Services, intégrations, sécurité',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
