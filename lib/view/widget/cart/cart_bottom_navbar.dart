import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomNavbar extends GetView<CartController> {
  const CartBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CouponSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total:"),
                      Text("\$${controller.totalSum['total_price'] ?? 0}"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.goToCheckout();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: const Text("Check Out"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class CouponSection extends GetView<CartController> {
  const CouponSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.background2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.discount,
              color: AppColor.blue,
            ),
          ),
          controller.couponModel != null
              ? Column(
                  children: [
                    Text(controller.couponModel!.couponName!),
                    Text("${controller.couponModel!.couponDiscount!}% discount")
                  ],
                )
              : TextButton(
                  onPressed: () {
                    controller.showDialog();
                  },
                  child: Row(
                    children: const [
                      Text("Add coupon code"),
                      Icon(Icons.keyboard_arrow_right_rounded)
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
