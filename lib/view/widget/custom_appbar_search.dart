import 'package:ecommerce/controller/custom_appbar_search_controller.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarSearch extends StatelessWidget with PreferredSizeWidget {
  final String searchTitle;
  const CustomAppBarSearch({super.key, required this.searchTitle});

  @override
  Widget build(BuildContext context) {
    CustomAppBarSearchController controller = Get.put(CustomAppBarSearchController());
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColor.black),
      elevation: 0,
      title: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: controller.textController,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    controller.getSearchResult();
                  },
                  onChanged: (val) {
                    if (val == "") {
                      controller.changeSearchState(false);
                      controller.results.clear();
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 0, bottom: 0, right: 15),
                      prefixIcon: const Icon(Icons.search),
                      hintText: searchTitle, // "Search product"
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: AppColor.grey3),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                TrailingIcon(
                  icon: Icons.shopping_cart_outlined,
                  onPressed: () {
                    Get.toNamed(AppRoutes.cart);
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                TrailingIcon(
                  icon: Icons.notifications_none_rounded,
                  onPressed: () {
                    controller.toNotifications();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class TrailingIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const TrailingIcon({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: AppColor.grey3, borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        splashRadius: 25,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColor.grey,
        ),
      ),
    );
  }
}
