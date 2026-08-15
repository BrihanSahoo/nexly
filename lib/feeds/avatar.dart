import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String highlight;

  const Avatar({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 70,
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              imageUrl,
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              const SizedBox(height: 5),
              Text(highlight),
            ],
          ),
        ],
      ),
    );
  }
}