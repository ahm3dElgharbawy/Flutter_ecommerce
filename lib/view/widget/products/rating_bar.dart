import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final String title;
  const RatingBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        Row(
          children:
              List.generate(5, (index) => const Icon(Icons.star, size: 12)),
        )
      ],
    );
  }
}
