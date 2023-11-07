import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({super.key, required this.text, this.textColor = Colors.black54, this.textSize = 16.0});

  final String text;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: textSize),
    );
  }
}
