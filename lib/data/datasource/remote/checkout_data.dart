import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class CheckoutData {
  static Crud crud = Get.find();

  static postAddData(Map data) async {
    var response = await crud.postData(Links.checkout,data);
    return response.fold((l) => l, (r) => r);
  }
}
