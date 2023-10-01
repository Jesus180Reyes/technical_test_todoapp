// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/config/helpers/custom_dialog.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';

import '../../widgets.dart';

class LoginContentWidget extends StatelessWidget {
  const LoginContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context, listen: false);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return SafeArea(
      child: Column(
        children: [
          const AuthHeaderTitleWidget(title: 'Inicia Sesion'),
          CustomTextfieldWidget(
            controller: emailController,
            hintText: 'Correo Electronico',
            icon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
          ),
          CustomTextfieldWidget(
            controller: passwordController,
            hintText: 'Password',
            icon: Icons.security_outlined,
            isPassword: true,
          ),
          CustomButtonWidget(
            title: 'Inicia Sesion',
            onPressed: () async {
              bool isLoginOk = await loginProvider.loginUser(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
              if (!isLoginOk) {
                cuatomDialog(
                    context: context,
                    titulo: "Error de Autenticacion",
                    subtitulo: loginProvider.errorMsg);
                return;
              }
              context.pushReplacement("/");
            },
          ),
          const SizedBox(height: 20),
          AuthRowTitleWidget(
            title: 'Aun no estas Registrado?',
            subTitle: 'Registrate',
            onTap: () => context.push("/auth/register"),
          ),
        ],
      ),
    );
  }
}
