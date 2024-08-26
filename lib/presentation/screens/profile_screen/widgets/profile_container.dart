import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/core/app_colors.dart';

class ProfileContainer extends StatelessWidget {
  String title;
  IconData icon;
  void Function()? ontap;
  Color? color;

  ProfileContainer({
    super.key,
    this.color,
    required this.ontap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50.h,
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: color ?? AppColors.seGreen,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color ?? Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContainerUpdated extends StatelessWidget {
  String title;
  String icon;
  void Function()? ontap;
  Color? color;

  ProfileContainerUpdated(
      {super.key,
      this.color,
      required this.ontap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50.h,
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                icon,
                height: 24.h,
                width: 24.w,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color ?? Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
