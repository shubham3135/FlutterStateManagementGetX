import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Get.defaultDialog();
                  Get.defaultDialog(
                    title: 'Dialog Title',
                    titleStyle: TextStyle(fontWeight: FontWeight.bold),
                    middleText: 'This is middle text',
                    middleTextStyle: TextStyle(fontWeight: FontWeight.w100),
                    backgroundColor: Colors.purple,
                    radius: 0,
                    //To customize the middle text
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text('Data Loading'),
                        ),
                      ],
                    ),
                    textCancel: 'Cancel',
                    cancelTextColor: Colors.white,
                    textConfirm: 'Confirm',
                    confirmTextColor: Colors.white,
                    onConfirm: () {},
                    onCancel: () {},
                    buttonColor: Colors.deepOrange,
                    // cancel: Text('Cancels'),
                    // confirm: Text('Confirms'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Action1')),
                      TextButton(onPressed: () {}, child: Text('Action2')),
                    ],
                    // barrierDismissible: false,
                  );
                },
                child: Text('Show Dialog'),
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
