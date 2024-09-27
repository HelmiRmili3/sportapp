import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart'; // Ensure you have this import if you use ScreenUtil

class CustomTextFieldWithoutIcon extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool readOnly;

  const CustomTextFieldWithoutIcon({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    required this.readOnly,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextFieldWithoutIcon> {
  @override
  Widget build(BuildContext context) {
    final textColor = widget.readOnly
        ? Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6)
        : Theme.of(context).textTheme.bodySmall?.color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? "",
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
          decoration: InputDecoration(
            hintText: widget.hintText ?? "",
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
