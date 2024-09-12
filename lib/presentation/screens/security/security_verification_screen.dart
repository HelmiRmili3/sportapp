import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sportapp/core/app_colors.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

class SecurityVerificationScreen extends StatelessWidget {
  const SecurityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.0.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.seGreen,
                    ),
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
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                )
              ],
            ),
            40.verticalSpace,
            Center(
              child: Text(
                "Enter the received code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: Pinput(
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (index) => SizedBox(width: 20.w),
                validator: (value) {
                  if (value == null) {
                    return 'Opt';
                  }

                  return null;
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: ${value.length}');
                },
              ),
            ),
            30.verticalSpace,
            AuthButton(
              text: "Verify",
              fontcolor: Colors.white,
              backgroundcolor: AppColors.seGreen,
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouteConstants.paymentMethodScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
