import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_images.dart';
import '../../../core/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    // Delay to show splash screen for a brief moment
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        if (isLoggedIn) {
          // Navigate to dashboard if the user is logged in
          GoRouter.of(context).go(AppRouteConstants.dashboardScreen);
        } else if (isFirstTime) {
          // Navigate to onboarding if it's the user's first time
          GoRouter.of(context).go(AppRouteConstants.onBoardingScreen);
        } else {
          // Navigate to login if not logged in and not first-time user
          GoRouter.of(context).go(AppRouteConstants.login);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashLogo),
          ],
        ),
      ),
    );
  }
}
