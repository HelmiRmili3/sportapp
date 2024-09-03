import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../profile_screen/widgets/profile_container.dart';

// enum Language { english, urdu }

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // bool isSwitched = false;
  // var textValue = 'Switch is OFF';
  // bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .goNamed(AppRouteConstants.dashboardScreen, extra: 4);
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
          S.of(context).setting,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              ProfileContainer(
                icon: Icons.info_outline_rounded,
                title: S.of(context).help,
                ontap: () {
                  context.push(AppRouteConstants.helpScreen, extra: 3);
                },
              ),
              ProfileContainer(
                icon: Icons.star_border,
                title: S.of(context).rateUs,
                ontap: () {},
              ),
              ProfileContainer(
                icon: Icons.thumb_up_off_alt_outlined,
                title: S.of(context).feedback,
                ontap: () {
                  context.push(AppRouteConstants.feedback);
                },
              ),
              ProfileContainer(
                icon: Icons.menu_book_sharp,
                title: S.of(context).termCondition,
                ontap: () {},
              ),
              ProfileContainer(
                icon: Icons.document_scanner_outlined,
                title: S.of(context).confidentiality,
                ontap: () {
                  context.push(AppRouteConstants.sorry, extra: 3);
                },
              ),
              // ProfileContainer(
              //   color: Colors.red,
              //   icon: Icons.login_outlined,
              //   title: S.of(context).logout,
              //   ontap: () {
              //     context.push(AppRouteConstants.login);
              //   },
              // ),
              SizedBox(height: 40.h),
              const Center(
                  child: Text('Version 1.0',
                      style: TextStyle(fontWeight: FontWeight.w100))),
              SizedBox(height: 40.h),
              Container(
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
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).oneSubscription,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  S.of(context).accessTo132RoomToTunisie,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
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
    );
  }
}
