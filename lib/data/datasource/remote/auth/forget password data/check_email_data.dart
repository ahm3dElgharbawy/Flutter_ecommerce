import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class CheckEmailData {
  static postData(String email) async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.checkEmail, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
