import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Go to Home',
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
                onPressed: () async {
                  // Get.to(
                  //   Home(),
                  //   fullscreenDialog: true,
                  //   transition: Transition.zoom,
                  //   duration: Duration(milliseconds: 4000),
                  //   curve: Curves.bounceInOut,
                  //   arguments: 'Data from main',
                  // );

                  //Go to home screen but no option to return to previous screen
                  // Get.off(Home());

                  //Go to home screen and previous screens/routes
                  // Get.offAll(Home());

                  // receiving data back from home screen
                  var data = await Get.to(Home());
                  print('The Received data is $data');
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
