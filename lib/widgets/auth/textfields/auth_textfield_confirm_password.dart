import 'package:flutter/material.dart';
import 'package:group_app_project/styles/app_colors.dart';

class AuthTextFieldConfirmPassword extends StatelessWidget {
  final TextEditingController controller;
  final String textFieldHintText;
  final String? Function(String?)? validationMethod;

  const AuthTextFieldConfirmPassword({
    super.key,
    required this.controller,
    required this.textFieldHintText,
    required this.validationMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondryColor,
          hintText: textFieldHintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.primaryFilledColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
        validator: validationMethod,
        autovalidateMode: AutovalidateMode.onUnfocus,
      ),
    );
  }
}
