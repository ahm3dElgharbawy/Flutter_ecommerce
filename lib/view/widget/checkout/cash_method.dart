import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/delivery_types.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:ecommerce/view/widget/checkout/delivery_type_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashMethod extends GetView<CheckoutController> {
  const CashMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder:(controller)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text("Choose delivery type")),
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.setDeliveryType(DeliveryTypes.delivery);
                },
                child: DeliveryTypeCard(
                  icon: Icons.delivery_dining_rounded,
                  active: controller.deliveryType == DeliveryTypes.delivery
                      ? true
                      : false
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  controller.setDeliveryType(DeliveryTypes.driveThru);
                },
                child: DeliveryTypeCard(
                  icon: Icons.drive_eta_rounded,
                  active: controller.deliveryType == DeliveryTypes.driveThru
                      ? true
                      : false,
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text("Shipping address")),
          ViewDataHandler(
            requestStatus: controller.status,
            widget: Column(
              children: List.generate(
                controller.models.length,
                (i) => ShippingCard(model: controller.models[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShippingCard extends GetView<CheckoutController> {
  final AddressModel model;
  const ShippingCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap:(){
          controller.setSelectedAddress(model.addressId!);
        },
        tileColor: controller.addressId == model.addressId? AppColor.primary:AppColor.white,
        title: Text(model.city!),
        subtitle: Text(model.street!),
      ),
    );
  }
}
