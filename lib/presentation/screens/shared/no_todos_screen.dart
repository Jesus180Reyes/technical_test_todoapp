import 'package:flutter/material.dart';

class NoTodosScreen extends StatelessWidget {
  const NoTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No hay todos Registrados, Ingresa uno.'),
      ),
    );
  }
}
