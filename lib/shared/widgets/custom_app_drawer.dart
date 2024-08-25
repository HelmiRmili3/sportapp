import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Material(
              elevation: 0,
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: const Size.square(70),
                currentAccountPicture: const CircleAvatar(
                  child: FlutterLogo(),
                ),
                accountName: Text(S.of(context).abidUllahOrakzai),
                accountEmail: const Text('abid.kust2019@gmail.com'),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTileWidget(
              text: S.of(context).myProfile,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.person,
            ),
            ListTileWidget(
              text: S.of(context).myCourse,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.book,
            ),
            ListTileWidget(
              text: S.of(context).myPremium,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.workspace_premium,
            ),
            ListTileWidget(
              text: S.of(context).savedVideos,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.video_label,
            ),
            ListTileWidget(
              text: S.of(context).editProfile,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.edit,
            ),
            ListTileWidget(
              text: S.of(context).logout,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
