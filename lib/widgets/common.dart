import 'package:flutter/material.dart';

class Common {
  static Future<void> showMyDialog({
    required BuildContext context,
    required String message,
    Function? onPressed,
  }) async {
    onPressed = onPressed ?? () {};

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                onPressed!();
              },
            ),
          ],
        );
      },
    );
  }
}
