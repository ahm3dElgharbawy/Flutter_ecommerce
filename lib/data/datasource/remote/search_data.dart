import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class SearchData {
  static search(String key) async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.search,{"key":key});
    return response.fold((l) => l, (r) => r);
  }
}
