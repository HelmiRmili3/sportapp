import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pinput/pinput.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/app_colors.dart';
import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

// ignore: must_be_immutable
class OtpVerificationScreen extends StatefulWidget {
  String number;
  OtpVerificationScreen({
    super.key,
    required this.number,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool obsecure = true;
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  void _updateFormState() {
    debugPrint('on competed function called'); // Step 3
    setState(() {
      _isValid = _formKey.currentState?.validate() ?? false; // Step 5
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.number.isNotEmpty) {
      lastFourDigits = widget.number.substring(widget.number.length - 4);
      // print("Last four digits: $lastFourDigits");
    } else {
      // print("The string is empty.");
    }
    // print('here is number get rom previous screen ${widget.number}');
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  late Timer _timer;
  int _start = 45; // Timer duration in seconds
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String lastFourDigits = '';
  TextEditingController phoneController = TextEditingController();
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
                color: AppColors.seGreen),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            )),
          ),
        ),
        title: Text(
          S.of(context).enterTheVerificationCode,
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
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: S.of(context).sixDigitVerificationMessage,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      // fontFamily: 'ClashDisplay',
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  TextSpan(
                    text: ' $lastFourDigits.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      // fontFamily: 'ClashDisplay',
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  TextSpan(
                    text: S.of(context).ifYouDontReceivedMessage,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      // fontFamily: 'ClashDisplay',
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ])),
                SizedBox(height: 50.h),
                Pinput(
                  controller: phoneController,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).highlightColor,
                      ),
                    )),
                  ),
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    if (value == null) {
                      return 'Opt';
                    }

                    return null;
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                    if (pin.length >= 4) {
                      _updateFormState();
                    }
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: ${value.length}');
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
                          if (_formKey.currentState!.validate()) {
                            context.push(AppRouteConstants.registerEmail);
                          }
                        }
                      : () {},
                  backgroundcolor: _isValid
                      ? AppColors.seGreen
                      : AppColors.seGreen.withOpacity(.3),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    '00:${_start < 10 ? '0$_start' : _start}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      // fontFamily: 'ClashDisplay',
                      color: Theme.of(context).highlightColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: _start == 0
                      ? () {
                          _start = 45;
                          startTimer();
                          setState(() {});
                        }
                      : null,
                  child: Center(
                    child: Text(
                      S.of(context).submitCodeAgain,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        // fontFamily: 'ClashDisplay',
                        color: _start == 0
                            ? AppColors.seGreen
                            : AppColors.black.withOpacity(.4),
                      ),
                    ),
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
