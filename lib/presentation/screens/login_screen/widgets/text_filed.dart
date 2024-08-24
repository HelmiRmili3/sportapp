import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

// ignore: must_be_immutable
class AuthTextField extends StatelessWidget {
  String? hintText;
  bool obsecure;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  void Function()? ontap;
  TextEditingController? controller;
  AuthTextField({
    super.key,
    required this.controller,
    this.ontap,
    required this.onChanged,
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
      onChanged: onChanged,
      onTap: ontap,
      controller: controller,
      decoration: InputDecoration(
          // fillColor: Theme.of(context).primaryColor,
          // filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            // fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.seGreen), // Change line color when focused
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context)
                    .highlightColor), // Change line color when not focused
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.red), // Change line color on error
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red), // Change line color when focused with error
          ),
          contentPadding: const EdgeInsets.only(bottom: 10),
          suffixIcon: suffixIcon),
      cursorColor: AppColors.seGreen,
      obscureText: obsecure,
    );
  }
}
