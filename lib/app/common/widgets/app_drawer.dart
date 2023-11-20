import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';
import 'package:metropolly/app/routes/routes_consts.dart';
import 'package:metropolly/app/screens/login_page.dart';

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
              decoration: BoxDecoration(color: primaryColor),
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
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.starred),
                          splashRadius: 24.0,
                          icon: Icon(Icons.bookmark, color: secondaryColor),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.starred),
                          child: const CommonText(text: "Posts salvos"),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.postList),
                          splashRadius: 24.0,
                          icon: Icon(Icons.list, color: secondaryColor),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.postList),
                          child: const CommonText(text: "Meus posts"),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.settings),
                          splashRadius: 24.0,
                          icon: Icon(Icons.settings, color: secondaryColor),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.settings),
                          child: const CommonText(text: "Configurações"),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute<void>(builder: (_) => const LoginPage()),
                            ModalRoute.withName(RoutesConsts.root),
                          ),
                          splashRadius: 24.0,
                          icon: Icon(Icons.logout, color: secondaryColor),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute<void>(builder: (_) => const LoginPage()),
                            ModalRoute.withName(RoutesConsts.root),
                          ),
                          child: const CommonText(text: "Sair"),
                        ),
                      ],
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
