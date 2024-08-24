import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }
}
