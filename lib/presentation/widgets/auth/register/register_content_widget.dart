import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';

import '../../widgets.dart';

class RegisterContentWidget extends StatelessWidget {
  const RegisterContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createUserProvider = Provider.of<AuthServices>(context);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        const AuthHeaderTitleWidget(title: 'Registrate'),
        CustomTextfieldWidget(
          controller: nameController,
          hintText: 'Nombre Completo',
          icon: Icons.person,
          textInputType: TextInputType.emailAddress,
        ),
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
          title: 'Crear Cuenta',
          onPressed: () async {
            await createUserProvider.createUser(
              nombre: nameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            // ignore: use_build_context_synchronously
            context.pushReplacement("/");
          },
        ),
        const SizedBox(height: 20),
        AuthRowTitleWidget(
          title: 'Ya tienes una cuenta?',
          subTitle: 'Inicia Sesion',
          onTap: () => context.push("/auth/login"),
        ),
      ],
    );
  }
}
