import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) => Expanded(
                    child: Center(
                      child: (controller.chewieController != null &&
                              controller.chewieController!.videoPlayerController
                                  .value.isInitialized)
                          ? Chewie(controller: controller.chewieController!)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Loading...'),
                              ],
                            ),
                    ),
                  ))
        ],
      ),
    );
  }
}
