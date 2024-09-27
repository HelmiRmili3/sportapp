import 'package:get/get.dart';
import 'package:sportapp/presentation/bindings/connectivity_bindings.dart';

import 'bonus_bindings.dart';
import 'dashboard_bindings.dart';
import 'history_bindings.dart';
import 'home_bindings.dart';
import 'language_bindings.dart';
import 'payment_bindings.dart';
import 'security_bindings.dart';
import 'subscription_bindings.dart';
import 'theme_bindings.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    ThemeBinding().dependencies();
    LanguageBindings().dependencies();
    DashboardBindings().dependencies();
    HomeBindings().dependencies();
    SecurityBindings().dependencies();
    HistoryBindings().dependencies();
    BonusBindings().dependencies();
    PaymentBindings().dependencies();
    BonusBindings().dependencies();
    SubscriptionBindings().dependencies();
    SecurityBindings().dependencies();
    ConnectivityBindings().dependencies();
  }
}
