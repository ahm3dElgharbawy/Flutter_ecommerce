import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onIconPressed;
  const CustomTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.icon,
      required this.controller,
      this.validator,
      this.errorMessage,
      this.onChanged,
      this.keyboardType,
      this.obscureText,
      this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText == null ? false : obscureText!,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorText: errorMessage,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 13),
          labelStyle: const TextStyle(fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(label),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          suffixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                InkWell(onTap: onIconPressed, child: icon),
          ),
        ),
        onChanged: onChanged,
        validator: validator);
  }
}
