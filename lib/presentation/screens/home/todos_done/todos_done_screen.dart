import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';

import '../../../widgets/widgets.dart';
import '../../screens.dart';

class TodosDoneScreen extends StatefulWidget {
  const TodosDoneScreen({Key? key}) : super(key: key);

  @override
  State<TodosDoneScreen> createState() => _TodosDoneScreenState();
}

class _TodosDoneScreenState extends State<TodosDoneScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final todosProvider = Provider.of<TodoServices>(context, listen: false);
      final userProvider = Provider.of<AuthServices>(context, listen: false);

      todosProvider.getTodosByUserId(
          userID: userProvider.user!.user.id.toString(), status: "done");
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
        title: const Text("Tareas Terminadas"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TodosItemsWidget(
              color: Colors.green,
              iconColor: Colors.white,
              iconData: Icons.done_rounded,
              routeOnTap: "/todo-details",
              onLongPress: "/tood-details",
            ),
          ],
        ),
      ),
    );
  }
}
