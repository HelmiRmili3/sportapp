import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/core/app_colors.dart';

import '../login_screen/widgets/button.dart';
import 'widgets/custom_text_field_select_date.dart';
import 'widgets/custom_text_filed.dart';
import 'widgets/custom_text_filed_without_icon.dart';
import 'widgets/profile_image_section.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController dateController =
      TextEditingController(text: "12/7/2000");

  TextEditingController nameController = TextEditingController(text: "Ahmed");
  TextEditingController passwordController =
      TextEditingController(text: "Ahmed123");
  TextEditingController passwordConfirmationController =
      TextEditingController(text: "Ahmed123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileImageSection(
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          2.verticalSpace,
          Text(
            "Change Picture",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldWithoutIcon(
                      controller: nameController,
                      hintText: "username",
                      labelText: "Username",
                      readOnly: false,
                    ),
                    const CustomTextFieldWithoutIcon(
                      hintText: "yaounchi@gmail.com",
                      labelText: "Email I'D",
                      readOnly: true,
                    ),
                    const CustomTextFieldWithoutIcon(
                      hintText: "+143423453532",
                      labelText: "Phone Number",
                      readOnly: true,
                    ),
                    CustomTextFieldSelectDate(
                      controller: dateController,
                      hintText: "JJ/MM/AA",
                      labelText: "Date de Naissance",
                      icon: "assets/Images/calender_icon.png",
                      readOnly: false,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "password",
                      labelText: "Password",
                      icon: "assets/Images/open_eye_icon.png",
                      obscureIcon: "assets/Images/open_eye_icon.png",
                      obscureText: false,
                      readOnly: false,
                    ),
                    CustomTextField(
                      controller: passwordConfirmationController,
                      hintText: "password",
                      labelText: "Confime Password",
                      icon: "assets/Images/open_eye_icon.png",
                      obscureIcon: "assets/Images/open_eye_icon.png",
                      obscureText: false,
                      readOnly: false,
                    ),
                    15.verticalSpace,
                    AuthButton(
                      text: "Update",
                      fontcolor: AppColors.black,
                      backgroundcolor: AppColors.seGreen,
                      onTap: () {},
                    ),
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
}
