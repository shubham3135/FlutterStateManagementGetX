import 'package:get/get.dart';
import 'package:get_x/my_controller.dart';

class MyAppControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  }
}
