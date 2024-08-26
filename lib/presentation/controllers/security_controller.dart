import 'package:get/get.dart';

class SecurityController extends GetxController {
  bool isSwitched = false;
  String verificationMethod = "whatsApp";

  void switchValue(bool value) {
    isSwitched = value;
    update();
  }

  void changeVerificationMethod(String value) {
    verificationMethod = value;
    update();
  }
}
