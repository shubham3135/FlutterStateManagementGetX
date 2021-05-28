import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/productModule/views/product_list_view.dart';

import 'commonModule/app_color.dart';
import 'commonModule/app_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.fetchApiData,
        theme: ThemeData(
          primarySwatch: AppColor.purpleColor,
        ),
        home: ProductListView());
  }
}
