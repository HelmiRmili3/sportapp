import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/dependency_injection/service_locator.dart';
import '../controllers/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController(prefs: sl<SharedPreferences>()));
  }
}
