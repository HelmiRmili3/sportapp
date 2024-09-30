import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../generated/l10n.dart';
import 'access_autorise.dart';
import 'access_refuse.dart';
import 'check_in_deja_fait.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  Barcode? result;

  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  List<String> qrCodes = ['1', '2', '3'];
  List<String> qrCodes2 = [];

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print('QR Code: ${result!.code}');
      });
      if (result != null) {
        controller.pauseCamera();
        // check if the user allready scanned the code
        if (qrCodes2.contains(result!.code)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccessAutorise()),
          );
        }

        // Check if the user is in the list of users
        if (!qrCodes.contains(result!.code)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccessRefuse()),
          );
        }

        // the user is not in the list of users
        if (qrCodes.contains(result!.code)) {
          qrCodes2.add(result!.code!);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckInDejaFait()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 1000.h,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    S.of(context).doYouWantGym,
                    // "Do you want to the gym",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    S.of(context).toRegister,
                    // S.of(context).to_register,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    S.of(context).completeAuth,
                    // S.of(context).complete_the_authentication,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    height: 400.h,
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.red,
                        borderRadius: 10.r,
                        borderLength: 30.r,
                        borderWidth: 10.w,
                        cutOutSize: 350,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Text(
                    S.of(context).afterAuthQR,
                    // S.of(context).after_authentication_scan_qr_code_at_etc,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller!.pauseCamera();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AccessAutorise()),
                              );
                            },
                            child: Text(
                              S.of(context).seeRooms,
                              // S.of(context).see_the_rooms,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.electric_bolt_outlined,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                          Text(
                            S.of(context).lantern,
                            // S.of(context).lantern,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
