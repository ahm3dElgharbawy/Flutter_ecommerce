import 'package:ecommerce/controller/orders/archived_orders_controller.dart';
import 'package:ecommerce/controller/orders/orders_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/shared/public_snackbar.dart';
import 'package:ecommerce/view/screen/orders/archived_orders.dart';
import 'package:ecommerce/view/widget/orders/slidable_card.dart';
import 'package:ecommerce/view/widget/orders/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    Get.put(ArchivedOrdersController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Orders"),
            bottom: TabBar(
              tabs: [
                Container(padding: const EdgeInsets.all(10),child:const Text("pending orders")),
                Container(padding: const EdgeInsets.all(10),child:const Text("archived orders")),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PendingOrdersPage(),
              ArchivedOrders(),
            ],
          )),
    );
  }
}

class PendingOrdersPage extends StatelessWidget {
  const PendingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      builder: (controller) => ViewDataHandler(
        requestStatus: controller.status,
        widget: ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context, i) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: SlidableCard(
              onPressedActionPane: () {
                (controller.orders[i].orderStatus == "1" ||
                        controller.orders[i].orderStatus == "2")
                    ? getPublicSnackbar("warning", "Can't remove this order")
                    : controller.removeOrder(controller.orders[i].orderId);
              },
              child: OrderCard(
                controller: controller,
                model: controller.orders[i],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

