import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  double _progressValue = 0.5;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // LanguageController languageController = Get.find();
    // AppSizes().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.go(AppRouteConstants.settingScreen);
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
          S.of(context).feedback,
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
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).howWasYourExperienceWithApp,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Slider(
                        activeColor: Colors.grey[300],
                        thumbColor: AppColors.seGreen,
                        inactiveColor: Colors.grey[300],
                        value: _progressValue,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          setState(() {
                            _progressValue = newValue;
                            isDarkMode = true;
                          });
                        },
                      ),
                      Center(
                          child: Text(
                        S.of(context).allRight,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      )),
                      Text(
                        S.of(context).howIsOurPlatformCurrently,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Slider(
                        activeColor: Colors.grey[300],
                        thumbColor: AppColors.seGreen,
                        inactiveColor: Colors.grey[300],
                        value: _progressValue,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          setState(() {
                            _progressValue = newValue;
                            isDarkMode = true;
                          });
                        },
                      ),
                      Center(
                          child: Text(
                        S.of(context).allRight,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        S.of(context).howCanWeContactYou,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        S.of(context).emailOrPhoneNumber,
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        S.of(context).didYouFindAProblem,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        S.of(context).ifYesDescribeTheProblem,
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        S.of(context).doYouHaveAnySuggestionsForUs,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        S.of(context).ifYesDescribeWhatWeCouldImprove,
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      const Divider(),
                      AuthButton(
                          text: S.of(context).send,
                          fontcolor: isDarkMode
                              ? Colors.black
                              : AppColors.black.withOpacity(.4),
                          backgroundcolor: isDarkMode
                              ? AppColors.seGreen
                              : AppColors.seGreen.withOpacity(.2),
                          onTap: () {})
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
