import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0;
  void increment() {
    count++;
    //for updating of text with id
    // update(['txtCount']);

    //for updating of text without id
    update();
  }
}
