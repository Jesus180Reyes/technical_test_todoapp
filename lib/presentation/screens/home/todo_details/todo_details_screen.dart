import 'package:flutter/material.dart';
import 'package:tecnical_test_todo_app/entities/entities.dart';

import '../../../widgets/widgets.dart';

class TodoDetailsScreen extends StatelessWidget {
  final Todo todo;
  const TodoDetailsScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO Detalles"),
        centerTitle: true,
      ),
      body: TodoDetailsContainWidget(todo: todo),
    );
  }
}
