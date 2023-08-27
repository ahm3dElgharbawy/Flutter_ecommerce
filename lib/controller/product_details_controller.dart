import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/response_handler.dart';

class ProductDetailsController extends GetxController {
  MyServices myServices = Get.find();
  late ProductsModel productDetails;
  List<Color> productColors = [Colors.red, Colors.green, AppColor.blue];
  int quantity = 0;
  RequestStatus status = RequestStatus.none;

  getProductQuantity(String productId) async {
    status = RequestStatus.isLoading;
    var response = await CartData.productQuantity(
        myServices.prefs.getString("userId")!, productId);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      quantity = int.parse(response['data']['quantity']);
    }
    status = request;
    update();
  }

  add(String productId) async {
    increaseCounter();
    await CartData.postAddData(
        myServices.prefs.getString("userId")!, productId, quantity.toString());
  }

  remove(String productId) async {
    decreaseCounter();
    await CartData.postRemoveData(
        myServices.prefs.getString("userId")!, productId, quantity.toString());
  }

  increaseCounter() {
    quantity++;
    update();
  }

  decreaseCounter() {
    if (quantity > 0) {
      quantity--;
      update();
    }
  }

  goToCart() {
    Get.offNamed(AppRoutes.cart);
  }

  initData() {
    productDetails = Get.arguments['product'];
    getProductQuantity(productDetails.productId!);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
