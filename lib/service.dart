import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service extends GetxService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var counter;
  Future<void> incrementCounter() async {
    SharedPreferences prefs = await _prefs;
    counter = ((prefs.getInt('counter') ?? 0) + 1);
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  @override
  void onInit() async {
    SharedPreferences prefs = await _prefs;
    counter = ((prefs.getInt('counter') ?? 0));
    super.onInit();
  }
}
