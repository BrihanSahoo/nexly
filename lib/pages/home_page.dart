import 'package:flutter/material.dart';
import 'package:flutter_tutorial/feeds/futuristic_box.dart';
import 'package:flutter_tutorial/friend_request/friend_request_widget.dart';
import 'package:flutter_tutorial/navbar/navbar.dart';
import 'package:flutter_tutorial/story/horizontal_story_widget.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomePage extends GetView<PostController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
          slivers: [
            HorizontalStoryWidget(),
            SliverToBoxAdapter(
              child: FriendRequestWidget(
                imageUrl: 'https://i.pravatar.cc/150?img=2',
                username: 'john_doe',
                highlight: 'Wants to connect with you',
                onAccept: () {
                  print('Friend request accepted');
                },
                onReject: () {
                  print('Friend request rejected');
                },
              ),
            ),
            SliverToBoxAdapter(child: FuturisticBox()),
            SliverToBoxAdapter(child: FuturisticBox()),
            SliverToBoxAdapter(child: FuturisticBox()),
            SliverToBoxAdapter(child: FuturisticBox()),
            SliverToBoxAdapter(child: FuturisticBox()),
            SliverToBoxAdapter(child: FuturisticBox()),
            SliverToBoxAdapter(child: FuturisticBox()),
          ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
