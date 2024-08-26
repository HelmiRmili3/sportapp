import 'package:get/get.dart';
import 'package:sportapp/presentation/controllers/security_controller.dart';

class SecurityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecurityController());
  }
}
