import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapp/data/models/profile_response_model.dart';
import 'package:sportapp/domain/usecases/update_user_profile_use_case.dart';
import '../../core/global_error_handler/global_error_handler.dart';
import '../../domain/entites/update_user_entity.dart';
import '../../domain/usecases/get_user_profile_use_case.dart';

class UserController extends GetxController {
  RxBool isloading = false.obs;

  // error handling
  final GlobalErrorHandler globalErrorHandler;
  //  use cases
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;
  // text editing controllers
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController birthdayController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  // user data
  final Rx<UserProfileData?> _user = Rx<UserProfileData?>(null);
  UserProfileData? get user => _user.value;

  UserController({
    required this.updateUserProfileUseCase,
    required this.getUserProfileUseCase,
    required this.globalErrorHandler,
  })  : nameController = TextEditingController(),
        lastNameController = TextEditingController(),
        emailController = TextEditingController(),
        phoneNumberController = TextEditingController(),
        birthdayController = TextEditingController(),
        passwordController = TextEditingController(),
        confirmPasswordController = TextEditingController();
  // functions
  Future<void> getUserProfile() async {
    final result = await getUserProfileUseCase();
    result.fold(
      (failure) {
        globalErrorHandler.handleServerError(failure);
        // Fallback: Show a snackbar or dialog to the user
        Get.snackbar('Error', 'Failed to fetch user profile');
      },
      (response) {
        _user.value = response.data;
        debugPrint(
            '===============> User Profile Fetched Successfully ${_user.toJson()}');
        nameController.text = response.data.firstName;
        lastNameController.text = response.data.lastName;
        emailController.text = response.data.email;
        phoneNumberController.text = response.data.phoneNumber.toString();
        birthdayController.text =
            DateTime.parse(response.data.createdAt.toString())
                .toLocal()
                .toString();
        passwordController.text = '';
        confirmPasswordController.text = '';
        debugPrint(response.message);
        update(); // Notify listeners
      },
    );
  }

  Future<void> updateUser() async {
    isloading.value = true;
    final userdata = UpdateUserEntity(
      phoneNumber: phoneNumberController.text,
      firstName: nameController.text,
      lastName: lastNameController.text,
      jobTitle: 'Flutter Developer',
      experience: 'senior',
      profilePicture: 'https://avatar.iran.liara.run/public/job/police/female',
      gymCredit: 0,
      isBanned: false,
      referralAvailedCount: 0,
      credit: 0,
    );
    try {
      final result = await updateUserProfileUseCase(userdata);
      result.fold(
        (failure) {
          globalErrorHandler.handleServerError(failure);
        },
        (response) {
          _user.value = response.data;
          debugPrint('==>Profile Updated Successfully ${response.data}');
        },
      );
      await getUserProfile();
      isloading.value = false;
    } catch (e) {
      debugPrint('===============> Error updating user: $e');
      isloading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    birthdayController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
