import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/payment_methods.dart';
import 'package:ecommerce/core/shared/public_appbar.dart';
import 'package:ecommerce/core/shared/public_bottom_navbar.dart';
import 'package:ecommerce/view/widget/checkout/cash_method.dart';
import 'package:ecommerce/view/widget/checkout/credit_card_method.dart';
import 'package:ecommerce/view/widget/checkout/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: const PublicAppBar(
        title: Text("Checkout"),
      ),
      bottomNavigationBar: PublicBottomNavBar(
        onPressed: () {
          controller.checkout();
        },
        title: "Checkout",
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("payment method")),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        controller.setPaymentMethod(PaymentMethods.cash);
                      },
                      child: PaymentMethodCard(
                          imagePath: "assets/images/cash.png",
                          active: controller.paymentMethod == PaymentMethods.cash
                              ? true
                              : false)),
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () {
                        controller.setPaymentMethod(PaymentMethods.creditCard);
                      },
                      child: PaymentMethodCard(
                          imagePath: "assets/images/credit.png",
                          active: controller.paymentMethod == PaymentMethods.creditCard
                              ? true
                              : false)),
                ],
              ),
              controller.paymentMethod == PaymentMethods.creditCard? const CreditCardMethod(): const CashMethod()
            ],
          ),
        ),
      ),
    );
  }
}

