import 'dart:async';

import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  RequestStatus status = RequestStatus.isLoading;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  late CameraPosition currentPosition;

  List<Marker> markers = [];
  LatLng? latAndLong;

  getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    currentPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 20,
    );
    status = RequestStatus.none;
    update();
  }

  addMarker(LatLng latLong) {
    markers.clear();
    latAndLong = latLong;
    markers.add(Marker(markerId: const MarkerId("1"), position: latLong));
    update();
  }

  toAddressDetails() {
    if (latAndLong == null) {
      Get.rawSnackbar(message: "You should select location first");
    } else {
      Get.toNamed(AppRoutes.addressDetails, arguments: {
        "latitude": latAndLong?.latitude,
        "longitude": latAndLong?.longitude,
      });
    }
  }

  checkPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (serviceEnabled && (permission == LocationPermission.always ||permission == LocationPermission.whileInUse)) {
      getCurrentPosition();
    } else {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied || !serviceEnabled) {
        status = RequestStatus.none;
        update();
      } else {
        getCurrentPosition();
      }
    }
  }

  @override
  void onInit() {
    currentPosition = const CameraPosition(
      target: LatLng(31.20009243176277, 29.918797460522484),
      zoom: 14.4746,
    );
    checkPermissions();
    super.onInit();
  }
}
