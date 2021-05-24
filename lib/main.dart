import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home.dart';
import 'package:get_x/next_screen.dart';
import 'package:get_x/unknown_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Go to Home',
      initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => Home()),
        // GetPage(
        //     name: '/nextScreen',
        //     page: () => NextScreen(),
        //     transition: Transition.leftToRight),
        GetPage(
            name: '/nextScreen/:someValue',
            page: () => NextScreen(),
            transition: Transition.leftToRight),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoute()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Go to Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Get.toNamed('/home');

                  //if name is not found unknown route is opened
                  // Get.toNamed('/x');

                  // Get.offNamed('/home');
                  // Get.offAllNamed('/home');
                  // Get.toNamed(
                  //     '/home?channel=Ripples Code&content=Flutter GetX');
                },
                child: Text('Go to Home'),
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
