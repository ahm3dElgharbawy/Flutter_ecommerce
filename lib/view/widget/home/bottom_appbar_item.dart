import 'package:flutter/material.dart';

class BottomAppBarItem extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String label;
  final Color? activeColor;
  const BottomAppBarItem(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label,
      this.activeColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: activeColor,
        ),
        Text(label,style: TextStyle(color: activeColor),),
      ]),
    );
  }
}
