import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';

import '../login_screen/widgets/button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _profileImageSection(context),
          2.verticalSpace,
          Text(
            "Change Picture",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _customTextField(
                      hintText: "username",
                      labelText: "Username",
                    ),
                    _customTextField(
                        hintText: "yaounchi@gmail.com",
                        labelText: "Email I'D",
                        readOnly: true),
                    _customTextField(
                      hintText: "+143423453532",
                      labelText: "Phone Number",
                      readOnly: true,
                    ),
                    _customTextField(
                        hintText: "JJ/MM/AA",
                        labelText: "Date de Nnaissance",
                        icon: "assets/Images/calender_icon.png"),
                    _customTextField(
                        hintText: "*************",
                        labelText: "Password",
                        icon: "assets/Images/open_eye_icon.png",
                        obscureText: true),
                    _customTextField(
                        hintText: "*************",
                        labelText: "Confime Password",
                        icon: "assets/Images/open_eye_icon.png",
                        obscureText: true),
                    15.verticalSpace,
                    AuthButton(
                        text: "Update",
                        fontcolor: AppColors.black,
                        backgroundcolor: AppColors.seGreen,
                        onTap: () {}),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _customTextField(
      {String? hintText,
      String? labelText,
      String? icon,
      bool? obscureText,
      bool? readOnly}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? "",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: readOnly ?? false ? AppColors.black.withOpacity(0.1) : null,
          ),
        ),
        5.verticalSpace,
        TextFormField(
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: icon?.isEmpty ?? true
                ? null
                : UnconstrainedBox(
                    child: Image.asset(icon!,
                        height: 24.h, width: 24.w, color: Colors.black),
                  ),
            hintText: hintText ?? "",
            hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: readOnly ?? false
                    ? AppColors.black.withOpacity(0.1)
                    : AppColors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: readOnly ?? false
                      ? AppColors.black.withOpacity(0.1)
                      : const Color(0xFFC4C4C4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: readOnly ?? false
                      ? AppColors.black.withOpacity(0.1)
                      : const Color(0xFFC4C4C4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: readOnly ?? false
                      ? AppColors.black.withOpacity(0.1)
                      : const Color(0xFFC4C4C4)),
            ),
          ),
        ),
        14.verticalSpace,
      ],
    );
  }

  SizedBox _profileImageSection(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              color: AppColors.seGreen,
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      // margin: EdgeInsets.all(10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white),
                      child: const Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: 'ClashDisplay',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 140.w,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 4.w),
                        shape: BoxShape.circle,
                      ),
                      // padding: EdgeInsets.all(MySize.size8),
                      child: SizedBox(
                        width: AppSizes.size140,
                        height: AppSizes.size140,
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppSizes.size100),
                            child: const Image(
                                image: NetworkImage(
                                    "https://picsum.photos/250?image=9"))),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 1,
                      child: Container(
                          height: 46.h,
                          width: 46.w,
                          decoration: BoxDecoration(
                            color: AppColors.seGreen,
                            border:
                                Border.all(color: AppColors.white, width: 4.w),
                            shape: BoxShape.circle,
                          ),
                          // padding: EdgeInsets.all(MySize.size8),
                          child: Center(
                            child: UnconstrainedBox(
                              child: Image.asset(
                                'assets/Images/edit_icon.png',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
