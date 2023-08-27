import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/functions/get_image_url.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/products_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/color.dart';

class CartItem extends GetView<CartController> {
  final CartModel cartModel;
  const CartItem({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: Container(
            decoration: BoxDecoration(
              color: AppColor.red3,
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: (){},
              child: const Icon(Icons.delete_outline, color: AppColor.red2),
            )),
        extentRatio: 0.2,
        children: const [],
      ),
      child: MaterialButton(
        onPressed: () {
          controller.goToProductDetails(ProductsModel.fromJson(cartModel.toJson()));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.background2,
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CachedNetworkImage(
                    imageUrl: getImageUrl("products", cartModel.productImage!),
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartModel.productName!,overflow: TextOverflow.ellipsis,),
                    Row(
                      children: [
                        Text(
                          "\$${cartModel.totalPrice}",
                          style: const TextStyle(
                              color: AppColor.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" x${cartModel.quantity}")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
