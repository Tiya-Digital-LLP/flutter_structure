import 'package:get/get.dart';
import 'package:orderapp/login/login_screen.dart';
import 'package:orderapp/mainscreen/main_screen.dart';
import 'package:orderapp/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.login, page: () => const LoginScreen()),
    GetPage(name: Routes.main, page: () => const MainScreen()),
  ];
}
