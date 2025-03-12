import 'package:get/get.dart';
import 'package:orderapp/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
  ];
}
