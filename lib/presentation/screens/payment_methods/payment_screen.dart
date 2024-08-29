import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/presentation/controllers/payment_controller.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 40.0.h, right: 24.w, left: 24.w),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
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
                    padding: EdgeInsets.only(top: 6.0, left: 10.w),
                    child: Text(
                      'Keep going',
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
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      Image.asset(
                        "assets/Images/box_icon.png",
                        height: 32.h,
                        width: 32.w,
                      ),
                    ],
                  ),
                  Container(
                    width: 80.w,
                    height: 1.h,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/Images/card_icon.png",
                        height: 32.h,
                        width: 32.w,
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                    ],
                  )
                ],
              ),
              20.verticalSpace,
              Center(
                child: SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.packages.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.selectPackage(index);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            child: controller.packages[index].savePercent == ''
                                ? SizedBox(
                                    height: 20.h,
                                  )
                                : CustomPaint(
                                    size: Size(
                                        105.w, (105.w * 0.2073170731707317)),
                                    painter: RPSCustomPainter(),
                                    child: SizedBox(
                                      width: 95.w,
                                      height: 20.sp,
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            controller.packages[index]
                                                    .savePercent ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          Container(
                            width: 105.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                border: controller.packages[index].isSelected ??
                                        false
                                    ? Border.all(color: Colors.black)
                                    : null),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.packages[index].name ?? "",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: controller.packages[index]
                                                    .isSelected ??
                                                false
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Icon(
                                      controller.packages[index].isSelected ??
                                              false
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_off,
                                      color: controller
                                                  .packages[index].isSelected ??
                                              false
                                          ? AppColors.seGreen
                                          : Colors.grey,
                                      size: 15.sp,
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            controller.packages[index].price ??
                                                "",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: controller.packages[index]
                                                        .isSelected ??
                                                    false
                                                ? Colors.black
                                                : Colors.grey,
                                            height: 1.sp)),
                                    TextSpan(
                                        text: "TND",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w600,
                                            color: controller.packages[index]
                                                        .isSelected ??
                                                    false
                                                ? Colors.black
                                                : Colors.grey,
                                            height: 1.sp)),
                                    TextSpan(
                                        text: "/month",
                                        style: TextStyle(
                                            fontSize: 7.sp,
                                            fontWeight: FontWeight.w500,
                                            color: controller.packages[index]
                                                        .isSelected ??
                                                    false
                                                ? Colors.black
                                                : Colors.grey,
                                            height: 1.sp)),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => 12.horizontalSpace,
                  ),
                ),
              ),
              20.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "0",
                            style: TextStyle(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "TND",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "You have 2 free entries valid for 7 days, then 30 TND / month",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffBDB4B4)),
                      ),
                    ),
                    20.verticalSpace,
                    _textWedgits("Daily access for 30 days to 522 room"),
                    _textWedgits("10 day warranty"),
                    _textWedgits("interrupt anytime"),
                    10.verticalSpace,
                    AuthButton(
                        text: "Do you really want",
                        fontcolor: Colors.white,
                        backgroundcolor: const Color(0xFFFF6B62),
                        onTap: () {
                          context.push(AppRouteConstants.securityScreenmob);
                        }),
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.changeButtonState(true);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r)),
                          border: Border.all(
                            color: controller.isleftButtonActive
                                ? AppColors.seGreen
                                : const Color(0xFFDEDEDE),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Unilimited",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: controller.isleftButtonActive
                                  ? AppColors.seGreen
                                  : const Color(0xFFDEDEDE),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      controller.changeButtonState(false);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.r),
                            topRight: Radius.circular(20.r)),
                        border: Border.all(
                          color: controller.isleftButtonActive
                              ? const Color(0xFFDEDEDE)
                              : AppColors.seGreen,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "8 entriers",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: controller.isleftButtonActive
                                ? const Color(0xFFDEDEDE)
                                : AppColors.seGreen,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              20.verticalSpace,
              Text("Upgrade ?",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              10.verticalSpace,
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Radio<String>(
                      value: 'Upgrade unlimited access',
                      fillColor: WidgetStateProperty.all(AppColors.seGreen),
                      activeColor: AppColors.seGreen,
                      groupValue: controller.verificationMethod,
                      onChanged: (String? value) {
                        controller.changeVerificationMethod(value!);
                      },
                    ),
                  ),
                  5.horizontalSpace,
                  Text(
                    'Upgrade unlimited access',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.h),
                  ),
                ],
              ),
              5.verticalSpace,
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Radio<String>(
                      value: 'Upgrade more +50 sports center',
                      fillColor: WidgetStateProperty.all(AppColors.seGreen),
                      activeColor: AppColors.seGreen,
                      groupValue: controller.verificationMethod,
                      onChanged: (String? value) {
                        controller.changeVerificationMethod(value!);
                      },
                    ),
                  ),
                  5.horizontalSpace,
                  Text(
                    'Upgrade more +50 sports center',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.h),
                  ),
                ],
              ),
              20.verticalSpace,
              Text("Avantage",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              20.verticalSpace,
              _textWedgits("Tout en 1 "),
              _textWedgits(
                  "Vous ne paierez qu'après les 7 jours ou 2 entrées "),
              _textWedgits(
                  "L'abonnement améliore votre santé (mentale ,physique et Esprit )"),
              _textWedgits("Vous pouvez annuler à tout moment "),
            ]),
          )),
    );
  }

  Column _textWedgits(String text) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle, color: AppColors.seGreen),
            10.horizontalSpace,
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        20.verticalSpace,
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.07601622, 0);
    path_0.cubicTo(size.width * 0.03403366, 0, 0, size.height * 0.1641624, 0,
        size.height * 0.3666665);
    path_0.cubicTo(
        0,
        size.height * 0.5691712,
        size.width * 0.03403354,
        size.height * 0.7333353,
        size.width * 0.07601622,
        size.height * 0.7333353);
    path_0.lineTo(size.width * 0.8388134, size.height * 0.7333353);
    path_0.lineTo(size.width * 0.8707317, size.height);
    path_0.lineTo(size.width * 0.9026500, size.height * 0.7333353);
    path_0.lineTo(size.width * 0.9191061, size.height * 0.7333353);
    path_0.cubicTo(
        size.width * 0.9610878,
        size.height * 0.7333353,
        size.width * 0.9951220,
        size.height * 0.5691712,
        size.width * 0.9951220,
        size.height * 0.3666665);
    path_0.cubicTo(size.width * 0.9951220, size.height * 0.1641624,
        size.width * 0.9610878, 0, size.width * 0.9191061, 0);
    path_0.lineTo(size.width * 0.07601622, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff98D52F).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
