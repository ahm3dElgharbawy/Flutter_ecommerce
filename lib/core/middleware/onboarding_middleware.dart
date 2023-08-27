import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingMiddleware extends GetMiddleware {
  final services = Get.find<MyServices>();
  @override
  RouteSettings? redirect(String? route){
    if(services.prefs.getString('step')=="2"){
      return const RouteSettings(name:AppRoutes.homePage);
    }
    if(services.prefs.getString('step')=="1"){
      return const RouteSettings(name:AppRoutes.login);
    }
    return null;
  }
}