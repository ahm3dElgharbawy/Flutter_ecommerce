import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

class DeliveryTypeCard extends StatelessWidget {
  final IconData icon;
  final bool active;
  const DeliveryTypeCard(
      {super.key, required this.icon, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      decoration: active
          ? BoxDecoration(
              color: AppColor.blue, borderRadius: BorderRadius.circular(10))
          : BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.grey3),
            ),
      child: active
          ? Icon(
              icon,
              color: AppColor.white,
              size: 40,
            )
          : Icon(
              icon,
              size: 40,
            ),
    );
  }
}