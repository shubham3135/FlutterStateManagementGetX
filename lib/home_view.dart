import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeController controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Scrollable Sheet'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: Colors.purple,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Text(
                'Draggable Scrollable Sheet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DraggableScrollableSheet(
            builder:
                (BuildContext buildContext, ScrollController scrollController) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListView.builder(
                    itemBuilder: (BuildContext buildContext, int index) {
                      return Obx(() => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: controller.selected[index]
                                    ? Colors.blue
                                    : null),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightBlue,
                                child: Text(
                                  index.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                'Index position is $index',
                                style: TextStyle(
                                    color: controller.selected[index]
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              tileColor: Colors.green,
                              // selectedTileColor: controller.selected[index]
                              //     ? Colors.green
                              //     : Colors.transparent,
                              selected: controller.selected[index],
                              onTap: () => controller.selected[index] =
                                  !controller.selected[index],
                            ),
                          ));
                    },
                    itemCount: 40,
                    controller: scrollController,
                  ),
                ),
              );
            },
            initialChildSize: .3,
            minChildSize: .15,
            maxChildSize: 0.8,
          )
        ],
      ),
    );
  }
}
