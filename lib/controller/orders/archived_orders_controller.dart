import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders_data.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/orders/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrdersController extends GetxController {
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.none;
  List<OrdersModel> archivedOrders = [];


  getArchivedOrders() async {
    archivedOrders.clear();
    status = RequestStatus.isLoading;
    update();
    var response = await OrdersData.postGetArchivedOrders(myServices.prefs.getString("userId")!);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      List data = response['data'];
      archivedOrders.addAll(data.map((e)=>OrdersModel.fromJson(e)));
    }
    status = request;
    update();
  }
  getOrderStatus(String statusCode){
    switch(statusCode){
      case "0" : {
        return const Text("Pending Approved",style: TextStyle(color: AppColor.orange),);
      }
      case "1" : {
        return const Text("Preparing",style: TextStyle(color: AppColor.green),);
      }
      case "2" : {
        return const Text("On The Way",style: TextStyle(color: AppColor.blue),);
      }
      default: {
        return const Text("done",style: TextStyle(color: AppColor.blue),);
      }
    }
  }
  addOrderRating(String orderId,String rating,String comment)async{
    status = RequestStatus.isLoading;
    update();
    var response = await OrdersData.postAddRating(orderId,rating,comment);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      getArchivedOrders();
      return ;
    }
    status = request;
    update();
  }
  toOrderDetails(String orderId,String orderType){
    Get.toNamed(AppRoutes.orderDetails,arguments: {"order_id":orderId,"order_type":orderType});
  }

  @override
  void onInit() {
    getArchivedOrders();
    super.onInit();
  }
}