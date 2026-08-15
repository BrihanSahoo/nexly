import 'package:flutter/material.dart';
import 'package:flutter_tutorial/feeds/header.dart';

class FuturisticBox extends StatelessWidget {
  const FuturisticBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Container(
        width: double.maxFinite,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
          color: Color.fromARGB(255, 146, 145, 226),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Header(
                imageUrl: 'https://picsum.photos/id/1016/1080/1920',
                username: 'john_doe',
                highlight: 'John\'s Story',
                onTap: () {
                  print('Button tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
