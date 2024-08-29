import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../frequently_ask/accession_screen.dart';
import '../frequently_ask/payment_screen.dart';
import '../frequently_ask/subscription_screen.dart';
import '../frequently_ask/technical_screen.dart';

class FrequentlyAskQuestion extends StatefulWidget {
  const FrequentlyAskQuestion({super.key});

  @override
  State<FrequentlyAskQuestion> createState() => _FrequentlyAskQuestionState();
}

class _FrequentlyAskQuestionState extends State<FrequentlyAskQuestion>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
            // context.go(AppRouteConstants.settingScreen);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.seGreen,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          ),
        ),
        title: Text(
          'Questions fréquentes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        bottom: TabBar(
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: const EdgeInsets.symmetric(horizontal: 7.0),
          indicatorColor: AppColors.seGreen,
          labelColor: Theme.of(context).textTheme.bodySmall!.color,
          unselectedLabelColor: Theme.of(context).textTheme.bodySmall!.color,
          controller: _tabController,
          tabs: [
            Tab(
              text: S.of(context).subscription1,
            ),
            const Tab(text: 'Accession'),
            Tab(text: S.of(context).payment),
            Tab(text: S.of(context).technique),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: TabBarView(
          controller: _tabController,
          children: const [
            SubscriptionScreen(),
            AccessionScreen(),
            PaymentScreen(),
            TechniqalScreen(),
          ],
        ),
      ),
    );
  }
}
