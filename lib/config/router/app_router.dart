import 'package:go_router/go_router.dart';
import 'package:tecnical_test_todo_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
