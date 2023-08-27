import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class OrdersData {
    static Crud crud = Get.find();
  // get !done orders
  static postGetOrders(String userId) async {
    var response = await crud.postData(Links.orders,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
  // get done orders
  static postGetArchivedOrders(String userId) async {
    var response = await crud.postData(Links.archivedOrders,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
  // get order details
  static postGetOrderDetials(String orderId) async {
    var response = await crud.postData(Links.orderDetails,{"order_id":orderId});
    return response.fold((l) => l, (r) => r);
  }
  // remove order
  static postRemoveOrder(String orderId) async {
    var response = await crud.postData(Links.removeOrder,{"order_id":orderId});
    return response.fold((l) => l, (r) => r);
  }
  // remove order
  static postAddRating(String orderId,String rating, String comment) async {
    var response = await crud.postData(Links.rating,{"order_id":orderId,"rating":rating,"comment":comment});
    return response.fold((l) => l, (r) => r);
  }


  
}