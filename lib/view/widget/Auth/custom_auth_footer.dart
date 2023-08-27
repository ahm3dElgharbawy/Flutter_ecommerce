import 'package:flutter/material.dart';

class CustomAuthFooter extends StatelessWidget {
  final String title;
  final String linkTitle;
  final void Function()? onPressed;

  const CustomAuthFooter({super.key,required this.title,required this.linkTitle,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        TextButton(
          onPressed: onPressed,
          child: Text(linkTitle),
        )
      ],
    );
  }
}
