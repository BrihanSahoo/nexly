import 'package:flutter/material.dart';
import 'package:flutter_tutorial/story/sample/sample_stories.dart';
import 'package:flutter_tutorial/story/story_list.dart';

class HorizontalStoryWidget extends StatelessWidget {
  const HorizontalStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoryList(
      stories: sampleStories,
      onStoryTap: (story) {
        debugPrint('Tapped ${story.username}');
      },
    );
  }
}
