// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/config/helpers/custom_dialog.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';
import 'package:tecnical_test_todo_app/presentation/widgets/widgets.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final addTodoProvider = Provider.of<TodoServices>(context);
    final authProvider = Provider.of<AuthServices>(context).user!.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Crear TODO"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextfieldWidget(
            controller: titleController,
            hintText: "Titulo del TODO",
            icon: Icons.add_task,
          ),
          CustomTextfieldWidget(
            controller: descriptionController,
            maxlines: null,
            hintText: "Descripcion del TODO",
            icon: Icons.add_task,
          ),
          CustomButtonWidget(
            title: "Crear TODO",
            onPressed: () async {
              if (titleController.text.isEmpty) {
                cuatomDialog(
                  context: context,
                  subtitulo: "El titulo es Requerido",
                  titulo: "Rellena los campos requeridos",
                );
                return;
              }
              await addTodoProvider.createTodo(
                title: titleController.text.trim(),
                userId: authProvider.id,
                description: descriptionController.text.isEmpty
                    ? null
                    : descriptionController.text.trim(),
              );
              cuatomDialog(
                  context: context,
                  titulo: "Todo creado",
                  subtitulo: "TODO Creado exitosamente");
            },
          ),
        ],
      ),
    );
  }
}
