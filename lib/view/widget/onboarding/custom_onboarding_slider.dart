import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomOnBoardingSlider extends GetView<OnBoardingController> {
  const CustomOnBoardingSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: appBoardingList.length,
      itemBuilder: (context, i) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            appBoardingList[i].title!.tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 50),
          SvgPicture.asset(
            appBoardingList[i].image!,
            height: 300,
          ),
          const SizedBox(height: 40),
          Text(
            appBoardingList[i].body!.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
