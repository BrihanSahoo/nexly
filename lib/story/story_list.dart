import 'package:flutter/material.dart';
import 'package:flutter_tutorial/story/model/story.dart';
import 'package:flutter_tutorial/story/story_item.dart';
import 'package:get/get.dart';

class StoryList extends StatelessWidget {
  final List<Story> stories;
  final ValueChanged<Story> onStoryTap;

  const StoryList({super.key, required this.stories, required this.onStoryTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection:Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal:16),
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: this.stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return StoryItem(
            story:story,
            onTap:()=>onStoryTap(story)
          );
        },
      ),
    );
  }
}
