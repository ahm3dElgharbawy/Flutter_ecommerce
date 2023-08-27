import 'package:ecommerce/core/constants/image_asset.dart';
import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/view/widget/language/custom_lang_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.grey3, borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "choose the language".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomLangButton(
                title: "Arabic".tr,
                leadingImage: Image.asset(AppImageAsset.egLogo),
                onClick: () {
                  controller.changeLanguage('ar');
                  Get.toNamed("onBoarding");
                },
              ),
              CustomLangButton(
                title: "English".tr,
                leadingImage: Image.asset(AppImageAsset.usLogo),
                onClick: () {
                  controller.changeLanguage('en');
                  Get.toNamed("onBoarding");
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
