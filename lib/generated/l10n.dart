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

  /// `Your Email`
  String get yourEmail {
    return Intl.message(
      'Your Email',
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
