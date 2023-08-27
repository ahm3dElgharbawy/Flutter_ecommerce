import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class CartData {
    static Crud crud = Get.find();

  static postAddData(String userId,String productId,String quantity) async {
    var response = await crud.postData(Links.addToCart,{"user_id":userId,"product_id":productId,"quantity":quantity});
    return response.fold((l) => l, (r) => r);
  }
  static postRemoveData(String userId,String productId,String quantity) async {
    var response = await crud.postData(Links.removeFromCart,{"user_id":userId,"product_id":productId,"quantity":quantity});
    return response.fold((l) => l, (r) => r);
  }
  static productQuantity(String userId,String productId) async {
    var response = await crud.postData(Links.getProductQuantity,{"user_id":userId,"product_id":productId});
    return response.fold((l) => l, (r) => r);
  }
  static postViewCart(String userId) async {
    var response = await crud.postData(Links.viewCart,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
  static postAddCoupon(String code) async {
    var response = await crud.postData(Links.coupon,{"coupon_code": code});
    return response.fold((l) => l, (r) => r);
  }
  
}