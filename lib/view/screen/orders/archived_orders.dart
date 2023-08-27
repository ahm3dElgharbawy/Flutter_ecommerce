import 'package:ecommerce/controller/orders/archived_orders_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/view/screen/orders/order_rating_dialog.dart';
import 'package:ecommerce/view/widget/orders/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArchivedOrdersController>(
      builder: (controller) => ViewDataHandler(
        requestStatus: controller.status,
        widget: ListView.builder(
          itemCount: controller.archivedOrders.length,
          itemBuilder: (context, i) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  OrderCard(
                    controller: controller,
                    model: controller.archivedOrders[i],
                    ratingOnPressed: () {
                        showRatingDialog(
                          context,
                          controller.archivedOrders[i].orderId!
                        );
                      }
                  ),
                  
                ],
              )),
        ),
      ),
    );
  }
}
