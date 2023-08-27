import 'dart:async';

import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/orders_data.dart';
import 'package:ecommerce/data/model/orders/order_details_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  CameraPosition currentPosition = const CameraPosition(
    target: LatLng(34.233, 44.2034),
    zoom: 14.4746,
  );

  List<Marker> markers = [];
  LatLng? latAndLong;

  List<OrderDetailsModel> details = [];
  RequestStatus status = RequestStatus.isLoading;
  late String orderType;

  getOrderDetails(String orderId, String orderType) async {
    details.clear();
    var response = await OrdersData.postGetOrderDetials(orderId);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      List data = response['data'];
      details.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
      if (orderType == "0") {
        currentPosition = CameraPosition(
          target: LatLng(double.parse(details[0].latitude!),
              double.parse(details[0].longitude!)),
          zoom: 14.4746,
        );
      }
    }
    status = request;
    update();
  }
  toTrackingPage(OrderDetailsModel orderDetailsModel) async {
    // check location service permission
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      return;
    }
    Get.toNamed(AppRoutes.orderTracking,arguments: {"orderDetailsModel": orderDetailsModel});
  }
  @override
  void onInit() {
    orderType = Get.arguments["order_type"];
    getOrderDetails(Get.arguments["order_id"], orderType);
    super.onInit();
  }
}
