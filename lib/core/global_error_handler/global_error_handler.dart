import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../data/models/failure_response_model.dart';

class GlobalErrorHandler {
  void handleError(dynamic error) {
    // Handle different types of errors
    if (error is NoInternetException) {
      showErrorSnackbar('No internet connection. Please check your network.');
    } else if (error is TimeoutException) {
      showErrorSnackbar('Request timed out. Please try again.');
    } else if (error is FormatException) {
      showErrorSnackbar('Invalid data format. Please try again.');
    } else if (error is UnauthorizedException) {
      showErrorSnackbar('Unauthorized access. Email or password is incorrect.');
    } else {
      showErrorSnackbar('Something went wrong. Please try again.');
    }
  }

  void handleServerError(FailureResponse error) {
    showErrorSnackbar(error.message);
    // Handle different types of errors
    // if (error.statusCode == 401) {
    //   showErrorSnackbar('Unauthorized access. Email or password is incorrect.');
    // } else if (error.statusCode == 404) {
    //   showErrorSnackbar('Resource not found. Please try again.');
    // } else if (error.statusCode == 500) {
    //   showErrorSnackbar('Internal server error. Please try again later.');
    // } else {
    //   showErrorSnackbar('Something went wrong. Please try again.');
    // }
  }

  void showErrorSnackbar(dynamic message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG, // Longer duration
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      timeInSecForIosWeb: 5, // Adjust duration for iOS/web
      webShowClose: true, // Show close button on web
      webBgColor:
          "linear-gradient(to right, #ff0000, #cc0000)", // Custom background for web
    );
  }

  static Future<bool> checkInternetConnection() async {
    // Check connectivity and handle the case where it returns a list
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    // If any of the results is not "none", there is an active connection
    return connectivityResult
        .any((result) => result != ConnectivityResult.none);
  }
}

// Custom exceptions
class NoInternetException implements Exception {
  final String message;
  NoInternetException(this.message);
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}
