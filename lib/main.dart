import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/my_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // My Controller instance will be created even if it is not used
    // tag will be used to find the instance with tag name
    // Controller disposed when it is not used
    // but if permanent is true the instance will be alive throughout the app
    // MyController myController = Get.put(MyController(), tag: 'instance1', permanent: true);

    //Instance will be created when it is used
    //It is similar to 'permanent', the difference is that the instance
    //is discarded when is not being used,
    //but when it's use is needed again, Get will recreate the instance
    // Get.lazyPut(() => MyController(), tag: 'instance1', fenix: true);

    Get.putAsync<MyController>(() async => await MyController());

    //Here permanent will be true by default and isSingleton is false
    // Get.create<MyController>(() => MyController());

    return GetMaterialApp(
      title: 'Dependency Injection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dependency Injection'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Dependency Injection
               */
              GetBuilder<MyController>(
                // If instance of controller not created at top
                init: MyController(),
                builder: (controller) {
                  return Text(
                    // 'The value is ${myController.count}',
                    // If instance of controller not created at top
                    'The value is ${controller.counter}',
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  //Instance will be created with tag
                  // Get.find<MyController>(tag: 'instance');

                  //Find instance
                  // Get.find<MyController>();
                  Get.find<MyController>().incrementCounter();

                  //Find instance with tag
                  // Get.find<MyController>(tag: 'instance1');
                },
                child: Text('Click Me'),
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
