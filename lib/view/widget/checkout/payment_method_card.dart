import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodCard extends GetView<CheckoutController> {
  final String imagePath;
  final bool active;
  const PaymentMethodCard(
      {super.key, required this.imagePath, required this.active});

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
          ? Image.asset(imagePath,width:30,color: AppColor.white,)
          : Image.asset(imagePath,width: 30,)
    );
  }
}