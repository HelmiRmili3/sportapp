import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/generated/l10n.dart';

import '../login_screen/widgets/button.dart';

class BreakScreen extends StatefulWidget {
  String? screenName;

  BreakScreen({required this.screenName, super.key});

  @override
  State<BreakScreen> createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
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
        title: Text(
          S.of(context).doYouNeedBreak,
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
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 80, left: 20, right: 20, bottom: 40),
                          child: Expanded(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: S.of(context).chooseTheOption,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .color),
                                      ),
                                      TextSpan(
                                          text: ' HOLD ',
                                          style: TextStyle(
                                              color: AppColors.seGreen,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text:
                                            S.of(context).forOnly25RontPerMonth,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .color),
                                      ),
                                    ])),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.resolveWith(
                                  (states) => AppColors.seGreen),
                              value: true,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Expanded(
                                child: Text(
                              S.of(context).youWillHaveAccessOfOneMonthEntry,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.resolveWith(
                                  (states) => AppColors.seGreen),
                              value: true,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Expanded(
                                child: Text(
                              S.of(context).yourCurrentSubRemainUntil,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.resolveWith(
                                  (states) => AppColors.seGreen),
                              value: true,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Expanded(
                                child: Text(
                              S.of(context).youDoNotLoseDiscountsReceivedFor,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.resolveWith(
                                  (states) => AppColors.seGreen),
                              value: true,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Expanded(
                                child: Text(
                              S
                                  .of(context)
                                  .avoidPayingThe200LeiReactivationFees,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: -50,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.pause,
                          color: AppColors.seGreen,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              AuthButton(
                  text: S.of(context).iCancelNow,
                  fontcolor: AppColors.black,
                  backgroundcolor: AppColors.seGreen,
                  onTap: () {
                    _showSheet();
                  }),
              SizedBox(height: 20.h),
              AuthButton(
                  text: S.of(context).iWantToHold,
                  fontcolor: AppColors.black,
                  backgroundcolor: AppColors.white,
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  void _showSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.8,
          maxChildSize: .9,
          builder: (context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 685,
                    width: 395,
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S.of(context).termCondition,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                    child: Center(
                                        child: Icon(
                                      Icons.close,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                    )),
                                  ),
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/Images/lady.png',
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Veux-tu vraiment nous quitter ?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color),
                            ),
                            const SizedBox(height: 30),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        '''Vous avez choisi d'annuler le renouvellement automatique de l'abonnement.Si vous souhaitez continuer, vous pouvez acheter l'abonnement maintenant avec ''',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  TextSpan(
                                    text: ' 15% réduire',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ])),
                            SizedBox(height: 20.h),
                            AuthButton(
                                text: 'Je veux 15 % de réduction',
                                fontcolor: AppColors.black,
                                backgroundcolor: AppColors.seGreen,
                                onTap: () {}),
                            SizedBox(height: 20.h),
                            AuthButton(
                                text: S.of(context).iWantToHold,
                                fontcolor: Theme.of(context).primaryColor,
                                backgroundcolor: Theme.of(context).cardColor,
                                onTap: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
