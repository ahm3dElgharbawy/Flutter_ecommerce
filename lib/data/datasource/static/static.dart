import 'package:ecommerce/core/constants/image_asset.dart';
import 'package:ecommerce/data/model/app_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List <AppBoardingModel> appBoardingList = [
  AppBoardingModel(
      title: "Choose Product",
      image: AppImageAsset.imageOne,
      body:
          "We Have a 100k+ Products Choose Your product from our E-commerce shop."),
  AppBoardingModel(
      title: "Easy & Safe Payment",
      image: AppImageAsset.imageTwo,
      body:
          "Easy Checkout & Safe Payment method. Trusted by our Customers from all over the world."),
  AppBoardingModel(
      title: "Track Your Order",
      image: AppImageAsset.imageThree,
      body:
          "Best Tracker has been Used For Track your order. You'll know where your product is a the moment."),
  AppBoardingModel(
      title: "Fast Delivery",
      image: AppImageAsset.imageFour,
      body:
          "Reliable And Fast Delivery. We Deliver Your Product the fastest way possible."),
];

final EdgeInsets roundedButtonPadding = EdgeInsets.all(Get.locale!.languageCode == "ar" ? 10 : 15);

String? lang  = Get.locale!.languageCode;