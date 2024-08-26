import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/coach_model.dart';
import '../../presentation/screens/change_password/change_password.dart';
import '../../presentation/screens/dashbord_screen/dashboard_screen.dart';
import '../../presentation/screens/forget/forget_otp_verification_screen.dart';
import '../../presentation/screens/forget_password_screen/forget_password_screen.dart';
import '../../presentation/screens/gyms_screen/gyms_details_screen.dart';
import '../../presentation/screens/history_screen/history_screen.dart';
import '../../presentation/screens/home_screen/home_screen.dart';
import '../../presentation/screens/onbording_screen/onbording_screen.dart';
import '../../presentation/screens/login_screen/login_screen.dart';
import '../../presentation/screens/payment_methods/payment_method.dart';
import '../../presentation/screens/payment_methods/payment_method_screen.dart';
import '../../presentation/screens/payment_methods/payment_screen.dart';
import '../../presentation/screens/private_coach_screen/private_coache_details_screen.dart';
import '../../presentation/screens/profile_screen/edit_profile_screen.dart';
import '../../presentation/screens/profile_screen/profile_screen.dart';
import '../../presentation/screens/registration/choose_city_screen.dart';
import '../../presentation/screens/registration/face_recognize_screen.dart';
import '../../presentation/screens/registration/number_already_register_screen.dart';
import '../../presentation/screens/registration/otp_verification_screen.dart';
import '../../presentation/screens/registration/create_account_screen.dart';
import '../../presentation/screens/registration/phone_number_screen.dart';
import '../../presentation/screens/registration/recognise_profile_screen.dart';
import '../../presentation/screens/registration/register_email_screen.dart';
import '../../presentation/screens/registration/registration_done_screen.dart';
import '../../presentation/screens/security/security_screen.dart';
import '../../presentation/screens/security/security_verification_screen.dart';
import '../../presentation/screens/splash_screen/splash_screen.dart';
import '../../presentation/screens/subscription/appointment_screen.dart';
import '../../presentation/screens/subscription/subscription.dart';

import 'route_names.dart';

class AppRouter {
  static String currentScreen = '/';
  static GoRouter router = _buildRouter();

  static GoRouter _buildRouter() {
    return GoRouter(
      initialLocation: '/',
      errorPageBuilder: (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text('Page Not Found')))),
      routes: [
        GoRoute(
          name: AppRouteConstants.splashScreen,
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const SplashScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.homeView,
          path: AppRouteConstants.homeView,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: HomeScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.faceRecognization1,
          path: AppRouteConstants.faceRecognization1,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const FaceRecognization1(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   name: AppRouteConstants.contactScreen,
        //   path: AppRouteConstants.contactScreen,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: ContactScreen(
        //         screenName: 'contactScreen',
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: AppRouteConstants.frequentlyAskquestion,
        //   path: AppRouteConstants.frequentlyAskquestion,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: const FrequentlyAskQuestion(),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: AppRouteConstants.sorry,
        //   path: AppRouteConstants.sorry,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: SorryScreen(
        //         screenName: '',
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: AppRouteConstants.feedback,
        //   path: AppRouteConstants.feedback,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: FeedBackScreen(
        //         screenName: '',
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: AppRouteConstants.helpScreen,
        //   path: AppRouteConstants.helpScreen,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: HelpScreen(
        //         screenName: "help",
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: AppRouteConstants.YourSubscription,
        //   path: AppRouteConstants.YourSubscription,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: YourSubscription(
        //         screenName: "",
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        GoRoute(
          name: AppRouteConstants.paymentMethodScreen,
          path: AppRouteConstants.paymentMethodScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: PaymentMethodScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   name: AppRouteConstants.RoomsList,
        //   path: AppRouteConstants.RoomsList,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: const GymsScreen(),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   name: AppRouteConstants.BreakScreen,
        //   path: AppRouteConstants.BreakScreen,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: BreakScreen(
        //         screenName: "",
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        GoRoute(
          name: AppRouteConstants.subscription,
          path: AppRouteConstants.subscription,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const SubscriptionPackagesScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.dashboardScreen,
          path: AppRouteConstants.dashboardScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            // final int index = state.extra as int;
            return CustomTransitionPage(
              child: DashboardScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.facialrecognition,
          path: AppRouteConstants.facialrecognition,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            final File image = state.extra as File;
            return CustomTransitionPage(
              child: Facialrecognition(image: image),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.gymDetailScreen,
          path: AppRouteConstants.gymDetailScreen,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const GymDetailScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.appointmentsScreen,
          path: AppRouteConstants.appointmentsScreen,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const Appointments(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.chooseCity,
          path: AppRouteConstants.chooseCity,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const ChooseCityScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   name: AppRouteConstants.livesupportchat,
        //   path: AppRouteConstants.livesupportchat,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: const LiveSupportChat(),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        GoRoute(
          name: AppRouteConstants.coachDetail,
          path: AppRouteConstants.coachDetail,
          pageBuilder: (context, state) {
            final CoachModel model = state.extra as CoachModel;
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: CoachDetailScreen(modelData: model),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.onBoardingScreen,
          path: AppRouteConstants.onBoardingScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const OnBoadingScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.historyScreen,
          path: AppRouteConstants.historyScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return MaterialPage(
              child: HistoryScreen(
                screenName: "History",
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.login,
          path: AppRouteConstants.login,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const LoginScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.registration,
          path: AppRouteConstants.registration,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const RegistrationScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.forgot,
          path: AppRouteConstants.forgot,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const ForgotPasswordScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.changePasswordf,
          path: AppRouteConstants.changePasswordf,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const ChangePasswordScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   name: AppRouteConstants.settingScreen,
        //   path: AppRouteConstants.settingScreen,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: SettingScreen(
        //         screenName: 'setting',
        //       ),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCubic)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        GoRoute(
          name: AppRouteConstants.otpforgot,
          path: AppRouteConstants.otpforgot,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const ForgetOtpVerificationScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.bounceInOut).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.otpverification,
          path: AppRouteConstants.otpverification,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            final String number = state.extra as String;
            return CustomTransitionPage(
              child: OtpVerificationScreen(number: number),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.ease).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.phoneNoAlreadyR,
          path: AppRouteConstants.phoneNoAlreadyR,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            final String number = state.extra as String;
            return CustomTransitionPage(
              child: NumberAlreadyExit(number: number),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.registerEmail,
          path: AppRouteConstants.registerEmail,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const RegistrationEmailScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.registerDone,
          path: AppRouteConstants.registerDone,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const RegistractionDoneScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.validateAccount,
          path: AppRouteConstants.validateAccount,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const ValidateAccount(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.profileScreen,
          path: AppRouteConstants.profileScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const ProfileScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCubic)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.editProfileScreen,
          path: AppRouteConstants.editProfileScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const EditProfileScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   name: AppRouteConstants.bonusScreen,
        //   path: AppRouteConstants.bonusScreen,
        //   pageBuilder: (context, state) {
        //     saveLocalData(screenName: state.name!);
        //     return CustomTransitionPage(
        //       child: const BonusScreen(),
        //       transitionDuration: const Duration(seconds: 0),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        GoRoute(
          name: AppRouteConstants.securityScreen,
          path: AppRouteConstants.securityScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const SecurityVerificationScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.payment2,
          path: AppRouteConstants.payment2,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const PaymentScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.securityScreenmob,
          path: AppRouteConstants.securityScreenmob,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const SecurityScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.securityVerification,
          path: AppRouteConstants.securityVerification,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const SecurityVerificationScreen(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.payments,
          path: AppRouteConstants.payments,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return CustomTransitionPage(
              child: const PaymentMethod(),
              transitionDuration: const Duration(seconds: 0),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    );
  }

  static Future<void> saveLocalData({required String screenName}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove(AppRouteConstants.currentScreenName);
      sharedPreferences.setString(
          AppRouteConstants.currentScreenName, screenName);
    } catch (e) {
      if (kDebugMode) {
        print("Error saving local data: $e");
      }
    }
  }

  static Future<void> getLocalData() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getString(AppRouteConstants.currentScreenName) !=
          null) {
        currentScreen =
            sharedPreferences.getString(AppRouteConstants.currentScreenName)!;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting local data: $e");
      }
    }
  }
}
