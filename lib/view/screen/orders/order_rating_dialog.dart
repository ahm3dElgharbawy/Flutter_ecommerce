import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/archived_orders_controller.dart';

showRatingDialog(BuildContext context,String orderId) {
  RatingDialog dialog = RatingDialog(
    initialRating: 1.0,
    starSize: 35,
    title: const Text(
      'Rate your order',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    image: Image.asset("assets/images/rate.png",height: 120,),
    submitButtonText: 'Submit',
    commentHint: 'comment',
    onCancelled: () {},
    onSubmitted: (response) {
      ArchivedOrdersController controller = Get.find();
      controller.addOrderRating(orderId, response.rating.toString(),response.comment);
    },
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
  );
}
