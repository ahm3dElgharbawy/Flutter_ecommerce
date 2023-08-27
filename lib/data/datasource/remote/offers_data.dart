import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class OffersData {
  static postGetOffers(String userId) async {
    Crud crud = Get.find();
    var response = await crud.postData(Links.offers,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
}
