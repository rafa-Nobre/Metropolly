import 'package:flutter/widgets.dart';
import 'package:metropolly/routes/routes_consts.dart';
import '../app/screens/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.root: (context) => const HomePage(),
};
