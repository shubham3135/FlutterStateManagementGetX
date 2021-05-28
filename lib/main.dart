import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home.dart';
import 'package:get_x/my_controller.dart';
import 'package:get_x/myapp_controller_binding.dart';

import 'home_controller_binding.dart';

void main() {
  MyAppControllerBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: AllControllerBinding(),
      title: 'GetX Binding',

      // If binding applied at route level
      // getPages: [
      //   GetPage(
      //     name: '/home',
      //     page: () => Home(),
      //     binding: HomeControllerBinding(),
      //   )
      // ],

      //Binding Builder (If we don't want to use separate binding class)
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
          binding: BindingsBuilder(() => {
                Get.lazyPut<HomeControllerBinding>(
                  () => HomeControllerBinding(),
                )
              }),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Binding'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * GetX Binding
               */
              Obx(() => Text(
                    'The value is ${Get.find<MyController>().count}',
                    style: TextStyle(fontSize: 25),
                  )),
              TextButton(
                onPressed: () {
                  Get.find<MyController>().increment();
                },
                child: Text('Increment'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  // Get.to(Home());
                  //For named route
                  Get.toNamed('/home');

                  //for normal routes
                  // Get.to(Home(), binding: HomeControllerBinding());
                },
                child: Text('Home'),
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
