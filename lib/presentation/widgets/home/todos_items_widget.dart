import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/entities/responses/todos_response.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';

class TodosItemsWidget extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Color? iconColor;
  final String routeOnTap;
  final String onLongPress;
  const TodosItemsWidget({
    super.key,
    required this.color,
    required this.iconData,
    this.iconColor = Colors.black,
    required this.routeOnTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodoServices>(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: todosProvider.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(
            todo: todosProvider.todos[index],
            color: color,
            iconData: iconData,
            iconColor: iconColor,
            routeOnTap: routeOnTap,
            onLongPress: onLongPress,
          );
        },
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Color color;
  final Color? iconColor;
  final IconData iconData;
  final String routeOnTap;
  final String onLongPress;
  const TodoItem({
    super.key,
    required this.todo,
    required this.color,
    required this.iconData,
    this.iconColor = Colors.black,
    required this.routeOnTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => context.push(onLongPress, extra: todo),
      onTap: () => context.push(routeOnTap, extra: todo),
      title: Text(todo.title),
      subtitle: Text(todo.description),
      leading: CircleAvatar(
        backgroundColor: color,
        maxRadius: 24,
        child: Icon(
          iconData,
          color: iconColor,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
