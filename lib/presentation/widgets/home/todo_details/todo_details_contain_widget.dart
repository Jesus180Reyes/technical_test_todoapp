import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/config/helpers/custom_dialog.dart';
import 'package:tecnical_test_todo_app/entities/responses/todos_response.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';

import '../../widgets.dart';

class TodoDetailsContainWidget extends StatelessWidget {
  final Todo todo;
  const TodoDetailsContainWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        children: [
          _HeaderTitle(todo: todo),
          _FormUpdateTodo(todo: todo),
          CustomPopupWidget(todo: todo),
        ],
      ),
    );
  }
}

class _FormUpdateTodo extends StatelessWidget {
  final Todo todo;
  const _FormUpdateTodo({required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoServices>(context);
    final titleController = TextEditingController(text: todo.title);
    final descriptionController = TextEditingController(text: todo.description);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TItulo de la Tarea",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          CustomTextfieldWidget(
            controller: titleController,
            hintText: "Titulo de la Tarea",
            icon: Icons.task_outlined,
            maxlines: null,
          ),
          const SizedBox(height: 30),
          const Text(
            "Descripcion de la tarea",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          CustomTextfieldWidget(
            controller: descriptionController,
            hintText: "Description de la tarea",
            icon: Icons.description_outlined,
            maxlines: null,
          ),
          CustomButtonWidget(
            title: "Actualizar Tarea",
            onPressed: () {
              todoProvider.updateTodoContainById(
                todoId: todo.id.toString(),
                title: titleController.text.trim(),
                description: descriptionController.text.trim(),
              );
              context.pushReplacement("/");
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  final Todo todo;

  const _HeaderTitle({required this.todo});
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoServices>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Tarea",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () {
            todoProvider.deleteTodoById(todoId: todo.id.toString());
            cuatomDialog(
              context: context,
              titulo: "TODO Eliminado",
              subtitulo: "Se ha eleminida el TODO",
            );
            context.pushReplacement("/");
          },
          icon: const Icon(
            Icons.delete_forever,
            size: 30,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
