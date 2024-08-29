import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:sportapp/presentation/controllers/security_controller.dart';

import '../../../core/app_colors.dart';
import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SecurityController controller = Get.put(SecurityController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.0.h, right: 24.w, left: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.seGreen),
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
                      'Validation',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  )
                ],
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "Enter your phone number foraccount security, authentication andpersonalization of news.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
              ),
              30.verticalSpace,
              Row(
                children: [
                  SizedBox(
                    height: 10,
                    child: Radio<String>(
                      value: 'whatsApp',
                      fillColor: WidgetStateProperty.all(AppColors.seGreen),
                      activeColor: AppColors.seGreen,
                      groupValue: controller.verificationMethod,
                      onChanged: (String? value) {
                        controller.changeVerificationMethod(value!);
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    'WhatsApp',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.h),
                  ),
                ],
              ),
              15.verticalSpace,
              Row(
                children: [
                  SizedBox(
                    height: 10,
                    child: Radio<String>(
                      value: 'sms',
                      fillColor: WidgetStateProperty.all(AppColors.seGreen),
                      activeColor: AppColors.seGreen,
                      groupValue: controller.verificationMethod,
                      onChanged: (String? value) {
                        controller.changeVerificationMethod(value!);
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    'SMS',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.h),
                  ),
                ],
              ),
              40.verticalSpace,
              PhoneInput(
                key: const Key('phone-field'),
                controller: null,
                initialValue: null,
                shouldFormat: true,
                defaultCountry: IsoCode.RO,
                showArrow: false,
                flagShape: BoxShape.rectangle,
                flagSize: 30,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black)),
                  enabled: true,
                ),
                countrySelectorNavigator:
                    const CountrySelectorNavigator.bottomSheet(),
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "You will receive a verification code via WhatsApp or SMS",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
              ),
              40.verticalSpace,
              AuthButton(
                  text: "Send Code",
                  fontcolor: AppColors.white,
                  backgroundcolor: AppColors.seGreen,
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouteConstants.securityVerification);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
