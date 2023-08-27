import 'package:ecommerce/controller/orders/order_details_controller.dart';
import 'package:ecommerce/core/class/request_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsAddress extends GetView<OrderDetailsController> {
  const OrderDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Shipping Address"),
        if (controller.status == RequestStatus.success)
          Card(
            child: ListTile(
              title: Text(controller.details[0].city!),
              subtitle: Text(controller.details[0].street!),
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        if (controller.orderType == "0")
          Card(
            child: SizedBox(
              height: 300,
              child: GoogleMap(
                markers: controller.markers.toSet(),
                mapType: MapType.normal,
                initialCameraPosition: controller.currentPosition,
                onMapCreated: (GoogleMapController gmc) {
                  if (!controller.mapController.isCompleted) {
                    controller.mapController.complete(gmc);
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}
