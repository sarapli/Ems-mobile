import 'package:flutter/material.dart';
import '../../core/widgets/ems_3d_scaffold.dart';

class FermetureDepechesPage extends StatefulWidget {
  const FermetureDepechesPage({super.key});
  static const String routePath = '/agent_guichet/fermeture_depeches';

  @override
  State<FermetureDepechesPage> createState() => _FermetureDepechesPageState();
}

class _FermetureDepechesPageState extends State<FermetureDepechesPage> {
  final _formKey = GlobalKey<FormState>();
  String? _depeche;
  String? _bureau;
  final _observations = TextEditingController();

  @override
  void dispose() {
    _observations.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EMS3DScaffold(
      title: '',
      currentRoute: FermetureDepechesPage.routePath,
      backgroundColor: Colors.white,
      titleWidget: const _Title(icon: Icons.work_history_outlined, text: 'Fermeture des dépêches'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionCard(children: [
                    const _SectionHeader(icon: Icons.rule_folder_outlined, title: 'Informations'),
                    const SizedBox(height: 8),
                    LayoutBuilder(builder: (context, c) {
                      final wide = c.maxWidth > 760;
                      return GridView.count(
                        crossAxisCount: wide ? 2 : 1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _field('Dépêche', DropdownButtonFormField<String>(
                            value: _depeche,
                            items: const [DropdownMenuItem(value: 'Dépêche #001', child: Text('Dépêche #001'))],
                            onChanged: (v) => setState(() => _depeche = v),
                            decoration: _decoration(hint: 'Sélectionner une dépêche'),
                          )),
                          _field('Bureau', DropdownButtonFormField<String>(
                            value: _bureau,
                            items: _bureaux.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                            onChanged: (v) => setState(() => _bureau = v),
                            decoration: _decoration(hint: 'Sélectionner un bureau'),
                          )),
                        ],
                      );
                    }),
                    const SizedBox(height: 12),
                    _field('Observations', TextFormField(maxLines: 3, controller: _observations, decoration: _decoration(hint: 'Notes / remarques'))),
                    const SizedBox(height: 12),
                    Row(children: [
                      ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.lock_outline), label: const Text('Fermer la dépêche')),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.picture_as_pdf), label: const Text('Imprimer récapitulatif')),
                    ]),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
        decoration: BoxDecoration(color: const Color(0xFFE8703A).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: const Color(0xFFE8703A)),
      ),
      const SizedBox(width: 8),
      Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    ]);
  }
}

const List<String> _bureaux = [
  'Dakar RP', 'AIBD', 'SODIDA', 'Thiès', 'Kaolack', 'Touba',
];
