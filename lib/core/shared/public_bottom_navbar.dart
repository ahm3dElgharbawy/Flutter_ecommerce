import 'package:flutter/material.dart';

class PublicBottomNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final String title; 
  const PublicBottomNavBar({super.key, this.onPressed, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title),
          ), 
        );
  }
}