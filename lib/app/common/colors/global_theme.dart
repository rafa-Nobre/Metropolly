import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';

ThemeData globalTheme(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColor,
    colorScheme: Theme.of(context).colorScheme.copyWith(secondary: secondaryColor),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      color: primaryColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
