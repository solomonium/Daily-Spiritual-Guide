import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAlertDialogue(
  BuildContext context, {
  required String title,
  required String content,
  required String defaultActionText,
}) {
  if (!Platform.isIOS) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(defaultActionText),
            ),
          ],
        );
      }),
    );
  }

  return showCupertinoDialog(
      context: context,
      builder: ((context) => CupertinoAlertDialog(
            title: Text(title),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop(true)),
                  child: Text(defaultActionText))
            ],
          )));
}
