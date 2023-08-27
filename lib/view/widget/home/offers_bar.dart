import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/db_translator.dart';

class SpecialOffers extends GetView<HomeController> {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.offers.length,
          itemBuilder: (context, i) {
            return OfferCard(
                index: i,
                product: ProductsModel.fromJson(controller.offers[i]));
          }),
    );
  }
}

class OfferCard extends StatelessWidget {
  final int index;
  final ProductsModel product;

  const OfferCard({super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Get.toNamed(AppRoutes.productDetails,arguments: {"product":product});
      },
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: AppColor.secondary, borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dbTranslator(product.productName!, product.productNameAr!),
                  style: const TextStyle(color: AppColor.white, fontSize: 16),
                ),
                Text(
                  "discount ${product.productDiscount}%",
                  style: const TextStyle(color: AppColor.white),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: getImageUrl("products", product.productImage!),
            height: 110,
            width: 110,
          ),
        ]),
      ),
    );
  }
}
