import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/connectivity_controller.dart';

import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/no_internet_connection.dart';
import '../../../utils/validators.dart';
import 'widgets/button.dart';
import 'widgets/text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure = true;
  final _formKey = GlobalKey<FormState>();

  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).logIn,
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
                AuthTextField(
                  controller: emailController,
                  hintText: S.of(context).yourEmail,
                  obsecure: false,
                  validator: (value) => Validators.validateEmail(value),
                ),
                SizedBox(height: 20.h),
                AuthTextField(
                  controller: passwordController,
                  hintText: S.of(context).enterPassword,
                  obsecure: obsecure,
                  validator: (value) => Validators.validatePassword(value),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obsecure = !obsecure;
                      });
                    },
                    child: Icon(
                      !obsecure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouteConstants.forgot);
                  },
                  child: Text(
                    S.of(context).forgetPassword,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                AuthButton(
                  fontcolor: AppColors.black,
                  text: S.of(context).logIn,
                  onTap: () {
                    if (connectivityController.isOfflineValue) {
                      showOfflineDialog(context);
                    } else if (_formKey.currentState!.validate()) {
                      GoRouter.of(context).pushReplacementNamed(
                        AppRouteConstants.dashboardScreen,
                        extra: 0,
                      );
                    } else {
                      setState(() {});
                    }
                  },
                  backgroundcolor: AppColors.seGreen,
                ),
                SizedBox(height: 30.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouteConstants.registration);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(context).areYouNew,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                          TextSpan(
                            text: " ${S.of(context).createAnAccount}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 150,
                        child: Divider(color: Theme.of(context).cardColor)),
                    const SizedBox(width: 5),
                    Text(
                      S.of(context).or,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall!.color),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                        width: 150,
                        child: Divider(color: Theme.of(context).cardColor)),
                  ],
                ),
                SizedBox(height: 50.h),
                AuthButton(
                  fontcolor: Theme.of(context).primaryColor,
                  text: S.of(context).continueWithPhone,
                  onTap: () {
                    GoRouter.of(context).push(AppRouteConstants.registration);
                  },
                  backgroundcolor: Theme.of(context).cardColor,
                ),
                SizedBox(height: 50.h),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouteConstants.forgot);
                  },
                  child: Center(
                    child: Text(
                      S.of(context).doYouNeedHelp,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: S.of(context).byContinueWithAgree,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      TextSpan(
                        text: " ${S.of(context).termOfUseAndPrivacyAndPolicy}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.seGreen,
                        ),
                      ),
                    ]),
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
