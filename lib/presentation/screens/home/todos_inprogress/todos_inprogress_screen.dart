import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';

import '../../../widgets/widgets.dart';
import '../../screens.dart';

class TodosInProgressScreen extends StatefulWidget {
  const TodosInProgressScreen({Key? key}) : super(key: key);

  @override
  State<TodosInProgressScreen> createState() => _TodosInProgressScreenState();
}

class _TodosInProgressScreenState extends State<TodosInProgressScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final todosProvider = Provider.of<TodoServices>(context, listen: false);
      final userProvider = Provider.of<AuthServices>(context, listen: false);

      todosProvider.getTodosByUserId(
          userID: userProvider.user!.user.id.toString(), status: "inProgress");
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
        title: const Text("Tareas En Progreso"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TodosItemsWidget(
              color: Colors.blue,
              iconColor: Colors.white,
              iconData: Icons.model_training_outlined,
              routeOnTap: "/todo-details",
              onLongPress: "/todo-details",
            ),
          ],
        ),
      ),
    );
  }
}
