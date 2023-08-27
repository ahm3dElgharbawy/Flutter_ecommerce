import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsBar extends GetView<ProductDetailsController> {
  const ColorsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            controller.productColors.length,
            (index) => Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: controller.productColors[index],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                controller.remove(controller.productDetails.productId!);
              },
              icon: const Icon(Icons.remove_circle),
              iconSize: 40,
            ),
            GetBuilder<ProductDetailsController>(
              builder: (controller) => Text(controller.quantity.toString()),
            ),
            IconButton(
              onPressed: () {
                controller.add(controller.productDetails.productId!);
              },
              icon: const Icon(Icons.add_circle),
              iconSize: 40,
            ),
          ],
        )
      ]),
    );
  }
}
