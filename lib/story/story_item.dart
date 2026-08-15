import 'package:flutter/material.dart';
import 'package:flutter_tutorial/story/model/story.dart';
import 'package:flutter_tutorial/story/story_avatar.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final VoidCallback onTap;

  const StoryItem({required this.story, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: SizedBox(
        width:72,
        child:Column(
          children: [
            StoryAvatar(
              imageURL:story.avatarURL, 
              isSeen: story.isSeen
            ),

            const SizedBox(height:6,),

            Text(
              story.username,
              maxLines:1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize:12
              ),
            )
          ],
        ),
      ),
    );
  }
}
