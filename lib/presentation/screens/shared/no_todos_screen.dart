import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoTodosScreen extends StatelessWidget {
  const NoTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/add-todo"),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text(
          'No hay TODOS Registrados\n Haz Click en + para crear una nueva tarea.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
