import 'package:get/get.dart';
import 'package:get_x/home_controller.dart';

class HomeControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
