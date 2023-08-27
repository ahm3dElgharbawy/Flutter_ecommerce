import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/view/widget/onboarding/custom_onboarding_button.dart';
import 'package:ecommerce/view/widget/onboarding/custom_onboarding_dots_controller.dart';
import 'package:ecommerce/view/widget/onboarding/custom_onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(
              flex: 3, child: CustomOnBoardingSlider(), // PageView builder
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  SizedBox(
                    height: 25,
                  ),
                  CustomOnBoardingDotsController(), // list of containers inside Row
                  SizedBox(
                    height: 50,
                  ),
                  CustomOnBoardingButton(), // elevated button
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
