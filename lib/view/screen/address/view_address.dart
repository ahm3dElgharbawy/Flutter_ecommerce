import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/shared/public_appbar.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      appBar: const PublicAppBar(title: Text("Address")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) => ViewDataHandler(
          requestStatus: controller.status,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: controller.models.length,
              itemBuilder: (context, i) => AddressCard(
                model: controller.models[i],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressCard extends GetView<ViewAddressController> {
  final AddressModel model;
  const AddressCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(model.city!),
        subtitle: Text(model.street!),
        trailing: IconButton(
          onPressed: () {
            controller.removeData(model.addressId!);
          },
          icon: const Icon(Icons.delete_outline_outlined),
          iconSize: 26,
          color: AppColor.red,
        ),
      ),
    );
  }
}
