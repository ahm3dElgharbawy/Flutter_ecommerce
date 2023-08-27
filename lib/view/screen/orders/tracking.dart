import 'package:ecommerce/controller/orders/tracking_controller.dart';
import 'package:ecommerce/core/shared/public_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
      appBar: const PublicAppBar(title: Text("Track order")),
      body: SizedBox(
        height: 700,
        child: GetBuilder<TrackingController>(
          builder: (controller) => GoogleMap(
            polylines: controller.polylines,
            mapType: MapType.normal,
            markers: controller.markers,
            initialCameraPosition: controller.currentPosition,
            onMapCreated: (GoogleMapController gmc) {
              controller.gmc = gmc;
            },
          ),
        ),
      ),
    );
  }
}
