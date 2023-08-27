import 'package:ecommerce/controller/auth/signup/verifycode_signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class CustomAuthOtp extends StatelessWidget {
  final void Function(String)? onSubmit;
  const CustomAuthOtp({super.key, required this.onSubmit});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpController());
    return Container(
      padding: const EdgeInsets.all(20),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: OtpTextField(
          autoFocus: true,
          numberOfFields: 5,
          showFieldAsBox: false,
          // onCodeChanged: (String code) {},
          //runs when every textfield is filled
          onSubmit: onSubmit
        ),
      ),
    );
  }
}
