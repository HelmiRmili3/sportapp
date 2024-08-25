import 'package:get/get.dart';

class PaymentController extends GetxController {
  bool isSwitched = false;
  String verificationMethod = "Upgrade unlimited access";
  bool isleftButtonActive = true;
  List<Packages> packages = [
    Packages(name: 'Monthly', price: '30', isSelected: true, savePercent: ''),
    Packages(
        name: 'Quarterly',
        price: '25',
        isSelected: false,
        savePercent: 'Save up to 25%'),
    Packages(
        name: 'Yearly',
        price: '20',
        isSelected: false,
        savePercent: 'Save up to 27%'),
  ];

  changeButtonState(bool value) {
    isleftButtonActive = value;
    update();
  }

  void selectPackage(int index) {
    for (int i = 0; i < packages.length; i++) {
      if (i == index) {
        packages[i].isSelected = true;
      } else {
        packages[i].isSelected = false;
      }
    }
    update();
  }

  void switchValue(bool value) {
    isSwitched = value;
    update();
  }

  void changeVerificationMethod(String value) {
    verificationMethod = value;
    update();
  }
}

class Packages {
  String? name;
  String? price;
  bool? isSelected;
  String? savePercent;

  Packages({
    this.name,
    this.price,
    this.isSelected,
    this.savePercent,
  });
}
