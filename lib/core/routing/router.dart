import 'package:go_router/go_router.dart';
import '../../features/dashboard/dashboard_3d_page.dart';
import '../../features/auth/login_3d_page.dart';

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
    // Ajouter d'autres routes au besoin
  ],
);
