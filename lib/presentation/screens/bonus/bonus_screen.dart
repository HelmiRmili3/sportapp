import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/presentation/controllers/bonus_controller.dart';

import '../login_screen/widgets/button.dart';

class BonusScreen extends StatelessWidget {
  const BonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BonusController bonusController = Get.put(BonusController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _gistUpperSection(context),
            50.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Share Your Invite Code',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  30.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        "Y045KG",
                        style: TextStyle(
                            height: 1.h,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          await Clipboard.setData(
                                  const ClipboardData(text: "Y045KG"))
                              .then((value) {
                            Fluttertoast.showToast(msg: "Copied to clipboard");
                          });
                        },
                        child: Image.asset(
                          "assets/Images/share_icon.png",
                          height: 35.h,
                          width: 35.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.black,
                    thickness: 1,
                  ),
                  90.verticalSpace,
                  AuthButton(
                      text: "Invite Friends",
                      fontcolor: AppColors.black,
                      backgroundcolor: AppColors.seGreen,
                      onTap: () {
                        bonusController.inviteFriend();
                      }),
                  30.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _gistUpperSection(BuildContext context) {
    return Container(
      height: 0.525.sh,
      width: 1.sw,
      color: AppColors.seGreen,
      child: Stack(
        children: [
          Container(
            height: 0.41.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/bonus_background_image.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
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
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
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
                        'Invite Friends',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          fontFamily: 'ClashDisplay',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    )
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Images/gift_box.png",
                        height: 0.30.sh,
                        width: 0.7.sw,
                      ),
                      Text(
                        "Get up to 20% off",
                        style: TextStyle(
                            height: 1.h,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      5.verticalSpace,
                      Text(
                        "Invite a friend and get 10% off for your next month's subscription. Refer 5 or more friends and enjoy a 20% discount!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5.h,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
