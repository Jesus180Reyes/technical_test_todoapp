import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/screens/screens.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';

import '../../../widgets/widgets.dart';

class TodosPendingScreen extends StatefulWidget {
  const TodosPendingScreen({Key? key}) : super(key: key);

  @override
  State<TodosPendingScreen> createState() => _TodosPendingScreenState();
}

class _TodosPendingScreenState extends State<TodosPendingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final todosProvider = Provider.of<TodoServices>(context, listen: false);
      final userProvider = Provider.of<AuthServices>(context, listen: false);

      todosProvider.getTodosByUserId(
          userID: userProvider.user!.user.id.toString(), status: "Pending");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodoServices>(context);
    if (todosProvider.isLoading) return const LoadingScreen();
    if (todosProvider.todos.isEmpty) return const NoTodosScreen();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tareas Pendientes"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TodosItemsWidget(
              color: Colors.yellow,
              iconData: Icons.pending_actions_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
