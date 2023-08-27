import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout(){
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user${myServices.prefs.getString('userId')}}");

    myServices.prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
  toAddress(){
    Get.toNamed(AppRoutes.viewAddress);
  }

  toPendingOrders(){
    Get.toNamed(AppRoutes.orders);
  }
}
