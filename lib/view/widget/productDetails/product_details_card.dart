import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/functions/db_translator.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsCard extends GetView<ProductDetailsController> {
  const ProductDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: Get.width,
              height: 220,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dbTranslator(controller.productDetails.productName!, controller.productDetails.productNameAr!),
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      dbTranslator(controller.productDetails.productDesc!, controller.productDetails.productDescAr!),
                      style: const TextStyle(color: Color(0xFF959594)),
                    ),
                  ]),
            );
  }
}