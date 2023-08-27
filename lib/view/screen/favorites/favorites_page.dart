import 'package:ecommerce/controller/favorite/favorites_page_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/view/widget/favorites/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritesPageController controller =  Get.put(FavoritesPageController());
    
    return RefreshIndicator(
      onRefresh: (){
        controller.getFavorites();
        return Future.value(1);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GetBuilder<FavoritesPageController>(
          builder:(controller) =>ViewDataHandler(
            requestStatus: controller.status,
            widget: ListView(
              children: [
                GridView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.favorites.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, i) {
                      return FavoriteCard(
                        favoritesModel: controller.favorites[i],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
