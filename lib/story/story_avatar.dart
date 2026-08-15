import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String imageURL;
  final bool isSeen;

  const StoryAvatar({required this.imageURL, required this.isSeen});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:68,
      height:68,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient:isSeen
          ?const LinearGradient(
            colors:[
              Colors.grey,
              Colors.grey
            ]
          )
          : const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFEDA75),
              Color(0xFFFA7E1E),
              Color(0xFFD62976),
              Color(0xFF962FBF),
            ]
          )
      ),

      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color:Colors.white
        ),
        child: ClipOval(
          child:Image.network(this.imageURL,fit: BoxFit.cover),
        ),
      )
    );
  }
}
