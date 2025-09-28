import 'package:flutter/material.dart';
import '../../core/routing/feature_cycle.dart';
import '../../core/widgets/ems_3d_scaffold.dart';

class ChefAgencePage extends StatelessWidget {
  const ChefAgencePage({super.key});
  static const String routePath = '/chef_agence';

  @override
  Widget build(BuildContext context) {
    final title = FeatureCycle.labelOf(routePath);

    // Sidebar items derived from previous GridView content
    final sidebarItems = <_SidebarEntry>[
      _SidebarEntry(_SidebarIcon(icon: Icons.assignment_ind_outlined, color: const Color(0xFF3671E9)), 'Affecter les envois'),
      _SidebarEntry(_SidebarIcon(icon: Icons.pending_actions_outlined, color: const Color(0xFF7A5AF8)), 'Mise en instance'),
      _SidebarEntry(_SidebarIcon(icon: Icons.mark_email_read_outlined, color: const Color(0xFF23A566)), 'Réception & Livraison'),
      _SidebarEntry(_SidebarIcon(icon: Icons.article_outlined, color: const Color(0xFFFF6B35)), 'Avis d’arrivée'),
      _SidebarEntry(_SidebarIcon(icon: Icons.summarize_outlined, color: const Color(0xFF7A5AF8)), 'Rapports de situation'),
    ];

    return EMS3DScaffold(
      title: '',
      currentRoute: routePath,
      backgroundColor: Colors.white,
      titleWidget: Row(
        children: [
          const SizedBox(width: 4),
          const _Logo(),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              color: Color(0xFF111827),
            ),
          ),
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
        CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xFFE5ECFF),
          child: Icon(Icons.person, color: Color(0xFF1F2937)),
        ),
        SizedBox(width: 8),
      ],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 220, maxWidth: 260),
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tableau de bord', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.separated(
                        itemCount: sidebarItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 6),
                        itemBuilder: (context, index) {
                          final item = sidebarItems[index];
                          return _SidebarTile(icon: item.icon, label: item.label);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _SidebarEntry {
  final _SidebarIcon icon;
  final String label;
  const _SidebarEntry(this.icon, this.label);
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
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Icon(icon, color: const Color(0xFF1F2937)),
        ),
        if (hasBadge)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text('${badgeCount!}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
            ),
          ),
      ],
    );
  }
}

class _SidebarTile extends StatelessWidget {
  final _SidebarIcon icon;
  final String label;
  const _SidebarTile({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1F2937)),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _SidebarIcon({required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color),
    );
  }
}
