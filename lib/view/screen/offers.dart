import 'package:ecommerce/controller/custom_appbar_search_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:ecommerce/view/widget/offers/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_appbar_search.dart';
import 'home/home.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return Scaffold(
      appBar: const CustomAppBarSearch(searchTitle: "Search product"),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<OffersController>(
          builder: (controller) => ViewDataHandler(
            requestStatus: controller.status,
            widget: GetBuilder<CustomAppBarSearchController>(
              builder: (appbarController) => appbarController.isSearchActive
                  ? const SearchResult()
                  : GridView.builder(
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.offers.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              childAspectRatio: 0.6,
                              mainAxisSpacing: 2),
                      itemBuilder: (context, i) {
                        return OfferCard(
                          productModel:
                              ProductsModel.fromJson(controller.offers[i]),
                        );
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
