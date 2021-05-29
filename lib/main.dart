import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Initialize storage driver
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var emailEditingController = TextEditingController();
  var storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetStorage & Email Validation',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('GetStorage & Email Validation'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: emailEditingController,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      if (GetUtils.isEmail(emailEditingController.text)) {
                        storage.write('email', emailEditingController.text);
                      } else {
                        Get.snackbar(
                            'Incorrect Email', 'Provide Email in valid format',
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: Text('Write'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {
                    print('The Email is ${storage.read('email')}');
                  },
                  child: Text('Read'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// To listen for changes
//var listen = storage.listen(()=> print('Email Changed'););

// when subscribed to listen event it should be disposed by using
// storage.removeListen(listen);

// To listen for changes in key
// storage.listenKey('email', (value){ print('new key is $value');});

//Remove a key
// storage.remove('email');

//Erase the container
//storage.erase();

// create container with a name
//GetStorage g = GetStorage('MyStorage');
// await GetStorage.init('MyStorage');
