import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';

void showInfoSnackBar(BuildContext context, String info,
    {Function? actionCallback, String? actionTitle, int duration = 2, IconData? icon, Color? iconColor}) {
  final snackBar = SnackBar(
    content: icon != null
        ? Row(
            children: <Widget>[
              Icon(icon, color: iconColor),
              const SizedBox(width: defaultSpacing),
              Text(info),
            ],
          )
        : Text(info),
    duration: Duration(seconds: duration),
    action: actionCallback != null && actionTitle != null
        ? SnackBarAction(label: actionTitle, onPressed: () => actionCallback())
        : null,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
