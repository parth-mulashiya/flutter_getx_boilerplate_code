import 'package:flutter_getx_boilerplate_code/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put<SplashController>(SplashController());
  }
}
