import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../profile_screen/widgets/profile_container.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
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
          S.of(context).help,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Image.asset(
                'assets/Images/aid.png',
                height: 300,
                width: 300,
              ),
              SizedBox(height: 50.h),
              ProfileContainer(
                icon: Icons.info_outline_rounded,
                title: S.of(context).frequentlyAskQuestion,
                ontap: () {
                  context.push(AppRouteConstants.frequentlyAskquestion);
                },
              ),
              ProfileContainer(
                icon: Icons.text_rotation_angledown_outlined,
                title: S.of(context).reportAProblem,
                ontap: () {},
              ),
              ProfileContainer(
                icon: Icons.send_outlined,
                title: 'Contact',
                ontap: () {
                  context.push(AppRouteConstants.contactScreen);
                },
              ),
              ProfileContainer(
                icon: Icons.chat_outlined,
                title: 'Customer Support chat',
                ontap: () {
                  context.push(AppRouteConstants.livesupportchat);
                },
              ),
              ProfileContainer(
                icon: Icons.thumb_up_off_alt_outlined,
                title: S.of(context).feedback,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
