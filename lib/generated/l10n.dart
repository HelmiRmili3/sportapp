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

  /// `Gym`
  String get gym {
    return Intl.message(
      'Gym',
      name: 'gym',
      desc: '',
      args: [],
    );
  }

  /// `Daily access for 30 days to 522 rooms`
  String get dailyAccess {
    return Intl.message(
      'Daily access for 30 days to 522 rooms',
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

  /// `Interrupt anytime`
  String get interruptAnytime {
    return Intl.message(
      'Interrupt anytime',
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

  /// `8 entries`
  String get eightEntries {
    return Intl.message(
      '8 entries',
      name: 'eightEntries',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade?`
  String get upgrade {
    return Intl.message(
      'Upgrade?',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade unlimited access`
  String get upgradeUnlimitedAccess {
    return Intl.message(
      'Upgrade unlimited access',
      name: 'upgradeUnlimitedAccess',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade more +50 sports centers`
  String get upgradeMore {
    return Intl.message(
      'Upgrade more +50 sports centers',
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

  /// `All in one`
  String get allInOne {
    return Intl.message(
      'All in one',
      name: 'allInOne',
      desc: '',
      args: [],
    );
  }

  /// `You will only pay after 7 days or 2 entries`
  String get youPayAfter7Days {
    return Intl.message(
      'You will only pay after 7 days or 2 entries',
      name: 'youPayAfter7Days',
      desc: '',
      args: [],
    );
  }

  /// `The subscription improves your health (mental, physical, and spirit)`
  String get subscriptionBenefits {
    return Intl.message(
      'The subscription improves your health (mental, physical, and spirit)',
      name: 'subscriptionBenefits',
      desc: '',
      args: [],
    );
  }

  /// `You can cancel at any time`
  String get cancelAnytime {
    return Intl.message(
      'You can cancel at any time',
      name: 'cancelAnytime',
      desc: '',
      args: [],
    );
  }

  /// `List of trainers`
  String get listOfTrainers {
    return Intl.message(
      'List of trainers',
      name: 'listOfTrainers',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
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

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
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

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
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

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
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

  /// `Not subscribed!`
  String get notSubscribed {
    return Intl.message(
      'Not subscribed!',
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

  /// `Access granted`
  String get accessGranted {
    return Intl.message(
      'Access granted',
      name: 'accessGranted',
      desc: '',
      args: [],
    );
  }

  /// `Your session has been successfully validated!`
  String get sessionValidated {
    return Intl.message(
      'Your session has been successfully validated!',
      name: 'sessionValidated',
      desc: '',
      args: [],
    );
  }

  /// `He gives the receptionist a high five and shows the screen.`
  String get highFiveReceptionist {
    return Intl.message(
      'He gives the receptionist a high five and shows the screen.',
      name: 'highFiveReceptionist',
      desc: '',
      args: [],
    );
  }

  /// `Go, baby... go!`
  String get goBaby {
    return Intl.message(
      'Go, baby... go!',
      name: 'goBaby',
      desc: '',
      args: [],
    );
  }

  /// `Access denied`
  String get accessDenied {
    return Intl.message(
      'Access denied',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired.`
  String get sessionExpired {
    return Intl.message(
      'Your session has expired.',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later.`
  String get tryLater {
    return Intl.message(
      'Please try again later.',
      name: 'tryLater',
      desc: '',
      args: [],
    );
  }

  /// `Check-In Already Done`
  String get checkInAlreadyDone {
    return Intl.message(
      'Check-In Already Done',
      name: 'checkInAlreadyDone',
      desc: '',
      args: [],
    );
  }

  /// `See the rooms`
  String get seeTheRooms {
    return Intl.message(
      'See the rooms',
      name: 'seeTheRooms',
      desc: '',
      args: [],
    );
  }

  /// `After authentication scan QR code etc.`
  String get afterAuthentication {
    return Intl.message(
      'After authentication scan QR code etc.',
      name: 'afterAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Complete the authentication`
  String get completeAuthentication {
    return Intl.message(
      'Complete the authentication',
      name: 'completeAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `To register`
  String get toRegister {
    return Intl.message(
      'To register',
      name: 'toRegister',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to the gym?`
  String get doYouWantGym {
    return Intl.message(
      'Do you want to the gym?',
      name: 'doYouWantGym',
      desc: '',
      args: [],
    );
  }

  /// `Lantern`
  String get lantern {
    return Intl.message(
      'Lantern',
      name: 'lantern',
      desc: '',
      args: [],
    );
  }

  /// `Please choose or write country`
  String get chooseCountry {
    return Intl.message(
      'Please choose or write country',
      name: 'chooseCountry',
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
  String get enterName {
    return Intl.message(
      'Please enter name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
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

  /// `Enter your phone number for account security, authentication, and personalization of news.`
  String get enterPhoneForSecurity {
    return Intl.message(
      'Enter your phone number for account security, authentication, and personalization of news.',
      name: 'enterPhoneForSecurity',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a verification code via WhatsApp or SMS`
  String get verificationCodeViaWhatsapp {
    return Intl.message(
      'You will receive a verification code via WhatsApp or SMS',
      name: 'verificationCodeViaWhatsapp',
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

  /// `Do you really want to leave us?`
  String get doYouReallyWantToLeave {
    return Intl.message(
      'Do you really want to leave us?',
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

  /// `No past record found`
  String get noPastRecordFound {
    return Intl.message(
      'No past record found',
      name: 'noPastRecordFound',
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

  /// `Save 200 TND per year`
  String get save200TNDPerYear {
    return Intl.message(
      'Save 200 TND per year',
      name: 'save200TNDPerYear',
      desc: '',
      args: [],
    );
  }

  /// `Gift discount when you invite a friend for your next month`
  String get giftDiscountNextMonth {
    return Intl.message(
      'Gift discount when you invite a friend for your next month',
      name: 'giftDiscountNextMonth',
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
  String get pleaseCheckYourConnection {
    return Intl.message(
      'Please check your connection and try again.',
      name: 'pleaseCheckYourConnection',
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
