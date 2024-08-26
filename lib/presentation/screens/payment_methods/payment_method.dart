import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../profile_screen/widgets/profile_container.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.0.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(50),
                        color: AppColors.seGreen),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    'Payment method',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      // fontFamily: 'ClashDisplay',
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                )
              ],
            ),
            20.verticalSpace,
            ProfileContainerUpdated(
              icon: "assets/Images/card.png",
              title: S.of(context).payOnline,
              ontap: () {
                // context.push(AppRouteConstants.);
              },
            ),
            20.verticalSpace,
            ProfileContainerUpdated(
              icon: "assets/Images/cash_payment.png",
              title: 'Payment by Telephone balance',
              ontap: () {},
            ),
            20.verticalSpace,
            ProfileContainerUpdated(
              icon: "assets/Images/donate-coin.png",
              title: 'Pay in cash',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
