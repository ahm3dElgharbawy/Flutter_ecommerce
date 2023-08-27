import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/custom_appbar_search_controller.dart';
import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/view/widget/home/home_categories_bar.dart';
import 'package:ecommerce/view/widget/home/products_bar.dart';
import 'package:ecommerce/view/widget/home/custom_offers_card.dart';
import 'package:ecommerce/view/widget/home/section.dart';
import 'package:ecommerce/view/widget/home/offers_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/home/home_shimmer_loading.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<HomeController>(
          builder: (controller) => ViewDataHandler(
              // onTapOffline: () {
              //   controller.getData();
              // },
              shimmerLoading: const HomeShimmerLoading(),
              requestStatus: controller.status,
              widget: GetBuilder<CustomAppBarSearchController>(
                builder: (appbarController) => appbarController.isSearchActive
                    ? const SearchResult()
                    : ListView(
                        children: [
                          CustomOffersCard(
                              title:controller.settings[0]['setting_title'], body: controller.settings[0]['setting_body']),
                          const Section(leading: "Categories"),
                          const HomeCategoriesBar(),
                          Section(
                              onPressed: () {
                                Get.toNamed(AppRoutes.offers);
                              },
                              leading: "Offers for you",
                              trailing: "See More"),
                          const SpecialOffers(),
                          const Section(
                              leading: "Popular products", trailing: "See More"),
                          const TopSellingProducts()
                        ],
                      ),
              )),
      )
    );
  }
}

class SearchResult extends GetView<CustomAppBarSearchController> {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomAppBarSearchController>(
      builder: (controller) => ViewDataHandler(
        requestStatus: controller.status,
        widget: ListView.builder(
          itemCount: controller.results.length,
          itemBuilder: (context, i) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                controller.toProductDetails(controller.results[i]);
              },
              leading: CachedNetworkImage(
                imageUrl: getImageUrl(
                    "products", controller.results[i].productImage!),
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(controller.results[i].productName!),
              subtitle: Text(controller.results[i].productDesc!),
            ),
          ),
        ),
      ),
    );
  }
}
