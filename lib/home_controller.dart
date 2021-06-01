import 'package:get/get.dart';

class HomeController extends GetxController {
  List<bool> selected = List.generate(40, (index) => false).obs;
}
