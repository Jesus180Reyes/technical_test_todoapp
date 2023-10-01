import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/screens/screens.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
      redirect: (context, state) async {
        final authProvider = Provider.of<AuthServices>(context, listen: false);
        final token = await authProvider.storage.read(key: "x-token");
        if (token == null) return "/auth/login";
        bool hasExpired = JwtDecoder.isExpired(token);
        if (hasExpired) {
          await authProvider.storage.deleteAll();
          return "/auth/login";
        }
        final userID = await authProvider.storage.read(key: "userId");
        await authProvider.getUserById(userId: userID!);
        return "/";
      },
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
    GoRoute(
      path: "/todos-pending",
      builder: (context, state) => const TodosPendingScreen(),
    ),
    GoRoute(
      path: "/todos-inProgress",
      builder: (context, state) => const TodosInProgressScreen(),
    ),
    GoRoute(
      path: "/todos-done",
      builder: (context, state) => const TodosDoneScreen(),
    ),
    GoRoute(
      path: "/add-todo",
      builder: (context, state) => const AddTodoScreen(),
    ),
  ],
);
