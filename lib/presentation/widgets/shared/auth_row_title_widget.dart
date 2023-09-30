import 'package:flutter/material.dart';

class AuthRowTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onTap;
  const AuthRowTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            subTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.indigo,
            ),
          ),
        ),
      ],
    );
  }
}
