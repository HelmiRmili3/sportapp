import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../controllers/dashboard_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../gyms_screen/gyms_screen.dart';
import '../home_screen/home_screen.dart';
import '../private_coach_screen/private_coach_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../qr_code_screen/qr_code_scanner_screen.dart';
import 'widgets/bottom_app_bar_widget.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NotchBottomBarController _controller = NotchBottomBarController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;

  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    // const GymsScreen(),
    const QrCodeScannerScreen(),
    const PrivateCoach(),
    const ProfileScreen(),
  ];
  final List<String> labels = [
    'Home',
    // 'Gyms',
    'QR Code',
    'Coaches',
    'Profile',
  ];
  final List<IconData> icons = [
    Icons.home,
    // Icons.fitness_center,
    Icons.qr_code_scanner,
    Icons.workspace_premium_outlined,
    Icons.person,
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BottomBarItem> bottomBarItems = List.generate(
      labels.length,
      (index) => buildBottomBarItem(
        label: labels[index],
        icon: icons[index],
        context: context,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      body: Obx(() => bottomBarPages[controller.currentIndex.value]),
      extendBody: true,
      bottomNavigationBar: Obx(() {
        _controller.index = controller.currentIndex.value;
        return AnimatedNotchBottomBar(
          notchBottomBarController: _controller,
          color: Theme.of(context).primaryColor,
          showLabel: true,
          textOverflow: TextOverflow.visible,
          maxLine: 1,
          shadowElevation: 5,
          kBottomRadius: 20.0,
          notchColor: AppColors.seGreen,
          removeMargins: false,
          bottomBarWidth: 500,
          showShadow: false,
          durationInMilliSeconds: 300,
          itemLabelStyle: const TextStyle(fontSize: 10),
          elevation: 1,
          bottomBarItems: bottomBarItems,
          onTap: (index) {
            controller.changeIndex(index);
          },
          kIconSize: 24.0,
        );
      }),
    );
  }
}
