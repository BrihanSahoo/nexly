import 'package:flutter/material.dart';
import 'package:flutter_tutorial/feeds/futuristic_box.dart';
import 'package:flutter_tutorial/story/horizontal_story_widget.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomePage extends GetView<PostController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nexly',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HorizontalStoryWidget(),
          const Divider(),
          FuturisticBox()
        ],
      )
    );
  }
}