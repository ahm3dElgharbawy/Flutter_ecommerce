import 'package:ecommerce/controller/products/products_controller.dart';
import 'package:ecommerce/core/functions/db_translator.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsCategoriesBar extends GetView<ProductsController> {
  const ProductsCategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, i) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, i) => Categories(
            categories: CategoriesModel.fromJson(controller.categories[i])),
      ),
    );
  }
}

class Categories extends GetView<ProductsController> {
  final CategoriesModel categories;
  const Categories(
      {super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.selectCategory(categories.categoryId!);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: controller.selectedCatId == categories.categoryId?BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)):null,
          child: Text(
            dbTranslator(categories.categoryName!, categories.categoryNameAr!),
            style: TextStyle(
                color: controller.selectedCatId == categories.categoryId
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
