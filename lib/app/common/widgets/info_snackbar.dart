import 'package:flutter/material.dart';

void showInfoSnackBar(BuildContext context, String info,
    {Function? actionCallback, String? actionTitle, int duration = 2}) {
  final snackBar = SnackBar(
    content: Text(info),
    duration: Duration(seconds: duration),
    action: actionCallback != null && actionTitle != null
        ? SnackBarAction(label: actionTitle, onPressed: () => actionCallback())
        : null,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
