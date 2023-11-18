import 'package:flutter/widgets.dart';
import 'package:metropolly/app/routes/routes_consts.dart';
import 'package:metropolly/app/screens/login_page.dart';
import 'package:metropolly/app/screens/profile_page.dart';
import 'package:metropolly/app/screens/sign_up_page.dart';
import '../screens/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.root: (context) => const HomePage(),
  RoutesConsts.login: (context) => const LoginPage(),
  RoutesConsts.profile: (context) => const ProfilePage(),
  RoutesConsts.signUp: (context) => SignUpPage(),
};
