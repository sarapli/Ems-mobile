
import 'package:go_router/go_router.dart';
import '../../features/dashboard/professional_capture_3d_page.dart';
import '../../features/auth/login_3d_page.dart';
import '../../features/auth/register_3d_page.dart';
import '../../features/auth/code_secret_page.dart';
import '../../features/client/client_page.dart';
import '../../features/agent_guichet/agent_guichet_page.dart';
import '../../features/agent_guichet/saisie_envois_page.dart';
import '../../features/agent_guichet/impression_bordereaux_page.dart';
import '../../features/agent_guichet/transmission_envois_page.dart';
import '../../features/agent_guichet/fermeture_depeches_page.dart';
import '../../features/agent_guichet/reception_depeches_page.dart';
import '../../features/agent_guichet/reception_envois_page.dart';
import '../../features/agent_guichet/mise_a_jour_statuts_page.dart';
import '../../features/chef_agence/chef_agence_page.dart';
import '../../features/commercial/commercial_page.dart';
import '../../features/controleur/controleur_page.dart';
import '../../features/comptabilite/comptabilite_page.dart';
import '../../features/admin_technique/admin_technique_page.dart';
import '../../features/admin_fonctionnel/admin_fonctionnel_page.dart';
import '../../features/facturation/facturation_page.dart';
import '../../features/top_management/top_management_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login3DPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const Register3DPage(),
    ),
    GoRoute(
      path: '/capture-professionnel',
      builder: (context, state) => const ProfessionalCapture3DPage(),
    ),
    GoRoute(
      path: '/code-secret',
      builder: (context, state) => const CodeSecretPage(),
    ),
    // Feature pages
    GoRoute(
      path: ClientPage.routePath,
      builder: (context, state) => const ClientPage(),
    ),
    GoRoute(
      path: AgentGuichetPage.routePath,
      builder: (context, state) => const AgentGuichetPage(),
    ),
    GoRoute(
      path: SaisieEnvoisPage.routePath,
      builder: (context, state) => const SaisieEnvoisPage(),
    ),
    GoRoute(
      path: ImpressionBordereauxPage.routePath,
      builder: (context, state) => const ImpressionBordereauxPage(),
    ),
    GoRoute(
      path: TransmissionEnvoisPage.routePath,
      builder: (context, state) => const TransmissionEnvoisPage(),
    ),
    GoRoute(
      path: FermetureDepechesPage.routePath,
      builder: (context, state) => const FermetureDepechesPage(),
    ),
    GoRoute(
      path: ReceptionDepechesPage.routePath,
      builder: (context, state) => const ReceptionDepechesPage(),
    ),
    GoRoute(
      path: ReceptionEnvoisPage.routePath,
      builder: (context, state) => const ReceptionEnvoisPage(),
    ),
    GoRoute(
      path: MiseAJourStatutsPage.routePath,
      builder: (context, state) => const MiseAJourStatutsPage(),
    ),
    GoRoute(
      path: ChefAgencePage.routePath,
      builder: (context, state) => const ChefAgencePage(),
    ),
    GoRoute(
      path: CommercialPage.routePath,
      builder: (context, state) => const CommercialPage(),
    ),
    GoRoute(
      path: ControleurPage.routePath,
      builder: (context, state) => const ControleurPage(),
    ),
    GoRoute(
      path: ComptabilitePage.routePath,
      builder: (context, state) => const ComptabilitePage(),
    ),
    GoRoute(
      path: AdminTechniquePage.routePath,
      builder: (context, state) => const AdminTechniquePage(),
    ),
    GoRoute(
      path: AdminFonctionnelPage.routePath,
      builder: (context, state) => const AdminFonctionnelPage(),
    ),
    GoRoute(
      path: FacturationPage.routePath,
      builder: (context, state) => const FacturationPage(),
    ),
    GoRoute(
      path: TopManagementPage.routePath,
      builder: (context, state) => const TopManagementPage(),
    ),
  ],
);
