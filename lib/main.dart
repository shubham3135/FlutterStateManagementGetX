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
      title: 'Controller Lifecycle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Controller Lifecycle'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Using GetXController Lifecycle methods
               */
              GetBuilder<MyController>(
                // If instance of onInit and onClose not created at MyController class
                // initState: (data) => myController.increment(),
                // dispose: (_) => myController.cleanUpTask(),
                builder: (controller) {
                  return Text(
                    'The value is ${controller.count}',
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
              /*SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // myController.increment();
                  // If instance of controller not created at top
                  Get.find<MyController>().increment();
                },
                child: Text('Increment'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
