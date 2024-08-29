import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';
import '../profile_screen/widgets/profile_container.dart';

class SorryScreen extends StatefulWidget {
  const SorryScreen({super.key});

  @override
  State<SorryScreen> createState() => _SorryScreenState();
}

class _SorryScreenState extends State<SorryScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.pop(AppRouteConstants.dashboardScreen);
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
          S.of(context).sorry,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Image.asset('assets/Images/sorry.png', height: 300, width: 300),
              SizedBox(height: 20.h),
              Text(
                'Mohamed ben rekaya',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                ' ${S.of(context).itAppearThatUHaveNotCompletedYourConnection}',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              SizedBox(height: 20.h),
              ProfileContainer(
                icon: Icons.info_outline_rounded,
                title: S.of(context).frequentlyAskQuestion,
                ontap: () {
                  context.push(AppRouteConstants.frequentlyAskquestion);
                },
              ),
              ProfileContainer(
                icon: Icons.send_outlined,
                title: 'Contact',
                ontap: () {
                  context.go(AppRouteConstants.contactScreen);
                },
              ),
              SizedBox(height: 20.h),
              AuthButton(
                  text: S.of(context).completeTheConnection,
                  fontcolor: AppColors.black,
                  backgroundcolor: AppColors.seGreen,
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
