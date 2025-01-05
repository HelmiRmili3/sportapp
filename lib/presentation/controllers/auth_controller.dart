import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportapp/core/global_error_handler/global_error_handler.dart';
import 'package:sportapp/core/routes/route_names.dart';
import 'package:sportapp/domain/usecases/login_use_case.dart';
import 'package:sportapp/domain/usecases/register_use_case.dart';

import '../../core/navigation/navigation_service.dart';
import '../../data/models/user_register_request_model.dart';
import '../../domain/usecases/logout_use_case.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;

  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController nameController;
  TextEditingController referralController;
  TextEditingController phoneNumberController;
  TextEditingController codeController;
  TextEditingController cityController;

  GlobalErrorHandler globalErrorHandler;
  SharedPreferences prefs;
  NavigationService navigationService;

  RxBool isloading = false.obs;
  RxBool isObsecure = true.obs;

  AuthController({
    required this.globalErrorHandler,
    required this.navigationService,
    required this.prefs,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
  })  : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        nameController = TextEditingController(),
        referralController = TextEditingController(),
        phoneNumberController = TextEditingController(),
        codeController = TextEditingController(),
        cityController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    startTokenExpiryCheck();
  }

  void toggleObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  void checkTokenExpiry(String token) {
    int remainingTime = JwtDecoder.getRemainingTime(token).inSeconds;
    if (remainingTime > 0) {
      debugPrint('============= >  : Token expires in: $remainingTime seconds');
    } else {
      debugPrint('============= >  : Token has already expired');
      // Handle expired token (e.g., log the user out or refresh the token)
    }
  }

  void startTokenExpiryCheck() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('jwtToken');
      if (token != null) {
        checkTokenExpiry(token);
        if (isTokenExpired(token)) {
          logout();
        }
      }
    });
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');
    bool isLoggedIn = token != null && !isTokenExpired(token);
    prefs.setBool('isLoggedIn', isLoggedIn);
    if (!isLoggedIn) {
      logout();
    }
  }

  Future<void> login() async {
    // Check internet connection before proceeding
    bool isConnected = await GlobalErrorHandler.checkInternetConnection();
    debugPrint("==============> isConnected: $isConnected");
    if (!isConnected) {
      globalErrorHandler.showErrorSnackbar(
          'No internet connection. Please check your network.');
      return;
    }

    // Validate inputs (if needed)
    // if (formKey.currentState!.validate()) {
    debugPrint("==============> LOGIN");
    debugPrint("==============> Email: ${emailController.text}");
    debugPrint("==============> Password: ${passwordController.text}");
    // Call the login use case
    try {
      await loginUseCase(
        emailController.text.trim(),
        passwordController.text.trim(),
      ).then((results) {
        results.fold(
          (failure) {
            // Handle failure
            debugPrint("==============> Failure: ${failure.message}");
            globalErrorHandler.handleServerError(failure);
          },
          (response) {
            // Handle success
            debugPrint("==============> User: ${response.data.user}");
            debugPrint("========> Access Token: ${response.data.access_token}");
            debugPrint("==============> ${response.message}");

            // Save user data and token to SharedPreferences
            prefs.setString("user",
                jsonEncode(response.data.user)); // Encode user object to JSON
            prefs.setBool('isLoggedIn', true);
            prefs.setString('jwtToken', response.data.access_token);
            // clear the form
            formKey.currentState!.reset();
            // Navigate to the dashboard screen
            navigationService.replaceNamed(AppRouteConstants.dashboardScreen,
                extra: 0);
          },
        );
      });
    } on TimeoutException catch (e) {
      debugPrint("==============> Exception: ${e.toString()}");
      globalErrorHandler.handleError(TimeoutException);
    } on SocketException catch (e) {
      debugPrint("==============> SocketException: ${e.toString()}");
      globalErrorHandler.handleError(NoInternetException);
    } on NoInternetException catch (e) {
      debugPrint("==============> NoInternetException: ${e.toString()}");
      globalErrorHandler.handleError(NoInternetException);
    } catch (e) {
      debugPrint("==============> Exception: ${e.toString()}");
      globalErrorHandler.handleError('UnknownException');
    }
    // }
  }

  Future<void> register() async {
    // Check internet connection before proceeding
    bool isConnected = await GlobalErrorHandler.checkInternetConnection();
    if (!isConnected) {
      globalErrorHandler.showErrorSnackbar(
          'No internet connection. Please check your network.');
      return;
    }

    try {
      UserRegisterRequestModel newUser = UserRegisterRequestModel(
        email: emailController.text.trim(),
        password: "password123",
        profilePicture: "https://avatar.iran.liara.run/public",
        firstName: nameController.text.trim(),
        lastName: "rmili",
        phoneNumber: phoneNumberController.text.trim(),
      );
      await registerUseCase(newUser).then(
        (results) {
          results.fold((failure) {
            // Handle failure
            debugPrint("==============> message: ${failure.message}");
            debugPrint("==============> status code: ${failure.statusCode}");
            debugPrint("==============> error: ${failure.error}");

            globalErrorHandler.handleServerError(failure);
          }, (response) {
            navigationService.replaceNamed(AppRouteConstants.login, extra: 0);
          });
        },
      );
    } catch (e) {
      debugPrint("==============> Exception: ${e.toString()}");
      globalErrorHandler.handleError('UnknownException');
    }
  }

  Future<void> logout() async {
    // Check internet connection before proceeding
    bool isConnected = await GlobalErrorHandler.checkInternetConnection();
    if (!isConnected) {
      globalErrorHandler.showErrorSnackbar(
          'No internet connection. Please check your network.');
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the user object from SharedPreferences
    String? userObject = prefs.getString('user');
    if (userObject == null) {
      debugPrint("User data not found in SharedPreferences");
      return;
    }

    // Decode the user object
    Map<String, dynamic> user;
    try {
      user = jsonDecode(userObject);
    } catch (e) {
      debugPrint("Failed to decode user data: $e");
      return;
    }

    // Check if the user UUID exists
    String? userId = user['id'];
    if (userId == null) {
      debugPrint("User UUID not found in user data");
      return;
    }
    // Call the logout use case
    await logoutUseCase(userId).then((results) {
      results.fold(
        (failure) {
          // Handle failure
          debugPrint("Logout failed: ${failure.message}");
          globalErrorHandler.handleServerError(failure);
        },
        (response) {
          // Handle success
          prefs.setBool('isLoggedIn', false);
          prefs.remove('jwtToken');
          prefs.remove('user'); // Clear user data from SharedPreferences

          // Navigate to the login screen
          navigationService.goToNamed(AppRouteConstants.login);
          debugPrint("==============> ${response.message}");
        },
      );
    });
  }

  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
