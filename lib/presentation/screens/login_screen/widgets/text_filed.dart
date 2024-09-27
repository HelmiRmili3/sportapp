import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

// ignore: must_be_immutable
class AuthTextField extends StatelessWidget {
  String? hintText;
  bool obsecure;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  void Function()? ontap;
  TextEditingController? controller;
  AuthTextField({
    super.key,
    required this.controller,
    this.ontap,
    required this.hintText,
    required this.validator,
    required this.obsecure,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
      validator: validator,
      onTap: ontap,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.seGreen),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).highlightColor),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.only(bottom: 10),
          suffixIcon: suffixIcon),
      cursorColor: AppColors.seGreen,
      obscureText: obsecure,
    );
  }
}
