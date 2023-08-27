import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

class CustomOffersCard extends StatelessWidget {
  final String title;
  final String body;
  const CustomOffersCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: const Color(0xFF3F85FF),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Positioned(
          left: -40,
          top: -20,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 95, 255),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Container(
          height: 100,
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(color: AppColor.white, fontSize: 12),
            ),
            subtitle: Text(
              body,
              style: const TextStyle(color: AppColor.white, fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }
}
