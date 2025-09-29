import 'package:flutter/material.dart';
import '../../core/widgets/ems_3d_scaffold.dart';

class ReceptionEnvoisPage extends StatefulWidget {
  const ReceptionEnvoisPage({super.key});
  static const String routePath = '/agent_guichet/reception_envois';

  @override
  State<ReceptionEnvoisPage> createState() => _ReceptionEnvoisPageState();
}

class _ReceptionEnvoisPageState extends State<ReceptionEnvoisPage> {
  final _formKey = GlobalKey<FormState>();
  final _searchCtrl = TextEditingController();
  String? _etat;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EMS3DScaffold(
      title: '',
      currentRoute: ReceptionEnvoisPage.routePath,
      backgroundColor: Colors.white,
      titleWidget: const _Title(icon: Icons.mark_email_read_outlined, text: 'Réception des envois'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionCard(children: [
                    const _SectionHeader(icon: Icons.filter_alt_outlined, title: 'Filtres'),
                    const SizedBox(height: 8),
                    LayoutBuilder(builder: (context, c) {
                      final wide = c.maxWidth > 760;
                      return GridView.count(
                        crossAxisCount: wide ? 3 : 1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _field('Recherche', TextFormField(controller: _searchCtrl, decoration: _decoration(hint: 'N° envoi, client...'))),
                          _field('État', DropdownButtonFormField<String>(
                            value: _etat,
                            items: const [
                              DropdownMenuItem(value: 'Tous', child: Text('Tous')),
                              DropdownMenuItem(value: 'En transit', child: Text('En transit')),
                              DropdownMenuItem(value: 'Arrivé', child: Text('Arrivé')),
                            ],
                            onChanged: (v) => setState(() => _etat = v),
                            decoration: _decoration(hint: 'Sélectionner'),
                          )),
                          _field('Action rapide', ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner), label: const Text('Scanner'))),
                        ],
                      );
                    }),
                    const SizedBox(height: 12),
                    Row(children: [
                      ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.search), label: const Text('Rechercher')),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.download_done_outlined), label: const Text('Confirmer réception sélection')),
                    ]),
                  ]),
                  const SizedBox(height: 16),
                  _sectionCard(children: [
                    const _SectionHeader(icon: Icons.list_alt_outlined, title: 'Résultats'),
                    const SizedBox(height: 8),
                    _resultsPlaceholder(),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _resultsPlaceholder() => Container(
        height: 320,
        decoration: _panelDecoration(),
        child: const Center(child: Text('Tableau des envois à réceptionner (placeholder)')),
      );

  // ---- UI Helpers ----
  Widget _sectionCard({required List<Widget> children}) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFFFFFF), Color(0xFFF0F4FF)]),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), offset: const Offset(0, 10), blurRadius: 24)],
          border: Border.all(color: const Color(0xFFE5ECFF)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
      );

  BoxDecoration _panelDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      );

  InputDecoration _decoration({String? hint}) => InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE5ECFF))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE5ECFF))),
        filled: true,
        fillColor: Colors.white,
      );

  Widget _field(String label, Widget child) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        child,
      ]);
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SectionHeader({required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(color: const Color(0xFF0033A0).withOpacity(0.10), borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: const Color(0xFF0033A0)),
      ),
      const SizedBox(width: 8),
      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    ]);
  }
}

class _Title extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Title({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: const Color(0xFF7A5AF8).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: const Color(0xFF7A5AF8)),
      ),
      const SizedBox(width: 8),
      Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    ]);
  }
}
