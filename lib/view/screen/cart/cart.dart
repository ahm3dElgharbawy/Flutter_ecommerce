import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/view/widget/cart/cart_appbar.dart';
import 'package:ecommerce/view/widget/cart/cart_bottom_navbar.dart';
import 'package:ecommerce/view/widget/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: const CartAppbar(),
      bottomNavigationBar: const CartBottomNavbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<CartController>(
          builder: (controller) => ViewDataHandler(
            requestStatus: controller.status,
            widget: ListView.builder(
              itemCount: controller.cartModels.length,
              itemBuilder: (context, i) => CartItem(
                cartModel: controller.cartModels[i],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
