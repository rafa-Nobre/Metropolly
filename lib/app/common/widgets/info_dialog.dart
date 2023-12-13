import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';

Widget infoDialog(String title, String description, {bool isAnError = false}) {
  return SimpleDialog(
    contentPadding: const EdgeInsets.all(defaultSpacing),
    titlePadding: const EdgeInsets.all(defaultSpacing),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
    title: Row(
      children: <Widget>[
        isAnError ? Icon(Icons.error, color: alertColor) : Icon(Icons.check_circle, color: confirmColor),
        const SizedBox(width: defaultSpacing),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
    children: <Widget>[
      CommonText(text: description),
    ],
  );
}
