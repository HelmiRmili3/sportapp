import 'package:get/get.dart';
import 'package:sportapp/presentation/controllers/connectivity_controller.dart';

class ConnectivityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityController());
  }
}
