import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';

import '../login_screen/widgets/button.dart';
import '../login_screen/widgets/text_filed.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
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
    emailController.addListener(_updateFormState); // Step 4
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          S.of(context).forgetYourPassword,
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
                  S.of(context).enterYourEmailWhere,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    // fontFamily: 'ClashDisplay',
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
                AuthTextField(
                  controller: emailController,
                  hintText: S.of(context).yourEmail,
                  obsecure: false,
                  onChanged: (value) => _updateFormState(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    // Regular expression for email validation
                    final RegExp emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50.h),
                AuthButton(
                  fontcolor: _isValid
                      ? AppColors.black
                      : AppColors.black.withOpacity(.4),
                  text: S.of(context).proceed,
                  onTap: _isValid
                      ? () {
                          context.go(AppRouteConstants.otpforgot);
                        }
                      : () {},
                  backgroundcolor: _isValid
                      ? AppColors.seGreen
                      : AppColors.seGreen.withOpacity(.3),
                ),
                SizedBox(height: 20.h),
                Text(
                  S.of(context).youWillReceivedCode,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    // fontFamily: 'ClashDisplay',
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
