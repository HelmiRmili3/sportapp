import 'package:get/get.dart';

class SecurityController extends GetxController {
  final RxBool _isSwitched = false.obs;
  final RxString _verificationMethod = "whatsApp".obs;
  bool get isSwitched => _isSwitched.value;
  String get verificationMethod => _verificationMethod.value;

  void switchValue(bool value) {
    _isSwitched.value = value;
  }

  void changeVerificationMethod(String value) {
    _verificationMethod.value = value;
  }
}
