import 'package:flutter_getx_boilerplate_code/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(HomeController(apiRepository: Get.find()));
  }
}
