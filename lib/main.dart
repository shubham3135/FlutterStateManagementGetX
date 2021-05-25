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
               * Using Obx and GetX controller for state management and custom class separating the ui code
               */
              Obx(() => Text(
                    'Name is ${myController.student.value.name}',
                    style: TextStyle(fontSize: 25),
                  )),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // if individual variables are observable
                  // myController.convertToUpperCase();

                  // if entire class is observable
                  myController.convertUpperCase();
                },
                child: Text('Upper'),
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
