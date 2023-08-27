import 'package:ecommerce/controller/address/address_details_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/functions/validate_input.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/core/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(title: const Text("Filling Address Details"),centerTitle: true,),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<AddressDetailsController>(
          builder:(controller)=> ViewDataHandler(
            requestStatus: controller.status,
            widget: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 40,),
                  CustomTextField(
                      label: "address",
                      hint: "address name",
                      validator: (val) => validateInput(controller.addressNameController.text,0,100,"text"),
                      icon: const Icon(Icons.location_history),
                      controller: controller.addressNameController),
                  const SizedBox(height: 20),
                  CustomTextField(
                      label: "city",
                      hint: "city name",
                      validator: (val) => validateInput(controller.cityNameController.text,0,100,"text"),
                      icon: const Icon(Icons.location_city_rounded),
                      controller: controller.cityNameController),
                  const SizedBox(height: 20),
                  CustomTextField(
                      label: "street",
                      hint: "street name",
                      validator: (val) => validateInput(controller.streetNameController.text,0,100,"text"),
                      icon: const Icon(Icons.route_outlined),
                      controller: controller.streetNameController),
                  const SizedBox(height: 20),
                  RoundedButton(onPressed: (){
                    controller.insertData();
                  },title: "Submit",padding: const EdgeInsets.symmetric(vertical: 10))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
