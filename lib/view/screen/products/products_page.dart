import 'package:ecommerce/controller/products/products_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:ecommerce/view/widget/custom_appbar_search.dart';
import 'package:ecommerce/view/widget/products/products_categories_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/products/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    return Scaffold(
      appBar: const CustomAppBarSearch(searchTitle: "Search product"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const ProductsCategoriesBar(),
            GetBuilder<ProductsController>(
              builder: (controller) => ViewDataHandler(
                requestStatus: controller.status,
                widget: GridView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: 2),
                    itemBuilder: (context, i) {
                      return ProductCard(
                        productModel: ProductsModel.fromJson(controller.products[i]),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
