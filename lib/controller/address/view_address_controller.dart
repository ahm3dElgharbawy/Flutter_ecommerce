import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController{
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.isLoading;
  List<AddressModel> models = [];

  getData() async {
    var response =
        await AddressData.postGetData(myServices.prefs.getString("userId")!);
    RequestStatus requestStatus = responseHandler(response);
    if (requestStatus == RequestStatus.success) {
      status = RequestStatus.success;
      List data = response['data'];
      models.addAll(data.map((e) => AddressModel.fromJson(e)));
    }
    status = requestStatus;
    update();
  }
  removeData(String addressId){
    models.removeWhere((e) => e.addressId==addressId);
    AddressData.postRemoveData(addressId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
