import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/data/models/user_register_request_model.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/auth_controller.dart';

import '../../../core/dependency_injection/service_locator.dart';
import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

class RegistractionDoneScreen extends StatefulWidget {
  const RegistractionDoneScreen({super.key});

  @override
  State<RegistractionDoneScreen> createState() =>
      _RegistractionDoneScreenState();
}

class _RegistractionDoneScreenState extends State<RegistractionDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Image.asset(
                'assets/Images/completer.png',
                height: 250.h,
                width: 250.w,
              ),
              SizedBox(height: 10.h),
              Center(
                  child: Text(
                S.of(context).thankYou,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              )),
              SizedBox(height: 20.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: S.of(context).notificationReceivedOfWhichEtc,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ])),
              SizedBox(height: 80.h),
              AuthButton(
                text: S.of(context).continueAsGuest,
                fontcolor: AppColors.black,
                backgroundcolor: AppColors.seGreen,
                onTap: () {
                  // GoRouter.of(context).push(AppRouteConstants.dashboardScreen);
                },
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  sl<AuthController>().register();
                },
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: AppColors.black.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).iHadAWrongPhoneNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
