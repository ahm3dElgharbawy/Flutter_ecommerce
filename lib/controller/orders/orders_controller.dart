import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders_data.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/orders/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.none;
  List<OrdersModel> orders = [];


  getOrders() async {
    orders.clear();
    status = RequestStatus.isLoading;
    update();
    var response = await OrdersData.postGetOrders(myServices.prefs.getString("userId")!);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      List data = response['data'];
      orders.addAll(data.map((e)=>OrdersModel.fromJson(e)));
    }
    status = request;
    update();
  }
  removeOrder($orderId){
    orders.removeWhere((order) => order.orderId == $orderId);
    OrdersData.postRemoveOrder($orderId);
    update();
  }

  getOrderStatus(String statusCode){
    switch(statusCode){
      case "0" : {
        return const Text("Pending Approved",style: TextStyle(color: AppColor.orange),);
      }
      case "1" : {
        return const Text("Approved",style: TextStyle(color: AppColor.blue),);
      }
      case "2" : {
        return const Text("Preparing",style: TextStyle(color: AppColor.blue),);
      }
      case "3" : {
        return const Text("On The Way",style: TextStyle(color: AppColor.green),);
      }
      default: {
        return const Text("Done",style: TextStyle(color: AppColor.green),);
      }
    }
  }

  toOrderDetails(String orderId,String orderType){
    Get.toNamed(AppRoutes.orderDetails,arguments: {"order_id":orderId,"order_type":orderType});
  }

  refreshOrders(){
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

}