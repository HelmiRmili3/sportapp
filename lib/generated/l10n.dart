// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get greeting {
    return Intl.message(
      'Hello',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Counter`
  String get counterText {
    return Intl.message(
      'Counter',
      name: 'counterText',
      desc: '',
      args: [],
    );
  }

  /// `Consumer`
  String get consumerText {
    return Intl.message(
      'Consumer',
      name: 'consumerText',
      desc: '',
      args: [],
    );
  }

  /// `Selector`
  String get selectorText {
    return Intl.message(
      'Selector',
      name: 'selectorText',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `My Course`
  String get myCourse {
    return Intl.message(
      'My Course',
      name: 'myCourse',
      desc: '',
      args: [],
    );
  }

  /// `My Course`
  String get myPremium {
    return Intl.message(
      'My Course',
      name: 'myPremium',
      desc: '',
      args: [],
    );
  }

  /// `Saved Videos`
  String get savedVideos {
    return Intl.message(
      'Saved Videos',
      name: 'savedVideos',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout1 {
    return Intl.message(
      'Log Out',
      name: 'logout1',
      desc: '',
      args: [],
    );
  }

  /// `Abid Ullah Orakzai`
  String get abidUllahOrakzai {
    return Intl.message(
      'Abid Ullah Orakzai',
      name: 'abidUllahOrakzai',
      desc: '',
      args: [],
    );
  }

  /// `I want to try for free`
  String get iWantToTryForFree {
    return Intl.message(
      'I want to try for free',
      name: 'iWantToTryForFree',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription1 {
    return Intl.message(
      'Subscription',
      name: 'subscription1',
      desc: '',
      args: [],
    );
  }

  /// `Access to +132 Rooms in Tunisia`
  String get accessTo132RoomToTunisie {
    return Intl.message(
      'Access to +132 Rooms in Tunisia',
      name: 'accessTo132RoomToTunisie',
      desc: '',
      args: [],
    );
  }

  /// `Go wherever you want!`
  String get goWhereverYouWant {
    return Intl.message(
      'Go wherever you want!',
      name: 'goWhereverYouWant',
      desc: '',
      args: [],
    );
  }

  /// `Today fitness, tomorrow yoga... During the weekend the swimming pool. You choose!`
  String get todayFitnessEtc {
    return Intl.message(
      'Today fitness, tomorrow yoga... During the weekend the swimming pool. You choose!',
      name: 'todayFitnessEtc',
      desc: '',
      args: [],
    );
  }

  /// `Find gyms easily`
  String get finallyGymEasily {
    return Intl.message(
      'Find gyms easily',
      name: 'finallyGymEasily',
      desc: '',
      args: [],
    );
  }

  /// `Go to the gym closest to you!`
  String get goToTheGymNearYou {
    return Intl.message(
      'Go to the gym closest to you!',
      name: 'goToTheGymNearYou',
      desc: '',
      args: [],
    );
  }

  /// `Check-in & Workout`
  String get checkinWorkout {
    return Intl.message(
      'Check-in & Workout',
      name: 'checkinWorkout',
      desc: '',
      args: [],
    );
  }

  /// `You will just have to scan a QR code when you enter the gym`
  String get scanCodeWhenEnterTheGym {
    return Intl.message(
      'You will just have to scan a QR code when you enter the gym',
      name: 'scanCodeWhenEnterTheGym',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get yourEmail {
    return Intl.message(
      'Your email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Did you forget your password?`
  String get forgetPassword {
    return Intl.message(
      'Did you forget your password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue with email`
  String get continueWithEmail {
    return Intl.message(
      'Continue with email',
      name: 'continueWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Are you new?`
  String get areYouNew {
    return Intl.message(
      'Are you new?',
      name: 'areYouNew',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAnAccount {
    return Intl.message(
      'Create an account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue with phone`
  String get continueWithPhone {
    return Intl.message(
      'Continue with phone',
      name: 'continueWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Do you need help?`
  String get doYouNeedHelp {
    return Intl.message(
      'Do you need help?',
      name: 'doYouNeedHelp',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree`
  String get byContinueWithAgree {
    return Intl.message(
      'By continuing, you agree',
      name: 'byContinueWithAgree',
      desc: '',
      args: [],
    );
  }

  /// `terms of use and privacy policy`
  String get termOfUseAndPrivacyAndPolicy {
    return Intl.message(
      'terms of use and privacy policy',
      name: 'termOfUseAndPrivacyAndPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get proceed {
    return Intl.message(
      'Continue',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `Validate account`
  String get validateAccount {
    return Intl.message(
      'Validate account',
      name: 'validateAccount',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a verification code by SMS`
  String get youWillReceivedCode {
    return Intl.message(
      'You will receive a verification code by SMS',
      name: 'youWillReceivedCode',
      desc: '',
      args: [],
    );
  }

  /// `It appears that the phone number entered is not valid. Please enter a correct phone number.`
  String get validPhoneNumber {
    return Intl.message(
      'It appears that the phone number entered is not valid. Please enter a correct phone number.',
      name: 'validPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to secure your account, log in and personalize your news.`
  String get enterPhoneToSecureAccount {
    return Intl.message(
      'Enter your phone number to secure your account, log in and personalize your news.',
      name: 'enterPhoneToSecureAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code`
  String get enterTheVerificationCode {
    return Intl.message(
      'Enter the verification code',
      name: 'enterTheVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `A six-digit validation code was sent to the phone number ending with`
  String get sixDigitVerificationMessage {
    return Intl.message(
      'A six-digit validation code was sent to the phone number ending with',
      name: 'sixDigitVerificationMessage',
      desc: '',
      args: [],
    );
  }

  /// `If you don't receive a code within a few minutes`
  String get ifYouDontReceivedMessage {
    return Intl.message(
      'If you don\'t receive a code within a few minutes',
      name: 'ifYouDontReceivedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit the code again`
  String get submitCodeAgain {
    return Intl.message(
      'Submit the code again',
      name: 'submitCodeAgain',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password`
  String get forgetYourPassword {
    return Intl.message(
      'Forgot your password',
      name: 'forgetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered email where we will share a code to recover your account`
  String get enterYourEmailWhere {
    return Intl.message(
      'Enter your registered email where we will share a code to recover your account',
      name: 'enterYourEmailWhere',
      desc: '',
      args: [],
    );
  }

  /// `A four-digit validation code has been sent to your registered email address. If you have not received a code within a few minutes, resubmit the code.`
  String get fourDigitCodeShareWith {
    return Intl.message(
      'A four-digit validation code has been sent to your registered email address. If you have not received a code within a few minutes, resubmit the code.',
      name: 'fourDigitCodeShareWith',
      desc: '',
      args: [],
    );
  }

  /// `Update password`
  String get updatePassword {
    return Intl.message(
      'Update password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please add your new password here`
  String get addYourNewPasswordHere {
    return Intl.message(
      'Please add your new password here',
      name: 'addYourNewPasswordHere',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Choose the city`
  String get chooseCity {
    return Intl.message(
      'Choose the city',
      name: 'chooseCity',
      desc: '',
      args: [],
    );
  }

  /// `We need your location to show you the best sports centers near you.`
  String get weNeedYourLocationTo {
    return Intl.message(
      'We need your location to show you the best sports centers near you.',
      name: 'weNeedYourLocationTo',
      desc: '',
      args: [],
    );
  }

  /// `Facial recognition`
  String get faicialRecoginization {
    return Intl.message(
      'Facial recognition',
      name: 'faicialRecoginization',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get oops {
    return Intl.message(
      'Oops...',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get telephoneNumber {
    return Intl.message(
      'Phone number',
      name: 'telephoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `is already associated with an App account`
  String get alreadyAssociateToAccount {
    return Intl.message(
      'is already associated with an App account',
      name: 'alreadyAssociateToAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log in to your old account?`
  String get doYouWantToLoginWithOldAccount {
    return Intl.message(
      'Do you want to log in to your old account?',
      name: 'doYouWantToLoginWithOldAccount',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I want to log in to my old account`
  String get yesIWantToLoginMyAccount {
    return Intl.message(
      'Yes, I want to log in to my old account',
      name: 'yesIWantToLoginMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `I had the wrong phone number`
  String get iHadAWrongPhoneNumber {
    return Intl.message(
      'I had the wrong phone number',
      name: 'iHadAWrongPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your e-mail`
  String get enterYourEmail {
    return Intl.message(
      'Enter your e-mail',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree`
  String get byContinueYouAgree {
    return Intl.message(
      'By continuing, you agree',
      name: 'byContinueYouAgree',
      desc: '',
      args: [],
    );
  }

  /// `terms of use`
  String get termOfUse {
    return Intl.message(
      'terms of use',
      name: 'termOfUse',
      desc: '',
      args: [],
    );
  }

  /// `and consent to ESX sending you notifications by email and/or SMS. You can change how you receive notifications at any time in your account settings.`
  String get byConsentEXRSentNotificationEtc {
    return Intl.message(
      'and consent to ESX sending you notifications by email and/or SMS. You can change how you receive notifications at any time in your account settings.',
      name: 'byConsentEXRSentNotificationEtc',
      desc: '',
      args: [],
    );
  }

  /// `Thank You`
  String get thankYou {
    return Intl.message(
      'Thank You',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `Continue as guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `notifications of which you receive at any time in your account settings.`
  String get notificationReceivedOfWhichEtc {
    return Intl.message(
      'notifications of which you receive at any time in your account settings.',
      name: 'notificationReceivedOfWhichEtc',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfileButton {
    return Intl.message(
      'Edit Profile',
      name: 'editProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Your subscription`
  String get yourSubscription {
    return Intl.message(
      'Your subscription',
      name: 'yourSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Check-in history`
  String get checkInHistory {
    return Intl.message(
      'Check-in history',
      name: 'checkInHistory',
      desc: '',
      args: [],
    );
  }

  /// `Bonuses`
  String get bonus {
    return Intl.message(
      'Bonuses',
      name: 'bonus',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get logout {
    return Intl.message(
      'Sign out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Rate us`
  String get rateUs {
    return Intl.message(
      'Rate us',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get termCondition {
    return Intl.message(
      'Terms and conditions',
      name: 'termCondition',
      desc: '',
      args: [],
    );
  }

  /// `Confidentiality`
  String get confidentiality {
    return Intl.message(
      'Confidentiality',
      name: 'confidentiality',
      desc: '',
      args: [],
    );
  }

  /// `Try it for free for 7 days`
  String get tryItFor7Day {
    return Intl.message(
      'Try it for free for 7 days',
      name: 'tryItFor7Day',
      desc: '',
      args: [],
    );
  }

  /// `One subscription`
  String get oneSubscription {
    return Intl.message(
      'One subscription',
      name: 'oneSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Access to 132 rooms in Tunisia.`
  String get accessTo133Room {
    return Intl.message(
      'Access to 132 rooms in Tunisia.',
      name: 'accessTo133Room',
      desc: '',
      args: [],
    );
  }

  /// `Frequently asked Questions`
  String get frequentlyAskQuestion {
    return Intl.message(
      'Frequently asked Questions',
      name: 'frequentlyAskQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem`
  String get reportAProblem {
    return Intl.message(
      'Report a problem',
      name: 'reportAProblem',
      desc: '',
      args: [],
    );
  }

  /// `Select the department`
  String get selectDepartment {
    return Intl.message(
      'Select the department',
      name: 'selectDepartment',
      desc: '',
      args: [],
    );
  }

  /// `See the departments`
  String get seeDepartment {
    return Intl.message(
      'See the departments',
      name: 'seeDepartment',
      desc: '',
      args: [],
    );
  }

  /// `How can we contact you?`
  String get howWeCanContactYou {
    return Intl.message(
      'How can we contact you?',
      name: 'howWeCanContactYou',
      desc: '',
      args: [],
    );
  }

  /// `How can we help you?`
  String get howWeCanHelpYou {
    return Intl.message(
      'How can we help you?',
      name: 'howWeCanHelpYou',
      desc: '',
      args: [],
    );
  }

  /// `Describe the problem encountered`
  String get describeAProblem {
    return Intl.message(
      'Describe the problem encountered',
      name: 'describeAProblem',
      desc: '',
      args: [],
    );
  }

  /// `Answer to Question goes here`
  String get answerToQuestionGoesHere {
    return Intl.message(
      'Answer to Question goes here',
      name: 'answerToQuestionGoesHere',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `I cancel now`
  String get iCancelNow {
    return Intl.message(
      'I cancel now',
      name: 'iCancelNow',
      desc: '',
      args: [],
    );
  }

  /// `terminate at any time`
  String get terminateAtAnyTime {
    return Intl.message(
      'terminate at any time',
      name: 'terminateAtAnyTime',
      desc: '',
      args: [],
    );
  }

  /// `Pay now`
  String get payNow {
    return Intl.message(
      'Pay now',
      name: 'payNow',
      desc: '',
      args: [],
    );
  }

  /// `Gym Name`
  String get nameGyms {
    return Intl.message(
      'Gym Name',
      name: 'nameGyms',
      desc: '',
      args: [],
    );
  }

  /// `Gym Address`
  String get addressGyms {
    return Intl.message(
      'Gym Address',
      name: 'addressGyms',
      desc: '',
      args: [],
    );
  }

  /// `I am already a member`
  String get iAmAlreadyAMember {
    return Intl.message(
      'I am already a member',
      name: 'iAmAlreadyAMember',
      desc: '',
      args: [],
    );
  }

  /// `List of gyms in Sousse`
  String get listOfGymsSausse {
    return Intl.message(
      'List of gyms in Sousse',
      name: 'listOfGymsSausse',
      desc: '',
      args: [],
    );
  }

  /// `How can we contact you?`
  String get howCanWeContactYou {
    return Intl.message(
      'How can we contact you?',
      name: 'howCanWeContactYou',
      desc: '',
      args: [],
    );
  }

  /// `Email or phone number`
  String get emailOrPhoneNumber {
    return Intl.message(
      'Email or phone number',
      name: 'emailOrPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Did you find a problem?`
  String get didYouFindAProblem {
    return Intl.message(
      'Did you find a problem?',
      name: 'didYouFindAProblem',
      desc: '',
      args: [],
    );
  }

  /// `If yes, describe the problem encountered`
  String get ifYesDescribeTheProblem {
    return Intl.message(
      'If yes, describe the problem encountered',
      name: 'ifYesDescribeTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any suggestions for us?`
  String get doYouHaveAnySuggestionsForUs {
    return Intl.message(
      'Do you have any suggestions for us?',
      name: 'doYouHaveAnySuggestionsForUs',
      desc: '',
      args: [],
    );
  }

  /// `If yes, describe what we could improve`
  String get ifYesDescribeWhatWeCouldImprove {
    return Intl.message(
      'If yes, describe what we could improve',
      name: 'ifYesDescribeWhatWeCouldImprove',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Sorry`
  String get sorry {
    return Intl.message(
      'Sorry',
      name: 'sorry',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Pay in cash`
  String get payInCash {
    return Intl.message(
      'Pay in cash',
      name: 'payInCash',
      desc: '',
      args: [],
    );
  }

  /// `Pay online`
  String get payOnline {
    return Intl.message(
      'Pay online',
      name: 'payOnline',
      desc: '',
      args: [],
    );
  }

  /// `PREMIUM`
  String get premium {
    return Intl.message(
      'PREMIUM',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `It is paid monthly`
  String get itIsPaidMonthly {
    return Intl.message(
      'It is paid monthly',
      name: 'itIsPaidMonthly',
      desc: '',
      args: [],
    );
  }

  /// `10 day warranty`
  String get tenDayWarranty {
    return Intl.message(
      '10 day warranty',
      name: 'tenDayWarranty',
      desc: '',
      args: [],
    );
  }

  /// `Daily access for 30 days to 532 rooms in Tunisia`
  String get dailyAccessFor30DaysToToTunaisia {
    return Intl.message(
      'Daily access for 30 days to 532 rooms in Tunisia',
      name: 'dailyAccessFor30DaysToToTunaisia',
      desc: '',
      args: [],
    );
  }

  /// `Complete the connection`
  String get completeTheConnection {
    return Intl.message(
      'Complete the connection',
      name: 'completeTheConnection',
      desc: '',
      args: [],
    );
  }

  /// `Change your subscription`
  String get changeYourSubscription {
    return Intl.message(
      'Change your subscription',
      name: 'changeYourSubscription',
      desc: '',
      args: [],
    );
  }

  /// `It appears that you have not completed your connection.`
  String get itAppearThatUHaveNotCompletedYourConnection {
    return Intl.message(
      'It appears that you have not completed your connection.',
      name: 'itAppearThatUHaveNotCompletedYourConnection',
      desc: '',
      args: [],
    );
  }

  /// `I want to hold`
  String get iWantToHold {
    return Intl.message(
      'I want to hold',
      name: 'iWantToHold',
      desc: '',
      args: [],
    );
  }

  /// `How was your experience with the app?`
  String get howWasYourExperienceWithApp {
    return Intl.message(
      'How was your experience with the app?',
      name: 'howWasYourExperienceWithApp',
      desc: '',
      args: [],
    );
  }

  /// `All right`
  String get allRight {
    return Intl.message(
      'All right',
      name: 'allRight',
      desc: '',
      args: [],
    );
  }

  /// `How is our platform currently?`
  String get howIsOurPlatformCurrently {
    return Intl.message(
      'How is our platform currently?',
      name: 'howIsOurPlatformCurrently',
      desc: '',
      args: [],
    );
  }

  /// `Technical`
  String get technique {
    return Intl.message(
      'Technical',
      name: 'technique',
      desc: '',
      args: [],
    );
  }

  /// `Do you need a break?`
  String get doYouNeedBreak {
    return Intl.message(
      'Do you need a break?',
      name: 'doYouNeedBreak',
      desc: '',
      args: [],
    );
  }

  /// `Choose the option`
  String get chooseTheOption {
    return Intl.message(
      'Choose the option',
      name: 'chooseTheOption',
      desc: '',
      args: [],
    );
  }

  /// `for only 25 RON/month`
  String get forOnly25RontPerMonth {
    return Intl.message(
      'for only 25 RON/month',
      name: 'forOnly25RontPerMonth',
      desc: '',
      args: [],
    );
  }

  /// `You will have access to one month entry in one of the 477 rooms in Romania`
  String get youWillHaveAccessOfOneMonthEntry {
    return Intl.message(
      'You will have access to one month entry in one of the 477 rooms in Romania',
      name: 'youWillHaveAccessOfOneMonthEntry',
      desc: '',
      args: [],
    );
  }

  /// `Your current subscription will remain valid until 04/14/2024`
  String get yourCurrentSubRemainUntil {
    return Intl.message(
      'Your current subscription will remain valid until 04/14/2024',
      name: 'yourCurrentSubRemainUntil',
      desc: '',
      args: [],
    );
  }

  /// `You do not lose discounts received for completed referrals (they are lost if you cancel completely)`
  String get youDoNotLoseDiscountsReceivedFor {
    return Intl.message(
      'You do not lose discounts received for completed referrals (they are lost if you cancel completely)',
      name: 'youDoNotLoseDiscountsReceivedFor',
      desc: '',
      args: [],
    );
  }

  /// `Avoid paying the 200 lei reactivation fee (applies to those who cancel and reactivate)`
  String get avoidPayingThe200LeiReactivationFees {
    return Intl.message(
      'Avoid paying the 200 lei reactivation fee (applies to those who cancel and reactivate)',
      name: 'avoidPayingThe200LeiReactivationFees',
      desc: '',
      args: [],
    );
  }

  /// `When does the app subscription start?`
  String get whenDoesTheSubscriptionStart {
    return Intl.message(
      'When does the app subscription start?',
      name: 'whenDoesTheSubscriptionStart',
      desc: '',
      args: [],
    );
  }

  /// `What is auto-renewal?`
  String get whatIsAutoRenewal {
    return Intl.message(
      'What is auto-renewal?',
      name: 'whatIsAutoRenewal',
      desc: '',
      args: [],
    );
  }

  /// `Can I receive an invoice for subscription payment?`
  String get canIReceivedAnInv {
    return Intl.message(
      'Can I receive an invoice for subscription payment?',
      name: 'canIReceivedAnInv',
      desc: '',
      args: [],
    );
  }

  /// `Do you offer options to businesses?`
  String get doYouOfferOptionToBusiness {
    return Intl.message(
      'Do you offer options to businesses?',
      name: 'doYouOfferOptionToBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Can I cancel my subscription at any time?`
  String get canICancelMySubAtAnyTime {
    return Intl.message(
      'Can I cancel my subscription at any time?',
      name: 'canICancelMySubAtAnyTime',
      desc: '',
      args: [],
    );
  }

  /// `How can I modify my subscription?`
  String get howCanIModifyMySubscription {
    return Intl.message(
      'How can I modify my subscription?',
      name: 'howCanIModifyMySubscription',
      desc: '',
      args: [],
    );
  }

  /// `Our privacy policy also governs the use of the site (“www.App.tn”); please read the Privacy Policy carefully for important information about our privacy practices`
  String get ourPrivacyPolicyAlsoGovernsTheUse {
    return Intl.message(
      'Our privacy policy also governs the use of the site (“www.App.tn”); please read the Privacy Policy carefully for important information about our privacy practices',
      name: 'ourPrivacyPolicyAlsoGovernsTheUse',
      desc: '',
      args: [],
    );
  }

  /// `Share Your Invite Code`
  String get shareInviteCode {
    return Intl.message(
      'Share Your Invite Code',
      name: 'shareInviteCode',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get inviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `chat`
  String get chat {
    return Intl.message(
      'chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Email`
  String get enterEmail {
    return Intl.message(
      'Please enter Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get enterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Comment puis-je payer mon abonnement`
  String get howToPaySubscription {
    return Intl.message(
      'Comment puis-je payer mon abonnement',
      name: 'howToPaySubscription',
      desc: '',
      args: [],
    );
  }

  /// `Puis-je annuler mon paiement ?`
  String get cancelPayment {
    return Intl.message(
      'Puis-je annuler mon paiement ?',
      name: 'cancelPayment',
      desc: '',
      args: [],
    );
  }

  /// `Comment puis-je mettre à jour mes informations de paiement ?`
  String get updatePaymentInfo {
    return Intl.message(
      'Comment puis-je mettre à jour mes informations de paiement ?',
      name: 'updatePaymentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Notre politique de confidentialité régit également l'utilisation du site (« www.App.tn ») ; veuillez lire attentivement la politique de confidentialité pour obtenir des informations importantes sur nos pratiques de confidentialité`
  String get privacyPolicy {
    return Intl.message(
      'Notre politique de confidentialité régit également l\'utilisation du site (« www.App.tn ») ; veuillez lire attentivement la politique de confidentialité pour obtenir des informations importantes sur nos pratiques de confidentialité',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Comment fonctionne le scanner QR ?`
  String get qrScannerHowItWorks {
    return Intl.message(
      'Comment fonctionne le scanner QR ?',
      name: 'qrScannerHowItWorks',
      desc: '',
      args: [],
    );
  }

  /// `Comment puis-je contacter le service client ?`
  String get contactCustomerService {
    return Intl.message(
      'Comment puis-je contacter le service client ?',
      name: 'contactCustomerService',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get yearly {
    return Intl.message(
      'Yearly',
      name: 'yearly',
      desc: '',
      args: [],
    );
  }

  /// `450 free Video call minutes`
  String get freeVideoCallMinutes {
    return Intl.message(
      '450 free Video call minutes',
      name: 'freeVideoCallMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Coach`
  String get chatWithCoach {
    return Intl.message(
      'Chat with Coach',
      name: 'chatWithCoach',
      desc: '',
      args: [],
    );
  }

  /// `free Consultation`
  String get freeConsultation {
    return Intl.message(
      'free Consultation',
      name: 'freeConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Free Protein Shake daily`
  String get freeProteinShake {
    return Intl.message(
      'Free Protein Shake daily',
      name: 'freeProteinShake',
      desc: '',
      args: [],
    );
  }

  /// `Gym Details`
  String get gymDetails {
    return Intl.message(
      'Gym Details',
      name: 'gymDetails',
      desc: '',
      args: [],
    );
  }

  /// `233 Km`
  String get distance {
    return Intl.message(
      '233 Km',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Programs`
  String get programs {
    return Intl.message(
      'Programs',
      name: 'programs',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `8:00am to 12:00pm`
  String get workingHours {
    return Intl.message(
      '8:00am to 12:00pm',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get dayOff {
    return Intl.message(
      'Off',
      name: 'dayOff',
      desc: '',
      args: [],
    );
  }

  /// `Plans`
  String get plans {
    return Intl.message(
      'Plans',
      name: 'plans',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Destination Location`
  String get destinationLocation {
    return Intl.message(
      'Destination Location',
      name: 'destinationLocation',
      desc: '',
      args: [],
    );
  }

  /// `history`
  String get history {
    return Intl.message(
      'history',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Pro`
  String get pro {
    return Intl.message(
      'Pro',
      name: 'pro',
      desc: '',
      args: [],
    );
  }

  /// `Aptitude`
  String get aptitude {
    return Intl.message(
      'Aptitude',
      name: 'aptitude',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get cardio {
    return Intl.message(
      'Cardio',
      name: 'cardio',
      desc: '',
      args: [],
    );
  }

  /// `Aérobique`
  String get aerobics {
    return Intl.message(
      'Aérobique',
      name: 'aerobics',
      desc: '',
      args: [],
    );
  }

  /// `Cash Payment`
  String get cashPayment {
    return Intl.message(
      'Cash Payment',
      name: 'cashPayment',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterName {
    return Intl.message(
      'Enter your name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Enter your address`
  String get enterAddress {
    return Intl.message(
      'Enter your address',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Payment`
  String get confirmPayment {
    return Intl.message(
      'Confirm Payment',
      name: 'confirmPayment',
      desc: '',
      args: [],
    );
  }

  /// `Keep going`
  String get keepGoing {
    return Intl.message(
      'Keep going',
      name: 'keepGoing',
      desc: '',
      args: [],
    );
  }

  /// `You have 2 free entries valid for 7 days, then 30 TND / month`
  String get freeEntries {
    return Intl.message(
      'You have 2 free entries valid for 7 days, then 30 TND / month',
      name: 'freeEntries',
      desc: '',
      args: [],
    );
  }

  /// `Daily access for 30 days to 522 room`
  String get dailyAccess {
    return Intl.message(
      'Daily access for 30 days to 522 room',
      name: 'dailyAccess',
      desc: '',
      args: [],
    );
  }

  /// `10 day warranty`
  String get warranty {
    return Intl.message(
      '10 day warranty',
      name: 'warranty',
      desc: '',
      args: [],
    );
  }

  /// `interrupt anytime`
  String get interruptAnytime {
    return Intl.message(
      'interrupt anytime',
      name: 'interruptAnytime',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want`
  String get doYouReallyWant {
    return Intl.message(
      'Do you really want',
      name: 'doYouReallyWant',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited`
  String get unlimited {
    return Intl.message(
      'Unlimited',
      name: 'unlimited',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade ?`
  String get upgrade {
    return Intl.message(
      'Upgrade ?',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade unlimited access`
  String get upgradeUnlimited {
    return Intl.message(
      'Upgrade unlimited access',
      name: 'upgradeUnlimited',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade more +50 sports center`
  String get upgradeMore {
    return Intl.message(
      'Upgrade more +50 sports center',
      name: 'upgradeMore',
      desc: '',
      args: [],
    );
  }

  /// `Advantage`
  String get advantage {
    return Intl.message(
      'Advantage',
      name: 'advantage',
      desc: '',
      args: [],
    );
  }

  /// `Tout en 1`
  String get allInOne {
    return Intl.message(
      'Tout en 1',
      name: 'allInOne',
      desc: '',
      args: [],
    );
  }

  /// `Vous ne paierez qu'après les 7 jours ou 2 entrées`
  String get payAfterTrial {
    return Intl.message(
      'Vous ne paierez qu\'après les 7 jours ou 2 entrées',
      name: 'payAfterTrial',
      desc: '',
      args: [],
    );
  }

  /// `L'abonnement améliore votre santé (mentale ,physique et Esprit)`
  String get subscriptionImprovesHealth {
    return Intl.message(
      'L\'abonnement améliore votre santé (mentale ,physique et Esprit)',
      name: 'subscriptionImprovesHealth',
      desc: '',
      args: [],
    );
  }

  /// `Vous pouvez annuler à tout moment`
  String get cancelAnytime {
    return Intl.message(
      'Vous pouvez annuler à tout moment',
      name: 'cancelAnytime',
      desc: '',
      args: [],
    );
  }

  /// `Liste des entraîneurs`
  String get listOfCoaches {
    return Intl.message(
      'Liste des entraîneurs',
      name: 'listOfCoaches',
      desc: '',
      args: [],
    );
  }

  /// `Ville`
  String get city {
    return Intl.message(
      'Ville',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Coach`
  String get coach {
    return Intl.message(
      'Coach',
      name: 'coach',
      desc: '',
      args: [],
    );
  }

  /// `Coach Details`
  String get coachDetails {
    return Intl.message(
      'Coach Details',
      name: 'coachDetails',
      desc: '',
      args: [],
    );
  }

  /// `Tarif`
  String get rate {
    return Intl.message(
      'Tarif',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Availability`
  String get availability {
    return Intl.message(
      'Availability',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `Avis`
  String get reviews {
    return Intl.message(
      'Avis',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `rating`
  String get rating {
    return Intl.message(
      'rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Enter your review`
  String get enterReview {
    return Intl.message(
      'Enter your review',
      name: 'enterReview',
      desc: '',
      args: [],
    );
  }

  /// `Change Picture`
  String get changePicture {
    return Intl.message(
      'Change Picture',
      name: 'changePicture',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Date de Naissance`
  String get dateOfBirth {
    return Intl.message(
      'Date de Naissance',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `confirm Password`
  String get confirmPassword {
    return Intl.message(
      'confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Not subscribed !`
  String get notSubscribed {
    return Intl.message(
      'Not subscribed !',
      name: 'notSubscribed',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Accès autorisé`
  String get accessGranted {
    return Intl.message(
      'Accès autorisé',
      name: 'accessGranted',
      desc: '',
      args: [],
    );
  }

  /// `Votre session a été validée avec succès !`
  String get sessionValidated {
    return Intl.message(
      'Votre session a été validée avec succès !',
      name: 'sessionValidated',
      desc: '',
      args: [],
    );
  }

  /// `Accès refusé`
  String get accessDenied {
    return Intl.message(
      'Accès refusé',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `Votre session a expiré.`
  String get sessionExpired {
    return Intl.message(
      'Votre session a expiré.',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `time`
  String get time {
    return Intl.message(
      'time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Veuillez réessayer ultérieurement.`
  String get tryLater {
    return Intl.message(
      'Veuillez réessayer ultérieurement.',
      name: 'tryLater',
      desc: '',
      args: [],
    );
  }

  /// `Check In Deja Fait`
  String get checkInDone {
    return Intl.message(
      'Check In Deja Fait',
      name: 'checkInDone',
      desc: '',
      args: [],
    );
  }

  /// `See the rooms`
  String get seeRooms {
    return Intl.message(
      'See the rooms',
      name: 'seeRooms',
      desc: '',
      args: [],
    );
  }

  /// `after authentication scan qr code etc`
  String get afterAuthQR {
    return Intl.message(
      'after authentication scan qr code etc',
      name: 'afterAuthQR',
      desc: '',
      args: [],
    );
  }

  /// `Complete the authentication`
  String get completeAuth {
    return Intl.message(
      'Complete the authentication',
      name: 'completeAuth',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to the gym`
  String get doYouWantGym {
    return Intl.message(
      'Do you want to the gym',
      name: 'doYouWantGym',
      desc: '',
      args: [],
    );
  }

  /// `lantern`
  String get lantern {
    return Intl.message(
      'lantern',
      name: 'lantern',
      desc: '',
      args: [],
    );
  }

  /// `Please choose or write country`
  String get chooseOrWriteCountry {
    return Intl.message(
      'Please choose or write country',
      name: 'chooseOrWriteCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search City`
  String get searchCity {
    return Intl.message(
      'Search City',
      name: 'searchCity',
      desc: '',
      args: [],
    );
  }

  /// `Referral code`
  String get referralCode {
    return Intl.message(
      'Referral code',
      name: 'referralCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Commencer`
  String get start {
    return Intl.message(
      'Commencer',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Search Country`
  String get searchCountry {
    return Intl.message(
      'Search Country',
      name: 'searchCountry',
      desc: '',
      args: [],
    );
  }

  /// `Validation`
  String get validation {
    return Intl.message(
      'Validation',
      name: 'validation',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number for account security, authentication and personalization of news.`
  String get enterPhoneNumberSecurity {
    return Intl.message(
      'Enter your phone number for account security, authentication and personalization of news.',
      name: 'enterPhoneNumberSecurity',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a verification code via WhatsApp or SMS`
  String get receiveVerificationCode {
    return Intl.message(
      'You will receive a verification code via WhatsApp or SMS',
      name: 'receiveVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message(
      'Send Code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Veux-tu vraiment nous quitter ?`
  String get doYouReallyWantToLeave {
    return Intl.message(
      'Veux-tu vraiment nous quitter ?',
      name: 'doYouReallyWantToLeave',
      desc: '',
      args: [],
    );
  }

  /// `Past`
  String get past {
    return Intl.message(
      'Past',
      name: 'past',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `My Consultation`
  String get myConsultation {
    return Intl.message(
      'My Consultation',
      name: 'myConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Consultation`
  String get consultation {
    return Intl.message(
      'Consultation',
      name: 'consultation',
      desc: '',
      args: [],
    );
  }

  /// `Next slot available`
  String get nextSlotAvailable {
    return Intl.message(
      'Next slot available',
      name: 'nextSlotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning!`
  String get goodMorning {
    return Intl.message(
      'Good Morning!',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `No Past Record Found`
  String get noPastRecord {
    return Intl.message(
      'No Past Record Found',
      name: 'noPastRecord',
      desc: '',
      args: [],
    );
  }

  /// `Ask in 10 min`
  String get askIn10Min {
    return Intl.message(
      'Ask in 10 min',
      name: 'askIn10Min',
      desc: '',
      args: [],
    );
  }

  /// `save 200 TND per year`
  String get savePerYear {
    return Intl.message(
      'save 200 TND per year',
      name: 'savePerYear',
      desc: '',
      args: [],
    );
  }

  /// `Gift discount when you invite friend your next month`
  String get inviteDiscount {
    return Intl.message(
      'Gift discount when you invite friend your next month',
      name: 'inviteDiscount',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Please check your connection and try again.`
  String get checkConnection {
    return Intl.message(
      'Please check your connection and try again.',
      name: 'checkConnection',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Go ahead baby... go on`
  String get vasYBebeAllez {
    return Intl.message(
      'Go ahead baby... go on',
      name: 'vasYBebeAllez',
      desc: '',
      args: [],
    );
  }

  /// `to register`
  String get toRegister {
    return Intl.message(
      'to register',
      name: 'toRegister',
      desc: '',
      args: [],
    );
  }

  /// `Our most popular subscription`
  String get ourMostPopularSubscription {
    return Intl.message(
      'Our most popular subscription',
      name: 'ourMostPopularSubscription',
      desc: '',
      args: [],
    );
  }

  /// `My Appointments`
  String get myAppointments {
    return Intl.message(
      'My Appointments',
      name: 'myAppointments',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
