import 'package:flutter/material.dart';

class TodoCardWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? color;
  const TodoCardWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.color = Colors.pink,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 150,
        width: size.width,
        margin: const EdgeInsets.only(right: 30, left: 30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 15, bottom: 10),
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
