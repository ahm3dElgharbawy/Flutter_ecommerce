import 'package:ecommerce/controller/orders/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsTable extends GetView<OrderDetailsController> {
  const OrderDetailsTable({super.key});
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(children: [
          Text("Product",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          Text("Quantity",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          Text("Price",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ]),
        ...List.generate(
          controller.details.length,
          (index) => TableRow(children: [
            Text(controller.details[index].productName!,
                textAlign: TextAlign.center),
            Text(controller.details[index].quantity!,
                textAlign: TextAlign.center),
            Text("\$${controller.details[index].price}",
                textAlign: TextAlign.center),
          ]),
        ),
      ], /// ok 
    );
  }
}