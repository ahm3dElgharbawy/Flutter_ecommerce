import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController {
  MyServices services = Get.find();
  RequestStatus status = RequestStatus.none;
  late double latitude;
  late double longitude;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();

  insertData() async {
    if (formKey.currentState!.validate()) {
      status = RequestStatus.isLoading;
      update();
      var response = await AddressData.postAddData(
        services.prefs.getString("userId")!,
        addressNameController.text,
        cityNameController.text,
        streetNameController.text,
        latitude.toString(),
        longitude.toString(),
      );
      RequestStatus requestStatus = responseHandler(response);
      if (requestStatus == RequestStatus.success) {
        toHomePage();
      }
      status = requestStatus;
      update();
    }
  }

  toHomePage() {
    Get.offAllNamed(AppRoutes.homePage);
  }

  initData() {
    latitude = Get.arguments['latitude'];
    longitude = Get.arguments['longitude'];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
