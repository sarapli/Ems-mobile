import 'package:flutter/widgets.dart';

class FeatureCycle {
  static const List<String> routes = <String>[
    '/client',
    '/agent_guichet',
    '/chef_agence',
    '/commercial',
    '/controleur',
    '/comptabilite',
    '/admin_technique',
    '/admin_fonctionnel',
    '/facturation',
    '/top_management',
  ];

  static String first() => routes.first;

  static int indexOf(String path) => routes.indexOf(path);

  static String next(String currentPath) {
    final int i = indexOf(currentPath);
    if (i == -1) return first();
    return routes[(i + 1) % routes.length];
  }

  static String labelOf(String path) {
    switch (path) {
      case '/client':
        return 'CLIENT';
      case '/agent_guichet':
        return 'AGENT DE GUICHET';
      case '/chef_agence':
        return "CHEF D'AGENCE";
      case '/commercial':
        return 'COMMERCIAL';
      case '/controleur':
        return 'CONTRÔLEUR';
      case '/comptabilite':
        return 'COMPTABILITÉ';
      case '/admin_technique':
        return 'ADMINISTRATEUR TECHNIQUE';
      case '/admin_fonctionnel':
        return 'ADMINISTRATEUR FONCTIONNEL';
      case '/facturation':
        return 'FACTURATION';
      case '/top_management':
        return 'TOP MANAGEMENT';
      default:
        return 'EMS';
    }
  }
}
