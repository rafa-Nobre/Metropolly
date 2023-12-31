import 'package:flutter/widgets.dart';
import '../screens/dev_info_page.dart';
import '../screens/forget_password_page.dart';
import '../screens/post_info_page.dart';
import '../screens/post_creation_page.dart';
import '../screens/post_list_page.dart';
import '../screens/starred_page.dart';
import './routes_consts.dart';
import '../screens/login_page.dart';
import '../screens/profile_page.dart';
import '../screens/sign_up_page.dart';
import '../screens/home_page.dart';
import '../screens/settings_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.root: (context) => const HomePage(),
  RoutesConsts.login: (context) => const LoginPage(),
  RoutesConsts.profile: (context) => const ProfilePage(),
  RoutesConsts.signUp: (context) => const SignUpPage(),
  RoutesConsts.settings: (context) => const SettingsPage(),
  RoutesConsts.starred: (context) => const StarredPage(),
  RoutesConsts.postList: (context) => const PostListPage(),
  RoutesConsts.newPost: (context) => const PostCreationPage(),
  RoutesConsts.postInfo: (context) => const PostInfoPage(),
  RoutesConsts.forgetPassword: (context) => const ForgetPasswordPage(),
  RoutesConsts.devInfo: (context) => const DevInfoPage(),
};
