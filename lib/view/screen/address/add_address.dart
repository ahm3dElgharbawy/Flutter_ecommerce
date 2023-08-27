import 'package:ecommerce/controller/address/add_address_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/shared/public_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: const PublicAppBar(title: Text("Select Your Location")),
      body: GetBuilder<AddAddressController>(
        builder: (addAddressController) => ViewDataHandler(
          requestStatus: addAddressController.status,
          widget: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                onTap: (latLang) {
                  addAddressController.addMarker(latLang);
                },
                markers: addAddressController.markers.toSet(),
                mapType: MapType.normal,
                initialCameraPosition: addAddressController.currentPosition,
                onMapCreated: (GoogleMapController controller) {
                  if (!addAddressController.mapController.isCompleted) {
                    addAddressController.mapController.complete(controller);
                  }
                },
              ),
              Positioned(
                bottom: 10,
                child: FloatingActionButton(onPressed: () {
                  addAddressController.toAddressDetails();
                },
                child: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
