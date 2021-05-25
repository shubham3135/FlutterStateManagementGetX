import 'package:get/get.dart';
import 'package:get_x/student.dart';

class MyController extends GetxController {
  // if individual variables are observable
  // var student = Student();
  //
  // void convertToUpperCase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }

  // if entire class is observable
  var student = Student(name: "Shubham", age: 25).obs;

  void convertUpperCase() {
    student.update((student) {
      student!.name = student.name.toString().toUpperCase();
    });
  }
}
