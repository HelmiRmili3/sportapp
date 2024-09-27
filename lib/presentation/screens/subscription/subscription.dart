import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_sizes.dart';

import '../../../core/app_colors.dart';
import '../../../core/routes/route_names.dart';
import '../../../data/models/substription_model.dart';
import '../../../generated/l10n.dart';
import '../login_screen/widgets/button.dart';

class SubscriptionPackagesScreen extends StatefulWidget {
  const SubscriptionPackagesScreen({super.key});

  @override
  State<SubscriptionPackagesScreen> createState() =>
      _SubscriptionPackagesScreenState();
}

class _SubscriptionPackagesScreenState
    extends State<SubscriptionPackagesScreen> {
  bool isChecked = false;
  var textValue = 'Switch is OFF';

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    List<SubstriptionPackage> packages = [
      SubstriptionPackage(
        topText: "Our most popular subscription",
        name: S.of(context).premium,
        price: "160",
        features: [
          (S.of(context).terminateAtAnyTime),
          (S.of(context).dailyAccessFor30DaysToToTunaisia),
          (S.of(context).tenDayWarranty),
          (S.of(context).terminateAtAnyTime)
        ],
        color: AppColors.seGreen,
      ),
      SubstriptionPackage(
          topText: "Our best-selling subscription",
          name: 'Basic',
          //  "${AppTranslations.of(context).our_most_popular_subscription}",
          price: "89",
          features: [
            (S.of(context).terminateAtAnyTime),
            (S.of(context).dailyAccessFor30DaysToToTunaisia),
            (S.of(context).tenDayWarranty),
            (S.of(context).terminateAtAnyTime)
          ],
          color: AppColors.yellow),
      SubstriptionPackage(
        topText: "Our most luxurious subscription",
        name: 'VIP',
        price: "220 ",
        features: [
          (S.of(context).terminateAtAnyTime),
          (S.of(context).dailyAccessFor30DaysToToTunaisia),
          (S.of(context).tenDayWarranty),
          (S.of(context).terminateAtAnyTime)
        ],
        color: const Color(0xFFB6B7BB),
      ),
    ];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/Images/subscription.png',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.w),
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColors.seGreen),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        size: 15.sp,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    S.of(context).subscription,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'ClashDisplay',
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 400.h,
              child: Swiper(
                viewportFraction: 0.75,
                scale: 0.9,
                itemCount: packages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.black.withOpacity(.8),
                    ),
                    child: Column(
                      children: [
                        5.verticalSpace,
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(0xFF4F403D), width: 1.w),
                          ),
                          child: Center(
                              child: Text(
                            "Our most popular subscription",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFCBCBCB),
                            ),
                          )),
                        ),
                        10.verticalSpace,
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: packages[index].color,
                          ),
                          child: Center(
                              child: Text(
                            packages[index].name ?? "",
                            style: TextStyle(
                              fontFamily: 'ClashDisplay',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: packages[index].price ?? "",
                                // "160 ",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              TextSpan(
                                text: " TND ",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text: S.of(context).itIsPaidMonthly,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ])),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color:
                                      const Color(0xFF52CB5E).withOpacity(0.1)),
                              child: Center(
                                  child: Text(
                                S.of(context).save200TNDPerYear,
                                // "save 200 TND per year",
                                style: TextStyle(
                                  fontFamily: 'ClashDisplay',
                                  fontSize: 6.sp,
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ],
                        ),
                        5.verticalSpace,
                        Wrap(
                          children: packages[index]
                              .features!
                              .map((e) => _featureWidget(context, e))
                              .toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: SizedBox(
                height: 40.h,
                child: Row(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/Images/gift_icon.png",
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  5.horizontalSpace,
                  Expanded(
                    child: Text(
                      S.of(context).giftDiscountNextMonth,
                      // "Gift discount when you invite friend your next month",
                      // S.of(context)
                      //     .gift_discount_when_you_invite_friend_your_next_month,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/Images/info_icon.png",
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ]),
              ),
            ),
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: AuthButton(
                  text: S.of(context).payNow,
                  fontcolor: AppColors.black,
                  backgroundcolor: AppColors.seGreen,
                  onTap: () {
                    context.push(AppRouteConstants.payment2);
                  }),
            ),
            40.verticalSpace
          ],
        ),
      ),
    );
  }

  Column _featureWidget(BuildContext context, String text) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              checkColor: Colors.black,
              fillColor: WidgetStateProperty.resolveWith(
                  (states) => AppColors.seGreen),
              value: true,
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
        5.verticalSpace,
      ],
    );
  }
}
