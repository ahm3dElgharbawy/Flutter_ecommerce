import 'package:ecommerce/core/class/delivery_types.dart';
import 'package:ecommerce/core/class/payment_methods.dart';
import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.none;
  List<AddressModel> models = [];

  PaymentMethods paymentMethod = PaymentMethods.cash;
  DeliveryTypes deliveryType = DeliveryTypes.delivery;
  late String orderPrice;
  int deliveryPrice = 10;
  late double finalPrice;
  late String couponId;
  String? addressId;

  getAddresses() async {
    status = RequestStatus.isLoading;
    var response = await AddressData.postGetData(myServices.prefs.getString("userId")!);
    RequestStatus requestStatus = responseHandler(response);
    if (requestStatus == RequestStatus.success) {
      List data = response['data'];
      models.addAll(data.map((e) => AddressModel.fromJson(e)));
    }
    status = requestStatus;
    update();
  }

  checkout() async {
    if (addressId == null && deliveryType==DeliveryTypes.delivery) {
      return Get.snackbar(
        "alert",
        "select your address",
        barBlur: 0,
        backgroundColor: AppColor.red,
        colorText: AppColor.white,
        duration: const Duration(milliseconds: 1200),
        padding: const EdgeInsets.all(10)
      );
    }
    Map<String, String?> data = {
      "user_id": myServices.prefs.getString("userId").toString(),
      "address_id": addressId??'0',
      "payment_type": paymentMethod == PaymentMethods.cash ? '0' : '1',
      "order_type": deliveryType == DeliveryTypes.delivery ? '0' : '1',
      "order_price": orderPrice,
      "final_price" : (double.parse(orderPrice)  + deliveryPrice).toString(),
      "delivery_price": deliveryPrice.toString(),
      "coupon_id": couponId
    };
    status = RequestStatus.isLoading;
    var response = await CheckoutData.postAddData(data);
    RequestStatus requestStatus = responseHandler(response);
    if (requestStatus == RequestStatus.success) {
      Get.offAllNamed(AppRoutes.homePage);
      Get.snackbar(
        "alert",
        "order success",
        barBlur: 0,
        colorText: AppColor.white,
        backgroundColor: AppColor.black.withOpacity(0.4),
        padding: const EdgeInsets.all(10)
      );
    }
    status = requestStatus;
    update();
  }

  setPaymentMethod(PaymentMethods payMethod) {
    paymentMethod = payMethod;
    update();
  }

  setDeliveryType(DeliveryTypes delivType) {
    deliveryType = delivType;
    deliveryPrice = (deliveryType == DeliveryTypes.delivery) ? 10 : 0;
    update();
  }

  setSelectedAddress(String addId) {
    addressId = addId;
    update();
  }

  @override
  void onInit() {
    orderPrice = Get.arguments["orderPrice"];
    couponId = Get.arguments["couponId"];
    getAddresses();
    super.onInit();
  }
}
