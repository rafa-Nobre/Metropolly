import 'package:flutter/material.dart';
import 'package:metropolly/app/routes/routes_consts.dart';
import 'app/common/colors/global_theme.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metropolly',
      debugShowCheckedModeBanner: false,
      theme: globalTheme(context),
      initialRoute: RoutesConsts.root,
      routes: appRoutes,
    );
  }
}
