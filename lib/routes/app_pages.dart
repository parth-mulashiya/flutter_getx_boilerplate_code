import 'package:flutter_getx_boilerplate_code/modules/home/home_bindings.dart';
import 'package:flutter_getx_boilerplate_code/modules/home/home_screen.dart';
import 'package:flutter_getx_boilerplate_code/modules/splash/splash_bindings.dart';
import 'package:get/get.dart';

import '../modules/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      bindings: [SplashBindings()],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
  ];
}
