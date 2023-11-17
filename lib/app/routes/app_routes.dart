import 'package:flutter/widgets.dart';
import 'package:metropolly/app/routes/routes_consts.dart';
import 'package:metropolly/app/screens/login_page.dart';
import 'package:metropolly/app/screens/notifications_page.dart';
import '../screens/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.root: (context) => const HomePage(),
  RoutesConsts.login: (context) => const LoginPage(),
  RoutesConsts.notification: (context) => const NotificationsPage(),
};
