import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';

Future<void> confirmationDialog(BuildContext context, String dialogTitle, String dialogContent, Function onConfirm) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(dialogTitle),
        content: Text(dialogContent),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            splashRadius: 24.0,
            icon: Icon(
              Icons.cancel,
              color: cancelColor,
              size: 24.0,
            ),
          ),
          IconButton(
            onPressed: () => onConfirm(),
            splashRadius: 24.0,
            icon: Icon(
              Icons.check,
              color: confirmColor,
              size: 24.0,
            ),
          ),
        ],
      );
    },
  );
}
