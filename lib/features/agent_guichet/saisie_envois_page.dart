import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/ems_3d_scaffold.dart';

class SaisieEnvoisPage extends StatefulWidget {
  const SaisieEnvoisPage({super.key});
  static const String routePath = '/agent_guichet/saisie_envois';

  @override
  State<SaisieEnvoisPage> createState() => _SaisieEnvoisPageState();
}

class _SaisieEnvoisPageState extends State<SaisieEnvoisPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers / State
  final _clientController = TextEditingController();
  final _contenuController = TextEditingController();
  final _nbColisController = TextEditingController(text: '1');
  final _poidsController = TextEditingController();
  final _valeurDeclController = TextEditingController();
  final _montantController = TextEditingController();
  String _typeClient = 'Occasionnel';
  String _typeEnvoi = 'Document';
  String _origine = '';
  String _destination = '';
  String _modePaiement = 'Espèces';
  String _tranchePoids = '< 0.5 kg';
  String _tarifCalcule = '0';
  bool _showPdfPreview = false;

  @override
  void initState() {
    super.initState();
    _poidsController.addListener(_calculerTarif);
    _destination = ''; // Initialisation
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dépôt enregistré (mock).')),
      );
    }
  }

  void _calculerTarif() {
    if (_poidsController.text.isEmpty || _destination.isEmpty) {
      setState(() => _tarifCalcule = '0');
      return;
    }
    final poids = double.tryParse(_poidsController.text) ?? 0.0;
    final destination = _destination;

    // Logique tarifaire simplifiée (à adapter selon les vrais tarifs EMS)
    double tarifBase = 0.0;

    // Tarifs par destination (exemple)
    final tarifsParDestination = {
      'Dakar RP': 500.0,
      'AIBD': 750.0,
      'SODIDA': 600.0,
      'Thiès': 800.0,
      'Kaolack': 1200.0,
      'Touba': 1000.0,
    };

    tarifBase = tarifsParDestination[destination] ?? 500.0;

    // Supplément selon le poids
    if (poids > 20) {
      tarifBase *= 3.0;
    } else if (poids > 10) {
      tarifBase *= 2.5;
    } else if (poids > 5) {
      tarifBase *= 2.0;
    } else if (poids > 2) {
      tarifBase *= 1.5;
    } else if (poids > 1) {
      tarifBase *= 1.2;
    }

    // Arrondi au franc CFA
    final tarifFinal = (tarifBase * 100).round() / 100;
    setState(() => _tarifCalcule = tarifFinal.toStringAsFixed(2));
  }

  void _togglePdfPreview() {
    setState(() => _showPdfPreview = !_showPdfPreview);
  }

  @override
  Widget build(BuildContext context) {
    return EMS3DScaffold(
      title: '',
      currentRoute: SaisieEnvoisPage.routePath,
      backgroundColor: const Color(0xFFF8FAFC),
      titleWidget: Row(
        children: [
          const SizedBox(width: 4),
          Image.asset('image/Logo_EMS.PNG', height: 24),
          const SizedBox(width: 12),
          const Text(
            'Saisie des envois',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter', color: Color(0xFF1E293B)),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8FAFC), Color(0xFFE2E8F0)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: const Offset(0, 4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.assignment_outlined,
                                  color: Color(0xFF3B82F6),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'Formulaire de dépôt',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E293B),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Renseignez les informations du colis à expédier',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xFF64748B),
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Form sections
                    _buildSection(
                      title: 'Informations client',
                      icon: Icons.person_outline,
                      children: [
                        _buildFieldRow([
                          _buildDropdownField(
                            label: 'Type de client',
                            value: _typeClient,
                            items: const [
                              DropdownMenuItem(value: 'Occasionnel', child: Text('Occasionnel')),
                              DropdownMenuItem(value: 'Abonné', child: Text('Abonné')),
                            ],
                            onChanged: (value) => setState(() => _typeClient = value ?? 'Occasionnel'),
                          ),
                          _buildTextField(
                            label: 'Client',
                            controller: _clientController,
                            hint: 'Nom / N° client',
                            validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                          ),
                        ]),
                      ],
                    ),

                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Détails de l\'envoi',
                      icon: Icons.inventory_2_outlined,
                      children: [
                        _buildFieldRow([
                          _buildDropdownField(
                            label: 'Type d\'envoi',
                            value: _typeEnvoi,
                            items: const [
                              DropdownMenuItem(value: 'Document', child: Text('Document')),
                              DropdownMenuItem(value: 'Marchandise', child: Text('Marchandise')),
                              DropdownMenuItem(value: 'Mixte', child: Text('Mixte')),
                            ],
                            onChanged: (value) => setState(() => _typeEnvoi = value ?? 'Document'),
                          ),
                          _buildTextField(
                            label: 'Contenu',
                            controller: _contenuController,
                            hint: 'Description du contenu',
                            validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                          ),
                        ]),
                        const SizedBox(height: 16),
                        _buildFieldRow([
                          _buildDropdownField(
                            label: 'Origine',
                            value: _origine.isEmpty ? null : _origine,
                            items: _bureaux.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                            onChanged: (value) => setState(() => _origine = value ?? ''),
                            hint: 'Sélectionner un bureau',
                            validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                          ),
                          _buildDropdownField(
                            label: 'Destination',
                            value: _destination.isEmpty ? null : _destination,
                            items: _bureaux.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                            onChanged: (value) {
                              setState(() => _destination = value ?? '');
                              _calculerTarif();
                            },
                            hint: 'Sélectionner un bureau',
                            validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                          ),
                        ]),
                      ],
                    ),

                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Caractéristiques du colis',
                      icon: Icons.local_shipping_outlined,
                      children: [
                        _buildFieldRow([
                          _buildTextField(
                            label: 'Nombre de colis',
                            controller: _nbColisController,
                            keyboardType: TextInputType.number,
                            hint: '1',
                            validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                          ),
                          _buildTextField(
                            label: 'Poids (kg)',
                            controller: _poidsController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            hint: '0.0',
                            validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                          ),
                        ]),
                        const SizedBox(height: 16),
                        _buildFieldRow([
                          _buildDropdownField(
                            label: 'Tranche de poids',
                            value: _tranchePoids,
                            items: const [
                              DropdownMenuItem(value: '< 0.5 kg', child: Text('< 0.5 kg')),
                              DropdownMenuItem(value: '0.5 - 1 kg', child: Text('0.5 - 1 kg')),
                              DropdownMenuItem(value: '1 - 2 kg', child: Text('1 - 2 kg')),
                              DropdownMenuItem(value: '2 - 5 kg', child: Text('2 - 5 kg')),
                              DropdownMenuItem(value: '5 - 10 kg', child: Text('5 - 10 kg')),
                              DropdownMenuItem(value: '10 - 20 kg', child: Text('10 - 20 kg')),
                              DropdownMenuItem(value: '> 20 kg', child: Text('> 20 kg')),
                            ],
                            onChanged: (value) => setState(() => _tranchePoids = value ?? _tranchePoids),
                          ),
                          _buildTextField(
                            label: 'Valeur déclarée (FCFA)',
                            controller: _valeurDeclController,
                            keyboardType: TextInputType.number,
                            hint: '0',
                          ),
                        ]),
                        const SizedBox(height: 16),
                        // Tarif calculé automatiquement
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F9FF),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF0EA5E9).withOpacity(0.3)),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calculate_outlined,
                                color: Color(0xFF0EA5E9),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Tarif calculé :',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0EA5E9),
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${_tarifCalcule} FCFA',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0EA5E9),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Informations de paiement',
                      icon: Icons.payment_outlined,
                      children: [
                        _buildFieldRow([
                          _buildDropdownField(
                            label: 'Mode de paiement',
                            value: _modePaiement,
                            items: const [
                              DropdownMenuItem(value: 'Espèces', child: Text('Espèces')),
                              DropdownMenuItem(value: 'CB', child: Text('CB')),
                              DropdownMenuItem(value: 'Transfert', child: Text('Transfert')),
                            ],
                            onChanged: (value) => setState(() => _modePaiement = value ?? 'Espèces'),
                          ),
                          _buildTextField(
                            label: 'Montant (FCFA)',
                            controller: _montantController,
                            keyboardType: TextInputType.number,
                            hint: '0',
                          ),
                        ]),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Aperçu PDF du bordereau
                    if (_showPdfPreview) _buildPdfPreview(),

                    const SizedBox(height: 32),

                    // Action buttons
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: const Offset(0, 4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _submit,
                            icon: const Icon(Icons.check),
                            label: const Text('Enregistrer le dépôt'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3B82F6),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Aperçu du bordereau (à implémenter)')),
                              );
                            },
                            icon: const Icon(Icons.print),
                            label: const Text('Imprimer bordereau'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF3B82F6),
                              side: const BorderSide(color: Color(0xFF3B82F6)),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: _togglePdfPreview,
                            icon: Icon(_showPdfPreview ? Icons.visibility_off : Icons.visibility),
                            label: Text(_showPdfPreview ? 'Masquer aperçu' : 'Aperçu PDF'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF059669),
                              side: const BorderSide(color: Color(0xFF059669)),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: () => context.go('/agent_guichet'),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Retour'),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper methods
  Widget _buildSection({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: const Color(0xFF3B82F6), size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildFieldRow(List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 700) {
          return Row(
            children: children
                .map<Widget>((child) => Expanded(child: Padding(padding: const EdgeInsets.only(right: 16), child: child)))
                .toList()
              ..add(const Spacer()),
          );
        } else {
          return Column(
            children: children.expand((child) => [child, const SizedBox(height: 16)]).toList()..removeLast(),
          );
        }
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: const Color(0xFF9CA3AF), fontFamily: 'Inter'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF3B82F6)),
            ),
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required void Function(String?) onChanged,
    String? hint,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: const Color(0xFF9CA3AF), fontFamily: 'Inter'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF3B82F6)),
            ),
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildPdfPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF059669).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.picture_as_pdf, color: Color(0xFF059669), size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'Aperçu du bordereau',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                  fontFamily: 'Inter',
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF059669).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'MOCK - PDF à implémenter',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF059669),
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    size: 64,
                    color: Color(0xFFCBD5E1),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aperçu PDF du bordereau',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Le contenu PDF sera généré ici avec les données du formulaire',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF94A3B8),
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> _bureaux = [
  'Dakar RP', 'AIBD', 'SODIDA', 'Thiès', 'Kaolack', 'Touba',
];
