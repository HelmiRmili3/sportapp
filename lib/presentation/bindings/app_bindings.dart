import 'package:get/get.dart';
import 'package:sportapp/presentation/bindings/dashboard_bindings.dart';

import 'language_bindings.dart';
import 'theme_bindings.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    ThemeBinding().dependencies();
    LanguageBindings().dependencies();
    DashboardBindings().dependencies();
  }
}
