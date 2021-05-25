import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/messages.dart';
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
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      title: 'Internationalization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Internationalization'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Internationalization
               */
              Text(
                'hello'.tr,
                style: TextStyle(fontSize: 25, color: Colors.purple),
              ),
              SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  myController.changeLanguage('hi', 'IN');
                },
                child: Text('Hindi'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  myController.changeLanguage('fr', 'FR');
                },
                child: Text('French'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  myController.changeLanguage('en', 'US');
                },
                child: Text('English'),
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
