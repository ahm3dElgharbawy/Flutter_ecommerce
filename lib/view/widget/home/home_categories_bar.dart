import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/functions/db_translator.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCategoriesBar extends GetView<HomeController> {
  const HomeCategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, i) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, i) => CategoryBox(
            categories: CategoriesModel.fromJson(controller.categories[i])),
      ),
    );
  }
}

class CategoryBox extends GetView<HomeController> {
  final CategoriesModel categories;
  const CategoryBox({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toProductsPage(controller.categories, categories.categoryId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColor.grey3, borderRadius: BorderRadius.circular(30)),
            child: SvgPicture.network(
              getImageUrl("categories",categories.categoryImage!),
              width: 40,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              dbTranslator(categories.categoryName!, categories.categoryNameAr!),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.6),
            ),
          )
        ],
      ),
    );
  }
}
