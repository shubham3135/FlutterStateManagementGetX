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
      title: 'Snackbar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snackbar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Get.snackbar(
                    'Snackbar Title', 'This will be Snackbar Message',
                    snackPosition: SnackPosition.BOTTOM,
                    // titleText: Text(
                    //   'Another Title',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // messageText: Text(
                    //   'Another message',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    // colorText: Colors.red,
                    backgroundColor: Colors.black,
                    borderRadius: 0,
                    margin: EdgeInsets.zero,
                    // maxWidth: 500,
                    animationDuration: Duration(milliseconds: 1000),
                    backgroundGradient:
                        LinearGradient(colors: [Colors.red, Colors.green]),
                    // borderColor must not be used without borderWidth
                    // borderColor: Colors.purple,
                    // borderWidth: 4,
                    boxShadows: [
                      BoxShadow(
                        color: Colors.yellow,
                        offset: Offset(30, 50),
                        spreadRadius: 20,
                        blurRadius: 8,
                      )
                    ],
                    isDismissible: true,
                    dismissDirection: SnackDismissDirection.HORIZONTAL,
                    forwardAnimationCurve: Curves.bounceInOut,
                    reverseAnimationCurve: Curves.bounceInOut,
                    // duration: Duration(milliseconds: 8000),
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    shouldIconPulse: false,
                    // leftBarIndicatorColor: Colors.white,
                    mainButton: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: (value) => print('Hii this is shubham'),
                    overlayBlur: 5,
                    // overlayColor: Colors.grey,
                    padding: EdgeInsets.all(50),
                    showProgressIndicator: true,
                    progressIndicatorBackgroundColor: Colors.deepOrange,
                    progressIndicatorValueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white),
                    snackbarStatus: (val) {
                      print(val);
                    },
                    // userInputForm: Form(
                    //     child: Row(
                    //   children: [Expanded(child: TextField())],
                    // )),
                  );
                },
                child: Text('Show Snackbar'),
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
