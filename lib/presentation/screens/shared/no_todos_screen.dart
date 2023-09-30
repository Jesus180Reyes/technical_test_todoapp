import 'package:flutter/material.dart';

class NoTodosScreen extends StatelessWidget {
  const NoTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
