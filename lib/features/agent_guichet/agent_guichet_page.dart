import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/ems_3d_scaffold.dart';

class AgentGuichetPage extends StatelessWidget {
  const AgentGuichetPage({super.key});
  static const String routePath = '/agent_guichet';

  @override
  Widget build(BuildContext context) {

    // Sidebar items as in the screenshot (labels only, no red elements considered)
    final sidebarItems = <(_SidebarIcon, String)>[
      (_SidebarIcon(icon: Icons.inventory_2_outlined, color: const Color(0xFF3671E9)), 'Saisie des envois'),
      (_SidebarIcon(icon: Icons.qr_code_2_outlined, color: const Color(0xFF23A566)), 'Impression bordereaux'),
      (_SidebarIcon(icon: Icons.sync_alt_outlined, color: const Color(0xFF7A5AF8)), 'Transmission des envois'),
      (_SidebarIcon(icon: Icons.work_history_outlined, color: const Color(0xFFE8703A)), 'Fermeture des dépêches'),
      (_SidebarIcon(icon: Icons.inbox_outlined, color: const Color(0xFF23A566)), 'Réception des dépêches'),
      (_SidebarIcon(icon: Icons.mark_email_read_outlined, color: const Color(0xFF7A5AF8)), 'Réception des envois'),
      (_SidebarIcon(icon: Icons.verified_outlined, color: const Color(0xFF23A566)), 'Mise à jour statuts'),
    ];

    return EMS3DScaffold(
      // Header pro avec logo + titre
      title: '',
      currentRoute: routePath,
      backgroundColor: Colors.white,
      titleWidget: Row(
        children: [
          const SizedBox(width: 4),
          _Logo(),
          const SizedBox(width: 12),
          const Text(
            'Agent_Guichet',
            style: TextStyle(
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
      actions: [
        const SizedBox(width: 8),
        const _ActionIcon(icon: Icons.notifications_none_outlined, badgeCount: 2),
        const SizedBox(width: 8),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xFFE5ECFF),
          child: Icon(Icons.person, color: Color(0xFF1F2937)),
        ),
        const SizedBox(width: 8),
      ],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
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
                    const Text(
                      'Tableau de bord',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.separated(
                        itemCount: sidebarItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 6),
                        itemBuilder: (context, index) {
                          final item = sidebarItems[index];
                          VoidCallback? onTap;
                          if (index == 0) {
                            // Saisie des envois
                            onTap = () => context.go('/agent_guichet/saisie_envois');
                          } else if (index == 1) {
                            onTap = () => context.go('/agent_guichet/impression_bordereaux');
                          } else if (index == 2) {
                            onTap = () => context.go('/agent_guichet/transmission_envois');
                          } else if (index == 3) {
                            onTap = () => context.go('/agent_guichet/fermeture_depeches');
                          } else if (index == 4) {
                            onTap = () => context.go('/agent_guichet/reception_depeches');
                          } else if (index == 5) {
                            onTap = () => context.go('/agent_guichet/reception_envois');
                          } else if (index == 6) {
                            onTap = () => context.go('/agent_guichet/mise_a_jour_statuts');
                          }
                          return _SidebarTile(icon: item.$1, label: item.$2, onTap: onTap);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Main content: vide comme demandé
          const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final int? badgeCount;

  const _ActionIcon({required this.icon, this.badgeCount});

  @override
  Widget build(BuildContext context) {
    final hasBadge = (badgeCount ?? 0) > 0;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.92),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFFE5ECFF)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
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
                child: Text(
                  '${badgeCount!}',
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  final _SidebarIcon icon;
  final String label;
  final VoidCallback? onTap;

  const _SidebarTile({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
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

// Header logo widget
class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('image/Logo_EMS.PNG', height: 24);
  }
}
