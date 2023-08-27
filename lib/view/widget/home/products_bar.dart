import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/db_translator.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopSellingProducts extends GetView<HomeController> {
  const TopSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.topSellingProducts.length,
          itemBuilder: (context, i) {
            return ProductBox(
                index: i,
                products: ProductsModel.fromJson(controller.topSellingProducts[i]));
          }),
    );
  }
}

class ProductBox extends StatelessWidget {
  final int index;
  final ProductsModel products;

  const ProductBox({super.key, required this.index, required this.products});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Get.toNamed(AppRoutes.productDetails,arguments: {"product":products});
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
                  dbTranslator(products.productName!, products.productNameAr!),
                  style: const TextStyle(color: AppColor.white, fontSize: 16,overflow: TextOverflow.ellipsis),
                ),
                Text(
                  products.productDesc!,
                  style: const TextStyle(color: AppColor.white),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: getImageUrl("products",products.productImage!),
            height: 110,
            width: 110,
          ),
        ]),
      ),
    );
  }
}
