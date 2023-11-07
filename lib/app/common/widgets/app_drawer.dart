import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';
import 'package:metropolly/app/routes/routes_consts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: drawerSize.width,
              height: drawerSize.height * .3,
              decoration: const BoxDecoration(color: Colors.indigo),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(Icons.person_rounded, color: Colors.white, size: 100.0),
                  const CommonText(text: 'John Doe', textColor: Colors.white),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            SizedBox(
              width: drawerSize.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).popAndPushNamed(RoutesConsts.root),
                      child: const CommonText(text: 'Favoritos'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).popAndPushNamed(RoutesConsts.root),
                      child: const CommonText(text: 'Minhas Vagas'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).popAndPushNamed(RoutesConsts.root),
                      child: const CommonText(text: 'Sair'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
