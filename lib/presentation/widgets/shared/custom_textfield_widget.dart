import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String hintText;
  final bool? isPassword;
  final IconData icon;
  final int? maxlines;
  const CustomTextfieldWidget({
    super.key,
    this.textInputType = TextInputType.text,
    required this.hintText,
    this.isPassword = false,
    required this.icon,
    this.controller,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isPassword!,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
