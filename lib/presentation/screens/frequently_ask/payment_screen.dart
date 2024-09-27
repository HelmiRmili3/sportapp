import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../profile_screen/widgets/profile_container.dart';
import 'widgets/bottom_sheet.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildExpansionTile(
                  'Comment puis-je payer mon abonnement ?', '', '', context),
              const SizedBox(
                height: 10,
              ),
              _buildExpansionTile(
                  'Puis-je annuler mon paiement ?',
                  '',
                  'Notre politique de confidentialité régit également l\'utilisation du site (« www.App.tn ») ; veuillez lire attentivement la politique de confidentialité pour obtenir des informations importantes sur nos pratiques de confidentialité',
                  context),
              const SizedBox(
                height: 10,
              ),
              _buildExpansionTile(
                  'Comment puis-je mettre à jour mes informations de paiement ?',
                  '',
                  '',
                  context),
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
                title: 'Contact',
                ontap: () {
                  // context.go(AppRouteConstants.login);
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
      ),
    );
  }

  Widget _buildExpansionTile(
      String title, String subtitle, String? body, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        collapsedBackgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColor,
        iconColor: Theme.of(context).textTheme.bodySmall!.color,
        collapsedIconColor: Theme.of(context).textTheme.bodySmall!.color,
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
            ),
          ],
        ),
        subtitle: subtitle.isNotEmpty
            ? Text(
                subtitle,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              )
            : const SizedBox.shrink(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              body ?? '',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                  color: Theme.of(context).textTheme.bodySmall!.color),
            ),
          ),
        ],
      ),
    );
  }
}
