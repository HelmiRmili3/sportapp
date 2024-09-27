import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';

BottomBarItem buildBottomBarItem({
  required IconData icon,
  required String label,
  required BuildContext context,
}) {
  return BottomBarItem(
    inActiveItem: Icon(
      icon,
      color: Colors.blueGrey,
    ),
    activeItem: Icon(
      icon,
      color: AppColors.white,
    ),
    itemLabelWidget: Text(
      label,
      style: TextStyle(
        color: Theme.of(context).indicatorColor,
        fontSize: 10.sp,
      ),
    ),
  );
}
