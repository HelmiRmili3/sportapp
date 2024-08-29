import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../profile_screen/widgets/profile_container.dart';

class YourSubscription extends StatefulWidget {
  const YourSubscription({super.key});

  @override
  State<YourSubscription> createState() => _YourSubscriptionState();
}

class _YourSubscriptionState extends State<YourSubscription> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      bottomNavigationBar: Container(
        height: 150,
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Center(
                child: Text(
                  S.of(context).tryItFor7Day,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.seGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Theme.of(context).primaryColor),
                      child: Icon(
                        Icons.sports_volleyball_rounded,
                        size: 20,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).oneSubscription,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color),
                          ),
                          Text(
                            S.of(context).accessTo132RoomToTunisie,
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.seGreen),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            )),
          ),
        ),
        title: Text(
          S.of(context).subscription1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                ProfileContainer(
                  icon: Icons.app_shortcut_outlined,
                  title: 'My Appointments',
                  ontap: () {
                    GoRouter.of(context)
                        .push(AppRouteConstants.appointmentsScreen);
                  },
                ),
                ProfileContainer(
                  icon: Icons.replay_circle_filled_rounded,
                  title: S.of(context).changeYourSubscription,
                  ontap: () {
                    GoRouter.of(context).push(AppRouteConstants.subscription);
                  },
                ),
                ProfileContainer(
                  icon: Icons.report_gmailerrorred,
                  title: S.of(context).frequentlyAskQuestion,
                  ontap: () {
                    GoRouter.of(context)
                        .push(AppRouteConstants.frequentlyAskquestion);
                  },
                ),
                ProfileContainer(
                  icon: Icons.wallet,
                  title: S.of(context).paymentMethod,
                  ontap: () {
                    GoRouter.of(context)
                        .push(AppRouteConstants.paymentMethodScreen);
                  },
                ),
                ProfileContainer(
                  icon: Icons.send_rounded,
                  title: 'Contact',
                  ontap: () {
                    GoRouter.of(context).push(AppRouteConstants.contactScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
