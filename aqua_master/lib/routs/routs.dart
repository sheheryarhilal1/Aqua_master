import 'package:aqua_master/views/Login_screen.dart';
import 'package:aqua_master/views/Singup_screen.dart';
import 'package:aqua_master/views/spalsh_screen.dart';
import 'package:get/get.dart';


class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
}

class AppRoutes {
  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.signup, page: () => SingupScreen()),
  ];
}
