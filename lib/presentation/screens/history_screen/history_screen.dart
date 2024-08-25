import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/presentation/controllers/history_controller.dart';

import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_app_drawer.dart';

class HistoryScreen extends GetView<HistoryController> {
  String? screenName;
  HistoryScreen({required this.screenName, super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      key: _scaffoldKey,
      appBar: customAppBar(
        onTapBack: () {
          context.go(AppRouteConstants.dashboardScreen);
        },
        appBarText: screenName!,
        leadingIcon: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: controller.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${controller.categoryList[index]} history"),
            onTap: () {},
          );
        },
      ),
    );
  }
}
