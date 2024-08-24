import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

// ignore: must_be_immutable
class NumberAlreadyExit extends StatefulWidget {
  String number;
  NumberAlreadyExit({super.key, required this.number});

  @override
  State<NumberAlreadyExit> createState() => _NumberAlreadyExitState();
}

class _NumberAlreadyExitState extends State<NumberAlreadyExit> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Images/oops.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 10.h),
              Center(
                  child: Text(
                '${S.of(context).oops} ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).highlightColor),
              )),
              SizedBox(height: 20.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: '${S.of(context).telephoneNumber} ',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color)),
                    TextSpan(
                        text: '+40731883257\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.seGreen)),
                    TextSpan(
                        text: '${S.of(context).alreadyAssociateToAccount}.',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color)),
                  ])),
              SizedBox(height: 20.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            '${S.of(context).doYouWantToLoginWithOldAccount}\n',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color)),
                    TextSpan(
                        text: '+g********6@quipas.com\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color)),
                  ])),
              SizedBox(height: 40.h),
              AuthButton(
                  text: S.of(context).yesIWantToLoginMyAccount,
                  fontcolor: AppColors.black,
                  backgroundcolor: AppColors.seGreen,
                  onTap: () {
                    context.go(AppRouteConstants.login);
                  }),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border:
                          Border.all(color: AppColors.black.withOpacity(.2)),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).iHadAWrongPhoneNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
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
