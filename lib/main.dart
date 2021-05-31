import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/count_controller.dart';
import 'package:get_x/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetView',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: HomeView());
  }
}
