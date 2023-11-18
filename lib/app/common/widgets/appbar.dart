import 'package:flutter/material.dart';
import '../../routes/routes_consts.dart';

PreferredSizeWidget applicationAppbar(String title, BuildContext context) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      const IconButton(
        onPressed: null,
        icon: Icon(Icons.search),
        splashRadius: 24.0,
      ),
      Visibility(
        visible: ModalRoute.of(context)?.settings.name != RoutesConsts.profile,
        child: IconButton(
          splashRadius: 24.0,
          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.profile),
          icon: const Icon(Icons.person),
        ),
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
