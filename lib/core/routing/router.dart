import 'package:go_router/go_router.dart';
import '../../features/dashboard/dashboard_3d_page.dart';
import '../../features/dashboard/professional_capture_3d_page.dart';
import '../../features/auth/login_3d_page.dart';
import '../../features/auth/register_3d_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Dashboard3DPage(),
    ),
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
  ],
);
