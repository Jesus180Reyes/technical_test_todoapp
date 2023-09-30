import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_todo_app/presentation/services/auth/auth_services.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthServices>(context).user!.user;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 80,
            child: Text(
              userProvider.nombre.substring(0, 2).toUpperCase(),
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            userProvider.nombre,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            userProvider.email,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 35),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.black54,
              ),
            ),
            child: const ListTile(
              title: Text(
                "Cerrar Sesion",
              ),
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          )
        ],
      ),
    );
  }
}
