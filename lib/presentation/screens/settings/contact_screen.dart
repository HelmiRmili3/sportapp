import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';

import '../../../generated/l10n.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
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
          'Contact',
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
              Image.asset(
                'assets/Images/contact.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 50.h),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildExpansionTile(
                      S.of(context).selectDepartment,
                      S.of(context).seeDepartment,
                    ),
                    const Divider(),
                    _buildExpansionTile(
                      S.of(context).howCanWeContactYou,
                      'mohamedbenrekaya@gmail.com',
                    ),
                    const Divider(),
                    _buildExpansionTile(
                      S.of(context).howWeCanHelpYou,
                      S.of(context).describeAProblem,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String subtitle) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).textTheme.bodySmall!.color,
      backgroundColor: Theme.of(context).primaryColor,
      collapsedBackgroundColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).textTheme.bodySmall!.color,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).textTheme.bodySmall!.color),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontSize: 14.0,
            color: Theme.of(context).textTheme.bodySmall!.color),
      ),
      children: [
        Text(
          S.of(context).answerToQuestionGoesHere,
          style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).textTheme.bodySmall!.color),
        ),
      ],
    );
  }
}
