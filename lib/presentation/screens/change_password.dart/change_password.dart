import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';

import '../login_screen/widgets/button.dart';
import '../login_screen/widgets/text_filed.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();

  void _updateFormState() {
    // Step 3
    setState(() {
      _isValid = _formKey.currentState?.validate() ?? false; // Step 5
    });
  }

  @override
  void initState() {
    super.initState();
    password.addListener(_updateFormState); // Step 4
    confirmPassword.addListener(_updateFormState); // Step 4
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            context.go(AppRouteConstants.login);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.seGreen),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            )),
          ),
        ),
        title: Text(
          S.of(context).updatePassword,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),
                Text(
                  S.of(context).addYourNewPasswordHere,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    // fontFamily: 'ClashDisplay',
                    color: AppColors.black,
                  ),
                ),
                AuthTextField(
                  controller: password,
                  hintText: S.of(context).newPassword,
                  obsecure: false,
                  onChanged: (value) => _updateFormState(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }

                    // Minimum length requirement (adjust as needed)
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                    bool hasNumber = value.contains(RegExp(r'[0-9]'));

                    if (!hasUppercase || !hasLowercase || !hasNumber) {
                      return 'Password must contain uppercase, lowercase, numbers, and special characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50.h),
                AuthTextField(
                  controller: confirmPassword,
                  hintText: S.of(context).confirmNewPassword,
                  obsecure: false,
                  onChanged: (value) => _updateFormState(),
                  validator: (value) {
                    if (password.text != confirmPassword.text) {
                      return 'Passwords don\'t match'; // Concise and direct message
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50.h),
                AuthButton(
                  fontcolor: _isValid
                      ? AppColors.black
                      : AppColors.black.withOpacity(.4),
                  text: S.of(context).submit,
                  onTap: _isValid
                      ? () {
                          context.go(AppRouteConstants.login);
                        }
                      : () {},
                  backgroundcolor: _isValid
                      ? AppColors.seGreen
                      : AppColors.seGreen.withOpacity(.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
