import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'This is Home Screen',
              style: TextStyle(color: Colors.purpleAccent, fontSize: 30),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text('Next Screen'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Get.back();
                Get.back(result: 'This is from Home Screen');
              },
              child: Text('Back to Main'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            SizedBox(height: 8),
            // Text(
            //   '${Get.arguments}',
            //   style: TextStyle(color: Colors.green, fontSize: 30),
            // ),
          ],
        ),
      ),
    );
  }
}
