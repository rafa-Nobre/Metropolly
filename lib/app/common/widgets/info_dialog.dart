import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';

Future<void> infoDialog(BuildContext context, String title, String description) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: <Widget>[
          CommonText(text: description),
        ],
      );
    },
  );
}
