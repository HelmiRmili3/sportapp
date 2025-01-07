import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sportapp/data/models/coaches_response_model.dart';

import '../../core/global_error_handler/global_error_handler.dart';
import '../../domain/usecases/get_all_coachs_use_case.dart';

class CoachesController {
  final GlobalErrorHandler globalErrorHandler;
  final GetAllCoachsUseCase getAllCoachsUseCase;

  final RxList<Coach> _coaches = RxList<Coach>();
  List<Coach> get coaches => _coaches;
  // Constructor

  CoachesController(
    this.globalErrorHandler,
    this.getAllCoachsUseCase,
  );
  Future<void> getAllCoachs() async {
    bool isConnected = await globalErrorHandler.checkInternetConnection();
    debugPrint("==============> isConnected: $isConnected");
    if (!isConnected) {
      globalErrorHandler.showErrorSnackbar(
          'No internet connection. Please check your network.');
      return;
    }
    try {
      final result = await getAllCoachsUseCase();
      result.fold(
        (failure) {
          // Handle failure
          globalErrorHandler.handleServerError(failure);
        },
        (response) {
          // Handle success
          _coaches.value = response.data;
          debugPrint('====> Coaches Fetched  ${response.data.first.toJson()}');
        },
      );
    } catch (e) {}
  }
}
