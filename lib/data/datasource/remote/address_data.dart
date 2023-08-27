import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class AddressData {
  static Crud crud = Get.find();

  static postAddData(String userId, String addressName, String city,
      String street, String latitude, String longitude) async {
    var response = await crud.postData(Links.addAddress, {
      "user_id": userId,
      "address_name": addressName,
      "city": city,
      "street": street,
      "latitude" : latitude,
      "longitude": longitude
    });
    return response.fold((l) => l, (r) => r);
  }
  static postGetData(String userId) async {
    var response = await crud.postData(Links.viewAddress,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }

  static postRemoveData(String addressId) async {
    var response = await crud.postData(Links.removeAddress,{"address_id":addressId});
    return response.fold((l) => l, (r) => r);
  }

}
