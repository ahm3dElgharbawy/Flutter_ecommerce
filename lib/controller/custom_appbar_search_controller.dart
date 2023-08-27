import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/search_data.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarSearchController extends GetxController {
  late TextEditingController textController;
  bool isSearchActive = false;
  RequestStatus status = RequestStatus.none;
  List<ProductsModel> results = [];

  changeSearchState(bool state) {
    isSearchActive = state;
    update();
  }

  getSearchResult() async {
    if (textController.text.trim() != "") {
      results.clear();
      changeSearchState(true);
      status = RequestStatus.isLoading;
      var response = await SearchData.search(textController.text);
      RequestStatus request = responseHandler(response);
      if (request == RequestStatus.success) {
        List data = response['data'];
        results.addAll(data.map((e) => ProductsModel.fromJson(e)));
      }
      status = request;
      update();
    }
  }

  toProductDetails(ProductsModel product) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"product": product});
  }

  toNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }

  @override
  void onInit() {
    textController = TextEditingController();
    super.onInit();
  }
}
