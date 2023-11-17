import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import '../../routes/routes_consts.dart';

PreferredSizeWidget applicationAppbar(String title, BuildContext context) {
  return AppBar(
    title: const Text('Feed'),
    centerTitle: true,
    actions: [
      IconButton(
        splashRadius: 24.0,
        onPressed: () => ModalRoute.of(context)?.settings.name != RoutesConsts.notification
            ? Navigator.of(context).pushNamed(RoutesConsts.notification)
            : null,
        icon: ModalRoute.of(context)?.settings.name == RoutesConsts.notification
            ? Icon(Icons.notifications, color: secondaryColor)
            : Icon(Icons.notifications),
      ),
    ],
    leading: Builder(
      builder: (context) {
        return IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        );
      },
    ),
  );
}
