import 'package:flutter/material.dart';
import 'package:flutter_tutorial/story/sample/sample_stories.dart';
import 'package:flutter_tutorial/story/story_list.dart';

class HorizontalStoryWidget extends StatelessWidget {
  const HorizontalStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _StoryHeaderDelegate(),
    );
  }
}

class _StoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  static const double minHeight = 108;
  static const double maxHeight = 200;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double progress =
        (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
          bottomLeft: Radius.circular(45),
        ),
        child: Container(
          color: Colors.lightGreenAccent,
          child: Stack(
            children: [
              // ==========================
              // STORIES
              // ==========================
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 108,
                child: StoryList(
                  stories: sampleStories,
                  onStoryTap: (story) {
                    print('Tapped -> ${story.username}');
                  },
                ),
              ),

              // ==========================
              // NEXLY + NOTIFICATION
              // ==========================
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: ClipRect(
                  child: Opacity(
                    opacity: 1 - progress,
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        -40 * progress,
                      ),
                      child: SizedBox(
                        height: 92,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Nexly',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.notifications,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(
    covariant _StoryHeaderDelegate oldDelegate,
  ) {
    return false;
  }
}