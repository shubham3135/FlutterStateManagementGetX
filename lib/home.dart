import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'The value is ${Get.find<HomeController>().count}',
                style: TextStyle(color: Colors.purpleAccent, fontSize: 30),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Get.find<HomeController>().increment();
              },
              child: Text('Increment'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Back'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
