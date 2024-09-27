import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart'; // Ensure you have this import if you use ScreenUtil

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String icon;
  final String obscureIcon;
  final bool obscureText;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.obscureIcon,
    required this.obscureText,
    required this.readOnly,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;

  void toggleObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.readOnly
        ? Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6)
        : Theme.of(context).textTheme.bodySmall?.color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: widget.controller,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
          readOnly: widget.readOnly,
          obscureText: obscure,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: toggleObscure,
              child: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                size: 24.h,
                color: widget.readOnly
                    ? Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withOpacity(.6)
                    : Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.color
                  ?.withOpacity(0.6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.readOnly
                    ? AppColors.black.withOpacity(0.1)
                    : const Color(0xFFC4C4C4),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.readOnly
                    ? AppColors.black.withOpacity(0.1)
                    : const Color(0xFFC4C4C4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.readOnly
                    ? AppColors.black.withOpacity(0.1)
                    : const Color(0xFFC4C4C4),
              ),
            ),
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
}
