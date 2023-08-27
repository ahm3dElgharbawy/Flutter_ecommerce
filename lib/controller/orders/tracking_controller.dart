import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/orders/order_details_model.dart';

class TrackingController extends GetxController {
  GoogleMapController? gmc;
  late CameraPosition currentPosition;
  StreamSubscription<Position>? stream;
  OrderDetailsModel model = Get.arguments["orderDetailsModel"];

  Set<Marker> markers = {};
  late double srcLat;
  late double srcLong;
  late double deliveryLat;
  late double deliveryLong;

  Set<Polyline> polylines = {};
  Timer? timer;

  getMyPostion() {
    currentPosition = CameraPosition(
      target: LatLng(srcLat, srcLong),
      zoom: 10,
    );
    markers.add(
      Marker(
        markerId: const MarkerId("current"),
        position: LatLng(srcLat, srcLong),
      ),
    );
  }

  getDeliveryLocation() {
    FirebaseFirestore.instance.collection("delivery").doc(model.orderId).snapshots().listen((event) { 
      if (event.exists) {
        deliveryLat = event.get("latitude");
        deliveryLong = event.get("longitude");
        markers.removeWhere((marker) => marker.markerId.value == "delivery");
        markers.add(
          Marker(
            markerId: const MarkerId("delivery"),
            position: LatLng(deliveryLat, deliveryLong),
          ),
        );
        update();
      }
    });

  }

  @override
  void onInit() {
    srcLat = double.parse(model.latitude!);
    srcLong = double.parse(model.longitude!);
    getMyPostion();
    getDeliveryLocation();

    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}
