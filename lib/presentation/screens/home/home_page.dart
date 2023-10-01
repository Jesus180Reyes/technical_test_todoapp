import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthServices>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/add-todo"),
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text("TODO App"),
        centerTitle: true,
        leading: InkWell(
          onTap: () => context.push("/profile"),
          child: CircleAvatar(
            child: Text(
              userProvider.user!.user.nombre.substring(0, 2).toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            child: Text(
              "Hola! ${userProvider.user!.user.nombre} estas son tus tareas determinadas",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TodoCardWidget(
            title: 'Tareas Pendientes.',
            onTap: () => context.push("/todos-pending"),
          ),
          TodoCardWidget(
            title: 'Tareas En Progreso.',
            onTap: () => context.push("/todos-inProgress"),
            color: Colors.blue,
          ),
          TodoCardWidget(
            title: 'Tareas Completadas',
            onTap: () => context.push("/todos-done"),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
