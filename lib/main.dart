import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/my_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the instance of Controller
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Management'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Using GetX controller for state management and separating the ui code
               */
              GetX<MyController>(
                // If instance of controller not created at top
                // init: MyController(),
                builder: (controller) {
                  return Text(
                    'The value is ${myController.count}',
                    // If instance of controller not created at top
                    // 'The value is ${controller.count}',
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  myController.increment();
                  // If instance of controller not created at top
                  // Get.find<MyController>().increment();
                },
                child: Text('Increment'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
