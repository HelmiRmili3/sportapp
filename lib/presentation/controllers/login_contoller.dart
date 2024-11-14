import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/routes/route_names.dart';
import 'package:sportapp/domain/usecases/login_use_case.dart';

class LoginContoller extends GetxController {
  final LoginUseCase loginUseCase;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  LoginContoller({
    required this.loginUseCase,
  });

  RxBool isloading = false.obs;
  RxBool isObsecure = false.obs;
  final formKey = GlobalKey<FormState>();
  void toggleObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  Future<void> login(BuildContext context) async {
    // if (formKey.currentState!.validate()) {
    await loginUseCase(
      emailController.text.trim(),
      passwordController.text.trim(),
    ).then((results) => {
          results.fold(
            (l) => print(l.message),
            (r) => GoRouter.of(context).pushReplacementNamed(
              AppRouteConstants.dashboardScreen,
              extra: 0,
            ),
          )
        });
    // }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
