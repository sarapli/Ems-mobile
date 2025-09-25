import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';
import '../../core/widgets/ems_feature_tile.dart';

class FacturationPage extends StatelessWidget {
  const FacturationPage({super.key});
  static const String routePath = '/facturation';

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
            title: 'Factures clients',
            subtitle: 'Émission et impression des factures',
          ),
          EMSFeatureTile(
            icon: Icons.request_quote_outlined,
            title: 'Devis (pro forma)',
            subtitle: 'Établir un devis',
          ),
          EMSFeatureTile(
            icon: Icons.attach_money_outlined,
            title: 'Encaissements',
            subtitle: 'Enregistrer les paiements',
          ),
          EMSFeatureTile(
            icon: Icons.money_off_csred_outlined,
            title: 'Décaissements',
            subtitle: 'Enregistrer les sorties de caisse',
          ),
          EMSFeatureTile(
            icon: Icons.list_alt_outlined,
            title: 'Brouillard de caisse',
            subtitle: 'Édition et suivi',
          ),
          EMSFeatureTile(
            icon: Icons.local_shipping_outlined,
            title: 'Groupage maritime',
            subtitle: 'Paiement envois reçus par groupage',
          ),
        ],
      ),
    );
  }
}
