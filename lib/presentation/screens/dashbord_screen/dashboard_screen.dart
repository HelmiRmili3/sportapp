import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../controllers/dashboard_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../gyms_screen/gyms_screen.dart';
import '../home_screen/home_screen.dart';
import '../private_coach_screen/private_coach.dart';
import '../profile_screen/profile_screen.dart';
import '../qr_code_screen/qr_code_scanner_screen.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NotchBottomBarController _controller = NotchBottomBarController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    const GymsScreen(),
    const QrCodeScannerScreen(),
    const PrivateCoach(),
    ProfileScreen(),
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Obx(() {
        return bottomBarPages[controller.currentIndex.value];
      }),
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
          bottomBarItems: [
            BottomBarItem(
              inActiveItem: const Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: AppColors.white,
              ),
              itemLabel: 'Home',
            ),
            BottomBarItem(
              inActiveItem:
                  const Icon(Icons.sports_gymnastics, color: Colors.blueGrey),
              activeItem: Icon(
                Icons.sports_gymnastics_outlined,
                color: AppColors.white,
              ),
              itemLabel: 'Gyms',
            ),
            BottomBarItem(
              inActiveItem: const Icon(
                Icons.qr_code_2_outlined,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.qr_code_2_outlined,
                color: AppColors.white,
              ),
              itemLabel: 'QR Scan',
            ),
            BottomBarItem(
              inActiveItem: const Icon(
                Icons.workspace_premium_outlined,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.workspace_premium_outlined,
                color: AppColors.white,
              ),
              itemLabel: 'Coaches',
            ),
            BottomBarItem(
              inActiveItem: const Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.person,
                color: AppColors.white,
              ),
              itemLabel: 'Profile',
            ),
          ],
          onTap: (index) {
            controller.changeIndex(index);
          },
          kIconSize: 24.0,
        );
      }),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.98,
          minChildSize: 0.9,
          maxChildSize: 0.99,
          builder: (context, ScrollController scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                color: Colors.black,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Voulez-vous aller \nà la salle de sport?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '! Pour vous enregistrer,',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "complétez l'authentification",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 300,
                          child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                            overlay: QrScannerOverlayShape(
                              borderColor: Colors.red,
                              borderRadius: 10,
                              borderLength: 30,
                              borderWidth: 10,
                              cutOutSize: 250,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Après authentification, scannez le code QR\n à la  récéption de la salle pour \nl'enregistrement",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.search_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Text(
                                  'Voir les salles',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.electric_bolt_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Text(
                                  'Lanterne',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
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
  }
}
