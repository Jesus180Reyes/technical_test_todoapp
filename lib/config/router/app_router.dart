import 'package:go_router/go_router.dart';
import 'package:tecnical_test_todo_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: "/auth/login",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/auth/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/auth/register",
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
