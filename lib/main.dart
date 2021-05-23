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
      title: 'Bottom Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Sheet'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text('Light Theme'),
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text('Dark Theme'),
                          ),
                        ],
                      ),
                    ),
                    // barrierColor: Colors.purpleAccent,
                    backgroundColor: Colors.white,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      // side: BorderSide(
                      //   color: Colors.black,
                      //   style: BorderStyle.solid,
                      //   width: 2,
                      // ),
                    ),
                    enableDrag: false,
                  );
                },
                child: Text('Bottom Sheet'),
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
