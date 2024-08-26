import 'package:get/get.dart';
import 'package:sportapp/presentation/controllers/subscription_controller.dart';

class SubscriptionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionController());
  }
}
