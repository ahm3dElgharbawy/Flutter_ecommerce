import 'package:ecommerce/controller/orders/order_details_controller.dart';
import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/shared/public_appbar.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/orders/order_address.dart';
import '../../widget/orders/order_details_table.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: const PublicAppBar(title: Text("Order Details")),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) => ViewDataHandler(
          requestStatus: controller.status,
          widget: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(children: [
              const OrderDetailsTable(),
              const Divider(),
              if (controller.status == RequestStatus.success)
                Text("Total Price :  \$${controller.details[0].finalPrice!}"),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              if (controller.orderType == "0")
                Column(children:  [
                  const OrderDetailsAddress(),
                  RoundedButton(onPressed: (){
                    controller.toTrackingPage(controller.details[0]);
                  }, title: "Track",padding: const EdgeInsets.symmetric(vertical: 10),)
                ])
            ]),
          ),
        ),
      ),
    );
  }
}
