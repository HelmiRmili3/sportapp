import 'package:get/get.dart';

import '../controllers/bonus_controller.dart';

class BonusBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BonusController());
  }
}
