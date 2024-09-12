import 'package:get/get.dart';
import '../../data/models/packges_model.dart';

class PaymentController extends GetxController {
  final RxBool _isSwitched = false.obs;
  final RxString _verificationMethod = 'Upgrade unlimited access'.obs;
  final RxBool _isleftButtonActive = true.obs;

  bool get isSwitched => _isSwitched.value;
  bool get isleftButtonActive => _isleftButtonActive.value;
  String get verificationMethod => _verificationMethod.value;

  RxList<Packages> packages = <Packages>[
    Packages(
      name: 'Monthly',
      price: '30',
      isSelected: true,
      savePercent: '',
    ),
    Packages(
      name: 'Quarterly',
      price: '25',
      isSelected: false,
      savePercent: 'Save up to 25%',
    ),
    Packages(
      name: 'Yearly',
      price: '20',
      isSelected: false,
      savePercent: 'Save up to 27%',
    ),
  ].obs;

  void changeButtonState(bool value) {
    _isleftButtonActive.value = value;
  }

  void selectPackage(int index) {
    for (int i = 0; i < packages.length; i++) {
      packages[i].isSelected = i == index;
    }
    packages.refresh();
  }

  void switchValue(bool value) {
    _isSwitched.value = value;
  }

  void changeVerificationMethod(String value) {
    _verificationMethod.value = value;
  }
}
