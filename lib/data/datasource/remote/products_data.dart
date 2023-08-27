import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class ProductsData {
  static postData(String catId,String userId) async {
    Crud crud = Get.find();
    var response = await crud.postData(Links.products,{"category_id":catId,"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
}
