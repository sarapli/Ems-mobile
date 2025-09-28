import 'package:flutter/material.dart';
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
      title: '',
      currentRoute: routePath,
      backgroundColor: Colors.white,
      titleWidget: Row(
        children: [
          const SizedBox(width: 4),
          const _Logo(),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins', color: Color(0xFF111827))),
          const SizedBox(width: 16),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SizedBox(
                height: 42,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Rechercher un envoi, dépêche, client…',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Color(0xFFE5ECFF)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Color(0xFFE5ECFF)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: const [
        SizedBox(width: 8),
        _HeaderActionIcon(icon: Icons.notifications_none_outlined, badgeCount: 2),
        SizedBox(width: 8),
        CircleAvatar(radius: 18, backgroundColor: Color(0xFFE5ECFF), child: Icon(Icons.person, color: Color(0xFF1F2937))),
        SizedBox(width: 8),
      ],
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

class _Logo extends StatelessWidget {
  const _Logo();
  @override
  Widget build(BuildContext context) => Image.asset('image/Logo_EMS.PNG', height: 24);
}

class _HeaderActionIcon extends StatelessWidget {
  final IconData icon;
  final int? badgeCount;
  const _HeaderActionIcon({required this.icon, this.badgeCount});
  @override
  Widget build(BuildContext context) {
    final hasBadge = (badgeCount ?? 0) > 0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE5ECFF)),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Icon(icon, color: const Color(0xFF1F2937)),
        ),
        if (hasBadge)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: const Color(0xFFEF4444), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white, width: 2)),
              child: Text('${badgeCount!}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
            ),
          ),
      ],
    );
  }
}
