import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/data/model/orders/orders_model.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final dynamic controller;
  final OrdersModel model;
  final void Function()? ratingOnPressed;
  const OrderCard(
      {super.key,
      required this.controller,
      required this.model,
      this.ratingOnPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toOrderDetails(model.orderId, model.orderType);
      },
      child: Container(
        height: 120,
        color: AppColor.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order #${model.orderId!}"),
              controller.getOrderStatus(model.orderStatus!),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("\$${model.orderPrice!}"),
              Text(model.orderDatetime!),
              if (model.rating == "0" && ratingOnPressed != null)
                RoundedButton(
                  radius: 20,
                  padding: const EdgeInsets.all(0),
                  onPressed: ratingOnPressed,
                  title: "Rate",
                )
            ],
          ),
        ]),
      ),
    );
  }
}
