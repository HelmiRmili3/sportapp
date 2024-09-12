import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:sportapp/core/app_colors.dart';

import '../../../core/routes/route_names.dart';
import '../../../generated/l10n.dart';
import '../login_screen/widgets/button.dart';

class ValidateAccount extends StatefulWidget {
  const ValidateAccount({super.key});

  @override
  State<ValidateAccount> createState() => _ValidateAccountState();
}

class _ValidateAccountState extends State<ValidateAccount> {
  bool obsecure = true;
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  void _updateFormState() {
    setState(() {
      _isValid = _formKey.currentState?.validate() ?? false; // Step 5
    });
  }

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
              color: AppColors.seGreen,
            ),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            )),
          ),
        ),
        title: Text(
          S.of(context).validateAccount,
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
                  S.of(context).enterPhoneToSecureAccount,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
                IntlPhoneField(
                  controller: phoneController,
                  showCountryFlag: false,
                  showDropdownIcon: false,
                  initialCountryCode: 'TN',
                  onChanged: (value) {
                    _updateFormState();
                  },
                  validator: (value) {
                    if (value == null || value.number.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  pickerDialogStyle: PickerDialogStyle(
                    searchFieldCursorColor: Colors.black,
                    backgroundColor: Colors.white,
                    countryCodeStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    countryNameStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    searchFieldInputDecoration: const InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      counterStyle: TextStyle(
                        color: Colors.white,
                      ),
                      helperStyle: TextStyle(
                        color: Colors.black,
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                      suffixIconColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintText: 'Search Country',
                      hintMaxLines: 1,
                      isDense: true,
                    ),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.seGreen),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).highlightColor),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  showCursor: true,
                  disableLengthCheck: false,
                  dropdownDecoration:
                      const BoxDecoration(color: Colors.transparent),
                  dropdownTextStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  invalidNumberMessage: S.of(context).validPhoneNumber,
                  dropdownIconPosition: IconPosition.trailing,
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
                            if (phoneController.text == '3111457646') {
                              GoRouter.of(context).push(
                                  AppRouteConstants.phoneNoAlreadyR,
                                  extra: phoneController.text);
                            } else {
                              GoRouter.of(context).push(
                                  AppRouteConstants.otpverification,
                                  extra: phoneController.text);
                            }
                          }
                        }
                      : () {
                          // print('else validate ${phoneController.text}');
                        },
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
