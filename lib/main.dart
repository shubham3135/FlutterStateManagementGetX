import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/count_controller.dart';

void main() {
  runApp(MyApp());
}

//GetView
// =======
// If we have single controller as a dependency then we can use GetView
//instead of StatelessWidget and avoid writing Get.find

//GetWidget
// ========
//It is similar to GetView with one difference it gives the same instance of
//Get.find everytime. It becomes very useful when used in combination with
//Get.create

class MyApp extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    // Get.create(() => CountController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetView',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('GetView'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Text(
                      'The value is ${controller.count}',
                      style: TextStyle(fontSize: 25),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      print(controller.hashCode);
                      controller.increment();
                    },
                    child: Text('Increment'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
