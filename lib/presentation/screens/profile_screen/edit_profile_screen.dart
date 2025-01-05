import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/core/app_colors.dart';

import '../../../core/dependency_injection/service_locator.dart';
import '../../../generated/l10n.dart';
import '../../controllers/user_controller.dart';
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
  @override
  void initState() {
    sl<UserController>().getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileImageSection(
            image: sl<UserController>().user?.profilePicture ?? '',
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          10.verticalSpace,
          Text(
            S.of(context).changePicture,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).textTheme.bodySmall!.color,
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
                      controller: sl<UserController>().nameController,
                      hintText: S.of(context).username,
                      labelText: S.of(context).username,
                      readOnly: false,
                    ),
                    CustomTextFieldWithoutIcon(
                      hintText: sl<UserController>().user?.email ?? "",
                      labelText: "Email I'D",
                      readOnly: true,
                    ),
                    CustomTextFieldWithoutIcon(
                      controller: sl<UserController>().phoneNumberController,
                      hintText: sl<UserController>()
                          .phoneNumberController
                          .text
                          .toString(),
                      labelText: S.of(context).phoneNumber,
                      readOnly: true,
                    ),
                    CustomTextFieldSelectDate(
                      controller: sl<UserController>().birthdayController,
                      hintText: "JJ/MM/AA",
                      labelText: S.of(context).dateOfBirth,
                      icon: "assets/Images/calender_icon.png",
                      readOnly: false,
                    ),
                    CustomTextField(
                      controller: sl<UserController>().passwordController,
                      hintText: S.of(context).password,
                      labelText: S.of(context).password,
                      icon: "assets/Images/open_eye_icon.png",
                      obscureIcon: "assets/Images/open_eye_icon.png",
                      obscureText: false,
                      readOnly: false,
                    ),
                    CustomTextField(
                      controller:
                          sl<UserController>().confirmPasswordController,
                      hintText: S.of(context).password,
                      labelText: S.of(context).confirmPassword,
                      icon: "assets/Images/open_eye_icon.png",
                      obscureIcon: "assets/Images/open_eye_icon.png",
                      obscureText: false,
                      readOnly: false,
                    ),
                    15.verticalSpace,
                    AuthButton(
                      text: S.of(context).update,
                      fontcolor: AppColors.black,
                      backgroundcolor: AppColors.seGreen,
                      onTap: () => sl<UserController>().updateUser(),
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
