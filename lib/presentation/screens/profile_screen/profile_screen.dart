import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/language_controller.dart';
import 'package:sportapp/presentation/controllers/theme_controller.dart';
import '../../../core/app_constants.dart';
import '../../../core/routes/route_names.dart';
import 'widgets/profile_container.dart';

enum Language { english, urdu }

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<LanguageProvider>(context, listen: false);
  // }

  bool isDarkMode = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    AppSizes().init(context);
    List languageText = [
      "English",
      "Urdu",
      "Greek",
    ];
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
                          borderRadius: BorderRadius.circular(AppSizes.size100),
                          child: const Image(
                              image: NetworkImage(
                                  "https://picsum.photos/250?image=9"))),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(AppRouteConstants.editProfileScreen);
                        },
                        child: Container(
                          height: AppSizes.size40,
                          width: AppSizes.size160,
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
                                width: 1.w, color: const Color(0xFFED1F1F))),
                        child: Center(
                            child: Text(
                          "Not subscribed !",
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
              Switch(
                onChanged: (bool value) async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("themeValue", value);
                  themeController.setTheme(themeValue: value);
                },
                // onChanged: toggleSwitch,
                value: AppConstant.themValue,

                activeColor: Colors.white,
                activeTrackColor: AppColors.seGreen,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              ),
              Text(
                S.of(context).hi,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mohamed ben rekaya',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                  ),
                  const LanguageDropDown()
                ],
              ),
              ProfileContainer(
                icon: Icons.diamond_outlined,
                title: S.of(context).yourSubscription,
                ontap: () {
                  context.push(AppRouteConstants.yourSubscription);
                },
              ),
              ProfileContainer(
                icon: Icons.receipt_sharp,
                title: S.of(context).checkInHistory,
                ontap: () {},
              ),
              ProfileContainer(
                icon: Icons.card_giftcard,
                title: S.of(context).bonus,
                ontap: () {
                  context.push(AppRouteConstants.bonusScreen);
                },
              ),
              ProfileContainer(
                icon: Icons.settings,
                title: S.of(context).setting,
                ontap: () {
                  context.push(AppRouteConstants.settingScreen);
                },
              ),
              ProfileContainer(
                icon: Icons.info_outline,
                title: S.of(context).help,
                ontap: () {
                  context.push(AppRouteConstants.helpScreen);
                },
              ),
              ProfileContainer(
                color: Colors.red,
                icon: Icons.login_outlined,
                title: S.of(context).logout,
                ontap: () {
                  context.go(AppRouteConstants.login);
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
                            // height: 40.h,
                            // width: 35.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // shape: BoxShape.rectangle,
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
      items: const [
        DropdownMenuItem(
          value: Locale('fr', 'FR'),
          child: Text('French'),
        ),
        DropdownMenuItem(
          value: Locale('en', 'US'),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('ar', 'SA'),
          child: Text('Arabic'),
        ),
      ],
    );
  }
}
