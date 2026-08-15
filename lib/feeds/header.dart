import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tutorial/feeds/avatar.dart';
import 'package:flutter_tutorial/feeds/custom_button.dart';

class Header extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String highlight;
  final VoidCallback onTap;

  const Header({
    required this.imageUrl,
    required this.username,
    required this.highlight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Avatar(imageUrl: imageUrl, username: username, highlight: highlight),
          Spacer(),
          CustomButton(onTap: onTap)
        ]
        ),
    );
  }
}
