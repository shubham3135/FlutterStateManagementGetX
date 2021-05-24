import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // var student = Student();

  //For making the entire class observable
  final student = Student(name: 'shubham', age: 25).obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Management'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Using Obx for state management and custom class
               */
              Obx(() => Text(
                    'Name is ${student.value.name}',
                    style: TextStyle(fontSize: 25),
                  )),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // student.name.value = student.name.value.toUpperCase();

                  //If entire class is observable
                  student.update((student) {
                    student!.name = student.name.toString().toUpperCase();
                  });
                },
                child: Text('Upper'),
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
