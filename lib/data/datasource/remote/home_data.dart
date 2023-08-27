import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class HomeData {
  static postData() async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.home,{});
    return response.fold((l) => l, (r) => r);
  }
}
