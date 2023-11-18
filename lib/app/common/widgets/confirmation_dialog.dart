import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/routes/routes_consts.dart';

Future<void> confirmationDialog(BuildContext context, String dialogTitle, String dialogContent) {
  return showDialog<void>(
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
            onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName(RoutesConsts.login)),
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
