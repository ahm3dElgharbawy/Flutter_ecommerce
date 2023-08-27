import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite/favorites_page_controller.dart';
import 'package:ecommerce/core/functions/db_translator.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/data/model/favorites_model.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/color.dart';

class FavoriteCard extends GetView<FavoritesPageController> {
  final FavoritesModel favoritesModel;
  const FavoriteCard({super.key, required this.favoritesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toProductDetails(ProductsModel.fromJson(favoritesModel.toJson()));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: getImageUrl("products", favoritesModel.productImage!),
                height: 120,
              ),
              Text(dbTranslator(
                  favoritesModel.productName!, favoritesModel.productNameAr!)),
              // const RatingBar(title: "Rating 4.5"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${favoritesModel.price}\$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.blue),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.removeFavorite(favoritesModel.favoriteId!);
                    },
                    icon: const Icon(
                      Icons.highlight_remove_rounded,
                      color: AppColor.red,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
