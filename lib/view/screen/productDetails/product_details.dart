import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/core/shared/public_bottom_navbar.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/view/widget/productDetails/colors_bar.dart';
import 'package:ecommerce/view/widget/productDetails/product_details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "product details",
            style: TextStyle(color: AppColor.black),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.grey,
              )),
        ),
        bottomNavigationBar: PublicBottomNavBar(
          onPressed: () {
            controller.goToCart();
          },
          title: "Go To Cart",
        ),
        body: Container(
          width: Get.width,
          color: AppColor.background,
          child: ListView(children: [
            Hero(
              tag: controller.productDetails.productId!,
              child: CachedNetworkImage(
                imageUrl: getImageUrl("products", controller.productDetails.productImage!),
                height: 250,
                width: 250,
              ),
            ),
            const ProductDetailsCard(),
            GetBuilder<ProductDetailsController>(
                builder: (controller) => ViewDataHandler(
                      requestStatus: controller.status,
                      widget: const ColorsBar(),
                    ))
          ]),
        ));
  }
}
