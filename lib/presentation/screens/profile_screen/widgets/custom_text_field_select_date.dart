import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart'; // Ensure you have this import if you use ScreenUtil

class CustomTextFieldSelectDate extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String icon;
  final bool readOnly;

  const CustomTextFieldSelectDate({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.readOnly,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldSelectDateState createState() =>
      _CustomTextFieldSelectDateState();
}

class _CustomTextFieldSelectDateState extends State<CustomTextFieldSelectDate> {
  void pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      widget.controller.text = selectedDate.toLocal().toString().split(' ')[0];
    }
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
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: widget.readOnly ? null : pickDate,
              child: Icon(
                Icons.date_range,
                size: 24.h,
                color: widget.readOnly
                    ? Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withOpacity(0.6)
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
