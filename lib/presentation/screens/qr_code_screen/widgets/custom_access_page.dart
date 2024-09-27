import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAccessPage extends StatelessWidget {
  Function onPressed;
  final String imagePath;
  final String name;
  final String status;
  final String date;
  final String time;
  final String details;
  final String id;
  final String label;
  final Color color;
  CustomAccessPage({
    required this.color,
    required this.onPressed,
    required this.imagePath,
    required this.name,
    required this.status,
    required this.date,
    required this.time,
    required this.details,
    required this.id,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Stack(children: [
                  Image.asset(imagePath),
                  Positioned(
                    width: 150.w,
                    height: 150.h,
                    bottom: 0.h,
                    right: 30.w,
                    child: Image.asset("assets/Images/image1.png"),
                  ),
                ]),
              ),
              SizedBox(height: 10.h),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    fontSize: 19.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  details,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
              ),
              SizedBox(height: 80.h),
              TextButton(
                onPressed: () => onPressed,
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "ID du jour au Rock Gym: $id",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  date,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
