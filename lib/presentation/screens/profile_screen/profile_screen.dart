import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/core/dependency_injection/service_locator.dart';
import 'package:sportapp/core/navigation/navigation_service.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/language_controller.dart';
import 'package:sportapp/presentation/controllers/auth_controller.dart';
import 'package:sportapp/presentation/controllers/theme_controller.dart';
import '../../../core/routes/route_names.dart';
import '../../controllers/user_controller.dart';
import 'widgets/profile_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    sl<UserController>().getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.size8),
                    child: SizedBox(
                      width: AppSizes.size100,
                      height: AppSizes.size100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Obx(() {
                          final user = sl<UserController>().user;
                          return Image.network(
                            fit: BoxFit.cover,
                            user?.profilePicture ??
                                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                          );
                        }),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouteConstants.editProfileScreen);
                        },
                        child: Container(
                          height: 40.h,
                          width: 165.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              Text(
                                S.of(context).editProfileButton,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFED1F1F),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          S.of(context).notSubscribed,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFED1F1F)),
                        )),
                      )
                    ],
                  ),
                ],
              ),
              Obx(() => Switch(
                    onChanged: (bool value) {
                      sl<ThemeController>().setTheme(themeValue: value);
                    },
                    value: sl<ThemeController>().isDarkTheme,
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.seGreen,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )),
              Text(
                "${S.of(context).hi} , ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    final user = sl<UserController>().user;
                    return Text(
                      user?.firstName ?? "Loading...",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    );
                  }),
                  const LanguageDropDown()
                ],
              ),
              ProfileContainer(
                icon: Icons.diamond_outlined,
                title: S.of(context).yourSubscription,
                ontap: () {
                  GoRouter.of(context).push(AppRouteConstants.yourSubscription);
                },
              ),
              ProfileContainer(
                icon: Icons.receipt_sharp,
                title: S.of(context).checkInHistory,
                ontap: () {
                  // GoRouter.of(context).push(AppRouteConstants.historyScreen);
                },
              ),
              ProfileContainer(
                icon: Icons.card_giftcard,
                title: S.of(context).bonus,
                ontap: () {
                  GoRouter.of(context).push(AppRouteConstants.bonusScreen);
                },
              ),
              ProfileContainer(
                icon: Icons.settings,
                title: S.of(context).setting,
                ontap: () {
                  GoRouter.of(context).push(AppRouteConstants.settingScreen);
                },
              ),
              ProfileContainer(
                icon: Icons.info_outline,
                title: S.of(context).help,
                ontap: () {
                  // context.push(AppRouteConstants.helpScreen);
                  // GoRouter.of(context).push(AppRouteConstants.helpScreen);
                  sl<NavigationService>()
                      .pushNamed(AppRouteConstants.helpScreen);
                },
              ),
              ProfileContainer(
                color: Colors.red,
                icon: Icons.login_outlined,
                title: S.of(context).logout,
                ontap: () {
                  sl<AuthController>().logout();
                },
              ),
              SizedBox(height: 5.h),
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.w),
                      decoration: BoxDecoration(
                          color: AppColors.seGreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.seGreen),
                            child: Image.asset(
                              'assets/Images/app_logo.png',
                              height: 44.h,
                              width: 35.w,
                              scale: 1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.push(AppRouteConstants.subscription);
                            },
                            child: Padding(
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
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find();

    return DropdownButton(
      style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
      value: languageController.locale,
      dropdownColor: Theme.of(context).primaryColor,
      onChanged: (Locale? locale) {
        if (locale != null) {
          languageController.changeLanguage(
            locale.languageCode,
            locale.countryCode!,
          );
        }
      },
      items: [
        DropdownMenuItem(
          value: const Locale('en', 'US'),
          child: Text(S.of(context).english),
        ),
        DropdownMenuItem(
          value: const Locale('ar', 'SA'),
          child: Text(S.of(context).arabic),
        ),
        DropdownMenuItem(
          value: const Locale('fr', 'FR'),
          child: Text(S.of(context).french),
        ),
      ],
    );
  }
}
