import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:55,
      width:55,
      decoration: BoxDecoration(
        color:Colors.lightGreenAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child:IconButton(
        onPressed:onTap, 
        icon:const Icon(
          Icons.arrow_forward_rounded,
          color:Colors.black,
          size:28,
        )
        ),
    );
  }
}
