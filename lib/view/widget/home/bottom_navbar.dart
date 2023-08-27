import 'package:ecommerce/controller/home/home_page_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/view/widget/home/bottom_appbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<HomePageController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => SizedBox(
        height: 70,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomAppBar(
            color: AppColor.grey3,
            child: Row(
              children: List<Widget>.generate(
                controller.pages.length,
                (i) => BottomAppBarItem(
                  onPressed: () {
                    controller.changePage(i);
                  },
                  icon: controller.bottomNavItems[i]['icon'],
                  activeColor: controller.currentPage == i
                      ? AppColor.blue
                      : AppColor.black,
                  label: controller.bottomNavItems[i]['label'],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
