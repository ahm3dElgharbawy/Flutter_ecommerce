import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartAppbar extends GetView<CartController> with PreferredSizeWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          const Text(
          "My Cart",
          style: TextStyle(color: AppColor.black),
        ),
        GetBuilder<CartController>(builder:(controller)=> Text("${controller.totalSum['total_quantity']??0} items",style: const TextStyle(color: AppColor.grey,height: 1,fontSize: 14),))
        ],),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.grey,
            )),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}