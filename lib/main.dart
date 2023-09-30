import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/config/router/app_router.dart';
import 'package:tecnical_test_todo_app/config/themes/app_theme.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Tecnical Test TODO App',
      routerConfig: appRouter,
    );
  }
}
