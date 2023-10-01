import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/entities/entities.dart';
import 'package:tecnical_test_todo_app/presentation/services/todos/todos_services.dart';

class CustomPopupWidget extends StatefulWidget {
  final Todo todo;
  const CustomPopupWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<CustomPopupWidget> createState() => _CustomPopupWidgetState();
}

class _CustomPopupWidgetState extends State<CustomPopupWidget> {
  CustomPopupMenuController controller = CustomPopupMenuController();
  String status = "";

  @override
  void initState() {
    status = widget.todo.status;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoServices>(context, listen: false);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPopupMenu(
            controller: controller,
            barrierColor: Colors.black45,
            menuBuilder: () {
              return Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        controller.hideMenu();
                        status = "Pendiente";
                        await todoProvider.updateTodoStatus(
                          todoId: widget.todo.id,
                          status: "Pending",
                        );
                        todoProvider.todos
                            .removeWhere((item) => item.id == widget.todo.id);
                        setState(() {});
                      },
                      child: ListTile(
                        leading: IconButton.filled(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.yellow),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.pending_actions_outlined,
                          ),
                        ),
                        title: const Text(
                          "Pendiente",
                          style: TextStyle(
                            fontFamily: "Popins",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        status = "En Progreso";
                        await todoProvider.updateTodoStatus(
                          todoId: widget.todo.id,
                          status: "inProgress",
                        );
                        todoProvider.todos
                            .removeWhere((item) => item.id == widget.todo.id);
                        setState(() {});

                        controller.hideMenu();
                        setState(() {});
                      },
                      child: ListTile(
                        leading: IconButton.filled(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.auto_mode,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          "En Progreso",
                          style: TextStyle(
                            fontFamily: "Popins",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        controller.hideMenu();
                        status = "Completado";
                        await todoProvider.updateTodoStatus(
                          todoId: widget.todo.id,
                          status: "done",
                        );
                        todoProvider.todos
                            .removeWhere((item) => item.id == widget.todo.id);
                        setState(() {});

                        controller.hideMenu();

                        setState(() {});
                      },
                      child: ListTile(
                        leading: IconButton.filled(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          "Completado",
                          style: TextStyle(
                            fontFamily: "Popins",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            pressType: PressType.singleClick,
            verticalMargin: 0,
            horizontalMargin: 10,
            position: PreferredPosition.bottom,
            showArrow: false,
            child: Container(
              margin: const EdgeInsets.only(top: 25, right: 25),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.black54,
                      ),
                    ),
                    alignment: Alignment.center,
                    height: 80,
                    width: 300,
                    child: ListTile(
                      leading: const Icon(Icons.task_alt_rounded),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                      ),
                      title: Text("Status: $status "),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
