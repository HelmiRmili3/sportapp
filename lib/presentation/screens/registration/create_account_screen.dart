import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/auth_controller.dart';

import '../../../core/dependency_injection/service_locator.dart';
import '../../../core/routes/route_names.dart';

import '../login_screen/widgets/button.dart';
import '../login_screen/widgets/text_filed.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool obsecure = true;
  bool _isValid = true;
  final _formKey = GlobalKey<FormState>();

  // void _updateFormState() {
  //   setState(() {
  //     _isValid = _formKey.currentState?.validate() ?? false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   emailController.addListener(_updateFormState);
  //   passwordController.addListener(_updateFormState);
  //   referralCodeController.addListener(_updateFormState);
  // }

  // TextEditingController passwordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.seGreen,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          ),
        ),
        title: Text(
          S.of(context).createAnAccount,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              AuthTextField(
                controller: sl<AuthController>().nameController,
                hintText: S.of(context).enterYourName,
                obsecure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              TextFormField(
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color),
                controller: sl<AuthController>().referralController,
                decoration: InputDecoration(
                  hintText: "Referral code",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.seGreen,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).highlightColor),
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 10),
                ),
                cursorColor: AppColors.seGreen,
                obscureText: false,
              ),
              SizedBox(height: 50.h),
              AuthButton(
                fontcolor: _isValid
                    ? AppColors.black
                    : AppColors.black.withOpacity(.4),
                text: S.of(context).proceed,
                onTap: () {
                  GoRouter.of(context).push(AppRouteConstants.validateAccount);
                },
                backgroundcolor: _isValid
                    ? AppColors.seGreen
                    : AppColors.seGreen.withOpacity(.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
