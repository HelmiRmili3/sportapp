import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';

import '../login_screen/widgets/button.dart';
import '../login_screen/widgets/text_filed.dart';

class RegistrationEmailScreen extends StatefulWidget {
  const RegistrationEmailScreen({super.key});

  @override
  State<RegistrationEmailScreen> createState() =>
      _RegistrationEmailScreenState();
}

class _RegistrationEmailScreenState extends State<RegistrationEmailScreen> {
  bool obsecure = true;
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  void _updateFormState() {
    setState(() {
      _isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateFormState);
  }

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
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
                color: AppColors.seGreen),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            )),
          ),
        ),
        title: Text(
          S.of(context).enterYourEmail,
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
                  onChanged: (value) => _updateFormState(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
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
                  text: 'Continuer avec l\'e-mail',
                  onTap: _isValid
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            context.push(AppRouteConstants.faceRecognization1);
                          }
                        }
                      : () {},
                  backgroundcolor: _isValid
                      ? AppColors.seGreen
                      : AppColors.seGreen.withOpacity(.3),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: S.of(context).byContinueYouAgree,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      TextSpan(
                        text: " ${S.of(context).termOfUse}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.seGreen),
                      ),
                      TextSpan(
                        text:
                            ' ${S.of(context).byConsentEXRSentNotificationEtc}',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
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
