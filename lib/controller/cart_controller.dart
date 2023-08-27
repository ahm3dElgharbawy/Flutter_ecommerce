import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/coupon_model.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/response_handler.dart';
import '../data/model/cart_model.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  List<CartModel> cartModels = [];
  Map totalSum = {};  // total_price , ... 
  RequestStatus status = RequestStatus.none;
  late TextEditingController couponCodeController;
  CouponModel? couponModel;

  viewCart() async {
    cartModels.clear();
    totalSum.clear();
    status = RequestStatus.isLoading;
    var response = await CartData.postViewCart(myServices.prefs.getString("userId")!);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      List cart = response['totalInfo'];
      cartModels.addAll(cart.map(
        (e) => CartModel.fromJson(e),
      ));
      totalSum = response['totalSum'];
    }
    status = request;
    update();
  }
  goToProductDetails(ProductsModel productModel) {
    Get.offNamed(AppRoutes.productDetails, arguments: {"product": productModel});
  }

  addCoupon(String couponCode) async{
    status = RequestStatus.isLoading;
    var response = await CartData.postAddCoupon(couponCode);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      couponModel = CouponModel.fromJson(response['data']);
      totalSum['total_price'] = calculateResult(couponModel!.couponDiscount!);
    }
    else {
        Get.snackbar(
        "alert",
        "invalid coupon",
        barBlur: 0,
        backgroundColor: AppColor.red,
        colorText: AppColor.white,
        duration: const Duration(milliseconds: 1200),
        padding: const EdgeInsets.all(10)
      );
    }
    status = RequestStatus.none;
    update();
  }

  calculateResult(String couponDiscount) {
    double total = double.parse(totalSum['total_price']);
    int discount = int.parse(couponDiscount);
    return total - total * discount / 100;
  }

  showDialog(){
    Get.defaultDialog(
      title: "Add coupon",
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: couponCodeController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
            hintText: "Enter coupon code",
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      buttonColor: AppColor.blue,
      cancelTextColor: AppColor.black,
      confirmTextColor: AppColor.white,
      onConfirm: () {
        addCoupon(couponCodeController.text);
        couponCodeController.clear();
        Get.back();
      },
      onCancel: () {},
    );
  }
  goToCheckout(){
    if(totalSum['total_price']!=null){
      Get.toNamed(AppRoutes.checkout,arguments: {
        'orderPrice' : totalSum['total_price'].toString(),
        'couponId' : couponModel?.couponId??'0',
      });
    }
  }



  @override
  void onInit() {
    couponCodeController = TextEditingController();
    viewCart();
    super.onInit();
  }
}
