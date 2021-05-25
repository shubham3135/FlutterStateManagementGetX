import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }

  @override
  void onInit() {
    //called every time when the value of count variable changes
    // ever(count, (_) => print(count));

    //called every time when the value of count of any variable from the list changes
    // everAll([count], (_) => print(count));

    //called only once when the value of count variable changes
    // once(count, (_) => print(count));

    //called every time when the user stops typing for 800 millisecond default and specified as given
    // debounce(count, (_) => print('when the user stops typing for 1 second'), time: Duration(seconds: 1));

    //called method after given interval
    interval(count, (_) => print('Ignore all changes $count'),
        time: Duration(seconds: 3));
    super.onInit();
  }
}
