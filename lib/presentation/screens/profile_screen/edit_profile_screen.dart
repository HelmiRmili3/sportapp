import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';

import '../login_screen/widgets/button.dart';
import 'widgets/custom_text_field_select_date.dart';
import 'widgets/custom_text_filed.dart';
import 'widgets/custom_text_filed_without_icon.dart';

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
          _profileImageSection(context),
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

  // Column _customTextField({
  //   TextEditingController? controller,
  //   final Function()? onTap,
  //   String? hintText,
  //   String? labelText,
  //   String? icon,
  //   String? obscureIcon,
  //   bool? obscureText,
  //   required BuildContext context,
  //   bool? readOnly,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         labelText ?? "",
  //         style: TextStyle(
  //           fontSize: 14.sp,
  //           fontWeight: FontWeight.w500,
  //           color: readOnly ?? false
  //               ? Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.6)
  //               : Theme.of(context).textTheme.bodySmall!.color,
  //         ),
  //       ),
  //       5.verticalSpace,
  //       TextFormField(
  //         controller: controller,
  //         style: TextStyle(
  //           fontSize: 14.sp,
  //           fontWeight: FontWeight.w400,
  //           color: readOnly ?? false
  //               ? Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.6)
  //               : Theme.of(context).textTheme.bodySmall!.color,
  //         ),
  //         readOnly: readOnly ?? false,
  //         obscureText: obscureText ?? false,
  //         decoration: InputDecoration(
  //           suffixIcon: GestureDetector(
  //             onTap: onTap,
  //             child: icon?.isEmpty ?? true
  //                 ? null
  //                 : UnconstrainedBox(
  //                     child: Image.asset(
  //                       obscure ? obscureIcon! : icon!,
  //                       height: 24.h,
  //                       width: 24.w,
  //                       color: readOnly ?? false
  //                           ? Theme.of(context)
  //                               .textTheme
  //                               .bodySmall!
  //                               .color!
  //                               .withOpacity(.6)
  //                           : Theme.of(context).textTheme.bodySmall!.color,
  //                     ),
  //                   ),
  //           ),
  //           hintText: hintText ?? "",
  //           hintStyle: TextStyle(
  //               fontSize: 14.sp,
  //               fontWeight: FontWeight.w400,
  //               color: readOnly ?? false
  //                   ? Theme.of(context)
  //                       .textTheme
  //                       .bodySmall!
  //                       .color!
  //                       .withOpacity(.6)
  //                   : Theme.of(context).textTheme.bodySmall!.color!),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(
  //                 color: readOnly ?? false
  //                     ? AppColors.black.withOpacity(0.1)
  //                     : const Color(0xFFC4C4C4)),
  //           ),
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(
  //                 color: readOnly ?? false
  //                     ? AppColors.black.withOpacity(0.1)
  //                     : const Color(0xFFC4C4C4)),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(
  //                 color: readOnly ?? false
  //                     ? AppColors.black.withOpacity(0.1)
  //                     : const Color(0xFFC4C4C4)),
  //           ),
  //         ),
  //       ),
  //       14.verticalSpace,
  //     ],
  //   );
  // }

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
