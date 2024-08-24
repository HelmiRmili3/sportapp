import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/language_controller.dart';

import '../../../core/app_images.dart';
import '../../../core/routes/route_names.dart';

class OnBoadingScreen extends StatefulWidget {
  const OnBoadingScreen({super.key});

  @override
  State<OnBoadingScreen> createState() => _OnBoadingScreebState();
}

class _OnBoadingScreebState extends State<OnBoadingScreen> {
  PageController pageController = PageController();
  LanguageController languageController = Get.find();

  int _currentPage = 0;

  continueMethod() {
    context.push(AppRouteConstants.login);
  }

  @override
  Widget build(BuildContext context) {
    List onBoadingData = [
      {
        "title": S.of(context).subscription,
        "description": S.of(context).dailyAccessFor30DaysToToTunaisia,
        "image": AppImages.onBoarding1,
      },
      {
        "title": S.of(context).goWhereverYouWant,
        "description": S.of(context).todayFitnessEtc,
        "image": AppImages.onBoarding2,
      },
      {
        "title": S.of(context).finallyGymEasily,
        "description": S.of(context).goToTheGymNearYou,
        "image": AppImages.onBoarding3,
      },
      {
        "title": S.of(context).checkinWorkout,
        "description": S.of(context).scanCodeWhenEnterTheGym,
        "image": AppImages.onBoarding4,
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(children: [
        PageView.builder(
          controller: pageController,
          itemCount: onBoadingData.length,
          // physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onBoadingData[index]['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 85.h,
                  left: 20.w,
                  child: SizedBox(
                    width: 350.w,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Align text to the start of the column
                        children: [
                          Text(
                            onBoadingData[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'ClashDisplay',
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                              height: 10
                                  .h), // Add some space between the two text widgets
                          Text(
                            onBoadingData[index]['description'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: 690.h,
          left: 100.w,
          child: SmoothPageIndicator(
            controller: pageController,
            count: onBoadingData.length,
            effect: CustomizableEffect(
              dotDecoration: DotDecoration(
                color: AppColors.black.withOpacity(.3),
                width: 30,
                borderRadius: BorderRadius.circular(10),
              ),
              activeDotDecoration: DotDecoration(
                color: AppColors.seGreen,
                width: 30,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onDotClicked: (index) {},
          ),
        ),
        Positioned(
          top: 720.h,
          left: 20.w,
          child: ActionSlider.standard(
            sliderBehavior: SliderBehavior.stretch,
            height: 60.h,
            width: 350.w,
            backgroundColor: AppColors.black,
            toggleColor: AppColors.seGreen,
            action: (controller) async {
              if (_currentPage < onBoadingData.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                continueMethod();
              }
            },
            child: Text(
              S.of(context).iWantToTryForFree,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'ClashDisplay',
                color: AppColors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 790.h,
          left: 120.w,
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.login);
            },
            child: Text(S.of(context).iAmAlreadyAMember),
          ),
        ),
        // Center(
        //     child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(S.of(context).greeting,
        //         style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //           color: AppColors.seGreen,
        //         )),
        //     ElevatedButton(
        //       onPressed: () {
        //         languageController.changeLanguage('ar', 'SA');
        //       },
        //       child: const Text("Arabic"),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         languageController.changeLanguage('en', 'US');
        //       },
        //       child: const Text("english"),
        //     ),
        //   ],
        // )),
      ]),
    );
  }
}
