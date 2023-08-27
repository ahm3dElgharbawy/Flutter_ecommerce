import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/db_translator.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/color.dart';
import '../../../data/model/products_model.dart';

class OfferCard extends GetView<OffersController> {
  final ProductsModel productModel;
  const OfferCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    String productId = productModel.productId!;
    FavoriteController favController = Get.put(FavoriteController());
    favController.isFavorite[productId] = productModel.favorite;
    return InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.productDetails, arguments: {"product": productModel});
        },
        child: Stack(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: productModel.productId!,
                    child: CachedNetworkImage(
                      imageUrl: getImageUrl("products", productModel.productImage!),
                      height: 120,
                    ),
                  ),
                  Text(dbTranslator(productModel.productName!, productModel.productNameAr!)),
                  // const RatingBar(title: "Rating 4.5"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          if(productModel.productDiscount != "0" ) Text(
                            "${productModel.price}\$",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue),
                          ),
                          Text(
                            "${productModel.priceWithDiscount}\$",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue),
                          ),
                        ],
                      ),
                      GetBuilder<FavoriteController>(builder: (controller) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isFavorite[productId] == "1") {
                              controller.setFavorite(productId, "0");
                              controller.removeFromFavorite(productId);
                            } else {
                              controller.setFavorite(productId, "1");
                              controller.addToFavorite(productId);
                            }
                          },
                          icon: controller.isFavorite[productId] == '1'
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColor.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline_rounded,
                                  color: AppColor.grey,
                                ),
                        );
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          if (productModel.productDiscount != "0")
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/discount.png",
                  width: 50,
                ),
                Text(
                  "${productModel.productDiscount}%",
                  style: const TextStyle(color: AppColor.white, fontSize: 12),
                )
              ],
            )
        ]));
  }
}
