import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.compressImagePath.value == ''
                  ? Text(
                      'Select image from camera/gallery',
                      style: TextStyle(fontSize: 20),
                    )
                  : Image.file(File(controller.compressImagePath.value))),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => Text(
                  controller.compressImageSize.value == ''
                      ? ''
                      : controller.compressImageSize.value,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: Text('Camera'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text('Gallery'),
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
