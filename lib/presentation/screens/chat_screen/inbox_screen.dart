import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_app_drawer.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      key: _scaffoldKey,
      appBar: customAppBar(
        onTapBack: () {
          Navigator.of(context).pop();
          // context.go(AppRouteConstants.navigationDrawerMainScreen);
        },
        appBarText: "Chat",
        leadingIcon: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text("cat screen"),
      ),
    );
  }
}
