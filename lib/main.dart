import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/presentation/controllers/auth_controller.dart';
import 'package:sportapp/presentation/controllers/language_controller.dart';

import 'core/dependency_injection/service_locator.dart';
import 'core/routes/app_routes.dart';
import 'generated/l10n.dart';
import 'presentation/bindings/app_bindings.dart';
import 'presentation/controllers/connectivity_controller.dart';
import 'presentation/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection().init();
  Get.put(sl<AuthController>());

  Get.put(ConnectivityController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp.router(
            debugShowCheckedModeBanner: false,
            initialBinding: AppBindings(),
            // Localization and routing configurations
            theme: sl<ThemeController>().themeData,
            locale: sl<LanguageController>().locale,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('ar', ''), // Arabic
              Locale('fr', ''), // French
            ],
          ),
        );
      },
    );
  }
}
