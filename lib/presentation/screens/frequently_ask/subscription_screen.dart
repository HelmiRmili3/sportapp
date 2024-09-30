import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../profile_screen/widgets/profile_container.dart';
import 'widgets/bottom_sheet.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            ProfileContainer(
              icon: Icons.info_outline,
              title: S.of(context).reportAProblem,
              ontap: () {
                // context.go(AppRouteConstants.login);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileContainer(
              icon: Icons.send_outlined,
              title: S.of(context).contact,
              ontap: () {
                context.push(AppRouteConstants.contactScreen);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileContainer(
              icon: Icons.menu_book_sharp,
              title: S.of(context).termCondition,
              ontap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const BottomSheetWidget();
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileContainer(
              icon: Icons.phone_android,
              title: S.of(context).confidentiality,
              ontap: () {
                // context.go(AppRouteConstants.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
