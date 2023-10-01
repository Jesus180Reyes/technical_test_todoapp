import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

cuatomDialog({
  required BuildContext context,
  required String titulo,
  required String subtitulo,
}) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            textColor: Colors.blue,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}
