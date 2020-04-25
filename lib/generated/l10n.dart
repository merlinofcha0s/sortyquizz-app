// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get pageLoginBar {
    return Intl.message(
      'Login',
      name: 'pageLoginBar',
      desc: '',
      args: [],
    );
  }

  String get pageLoginTitle {
    return Intl.message(
      'Welcome to SortyQuizz',
      name: 'pageLoginTitle',
      desc: '',
      args: [],
    );
  }

  String get pageLoginLoginButton {
    return Intl.message(
      'Sign in',
      name: 'pageLoginLoginButton',
      desc: '',
      args: [],
    );
  }

  String get pageLoginRegisterButton {
    return Intl.message(
      'Register',
      name: 'pageLoginRegisterButton',
      desc: '',
      args: [],
    );
  }

  String get pageLoginErrorAuthentication {
    return Intl.message(
      'Problem when authenticate, verify your credential',
      name: 'pageLoginErrorAuthentication',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterTitle {
    return Intl.message(
      'Register',
      name: 'pageRegisterTitle',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormLogin {
    return Intl.message(
      'Login',
      name: 'pageRegisterFormLogin',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormEmail {
    return Intl.message(
      'Email',
      name: 'pageRegisterFormEmail',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormEmailHint {
    return Intl.message(
      'you@example.com',
      name: 'pageRegisterFormEmailHint',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormPassword {
    return Intl.message(
      'Password',
      name: 'pageRegisterFormPassword',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'pageRegisterFormConfirmPassword',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormTermsConditions {
    return Intl.message(
      'I accept the terms of use',
      name: 'pageRegisterFormTermsConditions',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormTermsConditionsNotChecked {
    return Intl.message(
      '\'Please accept the terms and conditions\'',
      name: 'pageRegisterFormTermsConditionsNotChecked',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterFormSubmit {
    return Intl.message(
      'Sign up',
      name: 'pageRegisterFormSubmit',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterErrorMailExist {
    return Intl.message(
      'Email already exist',
      name: 'pageRegisterErrorMailExist',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterErrorLoginExist {
    return Intl.message(
      'Login already taken',
      name: 'pageRegisterErrorLoginExist',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterErrorPasswordNotIdentical {
    return Intl.message(
      'The passwords are not identical',
      name: 'pageRegisterErrorPasswordNotIdentical',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterSuccessAltImg {
    return Intl.message(
      'Register success',
      name: 'pageRegisterSuccessAltImg',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterSuccess {
    return Intl.message(
      'Congratulation',
      name: 'pageRegisterSuccess',
      desc: '',
      args: [],
    );
  }

  String get pageRegisterSuccessSub {
    return Intl.message(
      'You have successfuly registered',
      name: 'pageRegisterSuccessSub',
      desc: '',
      args: [],
    );
  }

  String get pageMainProfileButton {
    return Intl.message(
      'Your profile',
      name: 'pageMainProfileButton',
      desc: '',
      args: [],
    );
  }

  String get pageMainEventButton {
    return Intl.message(
      'Event',
      name: 'pageMainEventButton',
      desc: '',
      args: [],
    );
  }

  String get pageMainOpenPackButton {
    return Intl.message(
      'Open pack',
      name: 'pageMainOpenPackButton',
      desc: '',
      args: [],
    );
  }

  String get pageMainNumberPackOpen {
    return Intl.message(
      'Packs',
      name: 'pageMainNumberPackOpen',
      desc: '',
      args: [],
    );
  }

  String get pageMainMarketButton {
    return Intl.message(
      'Marketplace',
      name: 'pageMainMarketButton',
      desc: '',
      args: [],
    );
  }

  String get pageOpenPackAppBar {
    return Intl.message(
      'Open pack',
      name: 'pageOpenPackAppBar',
      desc: '',
      args: [],
    );
  }

  String get pageOpenPackMyPacks {
    return Intl.message(
      'My packs',
      name: 'pageOpenPackMyPacks',
      desc: '',
      args: [],
    );
  }

  String get pageOpenPackFilter {
    return Intl.message(
      'Filter',
      name: 'pageOpenPackFilter',
      desc: '',
      args: [],
    );
  }

  String get pageOpenPackLife {
    return Intl.message(
      'life(s)',
      name: 'pageOpenPackLife',
      desc: '',
      args: [],
    );
  }

  String get pageOpenPackLevel {
    return Intl.message(
      'Level',
      name: 'pageOpenPackLevel',
      desc: '',
      args: [],
    );
  }

  String get pageOpenPackBuyPack {
    return Intl.message(
      'Buy a pack',
      name: 'pageOpenPackBuyPack',
      desc: '',
      args: [],
    );
  }

  String get pageQuizzStep1Lvl {
    return Intl.message(
      'lvl',
      name: 'pageQuizzStep1Lvl',
      desc: '',
      args: [],
    );
  }

  String get pageQuizzStep1QuestionTitle {
    return Intl.message(
      'Question',
      name: 'pageQuizzStep1QuestionTitle',
      desc: '',
      args: [],
    );
  }

  String get pageQuizzStep1QuestionTimer {
    return Intl.message(
      'Timer',
      name: 'pageQuizzStep1QuestionTimer',
      desc: '',
      args: [],
    );
  }

  String get pageQuizzStep1WonCard {
    return Intl.message(
      'Cards won',
      name: 'pageQuizzStep1WonCard',
      desc: '',
      args: [],
    );
  }

  String get pageQuizzStep1CurrentQuestion {
    return Intl.message(
      'Questions',
      name: 'pageQuizzStep1CurrentQuestion',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1TitleSucceed {
    return Intl.message(
      'Congratulations',
      name: 'pageFinishStep1TitleSucceed',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1TitleFail {
    return Intl.message(
      'You loose...',
      name: 'pageFinishStep1TitleFail',
      desc: '',
      args: [],
    );
  }

  String pageFinishStep1SubTitleSuccess(Object numberCardsWon) {
    return Intl.message(
      'You have win $numberCardsWon cards',
      name: 'pageFinishStep1SubTitleSuccess',
      desc: '',
      args: [numberCardsWon],
    );
  }

  String get pageFinishStep1SubTitleFail {
    return Intl.message(
      'You didn\'t get enough cards',
      name: 'pageFinishStep1SubTitleFail',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1UsedQuestion {
    return Intl.message(
      'Questions consumed',
      name: 'pageFinishStep1UsedQuestion',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1UsedTime {
    return Intl.message(
      'Time consumed',
      name: 'pageFinishStep1UsedTime',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1StartStep2 {
    return Intl.message(
      'Start sorting',
      name: 'pageFinishStep1StartStep2',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1RestartPackStep1 {
    return Intl.message(
      'Restart this pack',
      name: 'pageFinishStep1RestartPackStep1',
      desc: '',
      args: [],
    );
  }

  String pageFinishStep1ActionLifeLeft(Object numberOfLifeLeft) {
    return Intl.message(
      'You have $numberOfLifeLeft life(s) left',
      name: 'pageFinishStep1ActionLifeLeft',
      desc: '',
      args: [numberOfLifeLeft],
    );
  }

  String get pageFinishStep1AbortPack {
    return Intl.message(
      'Abort',
      name: 'pageFinishStep1AbortPack',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1AbortPackSubtitle {
    return Intl.message(
      'If you abort now you\'ll loose all the life left in the pack.',
      name: 'pageFinishStep1AbortPackSubtitle',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1ActionLooseWithoutLife {
    return Intl.message(
      'Buy a life for xx po',
      name: 'pageFinishStep1ActionLooseWithoutLife',
      desc: '',
      args: [],
    );
  }

  String get pageFinishStep1LooseWithoutLife {
    return Intl.message(
      'You don\'t have life left...',
      name: 'pageFinishStep1LooseWithoutLife',
      desc: '',
      args: [],
    );
  }

  String get pageSortCardValidate {
    return Intl.message(
      'Validate',
      name: 'pageSortCardValidate',
      desc: '',
      args: [],
    );
  }

  String get pageSortCardTimer {
    return Intl.message(
      'Timer',
      name: 'pageSortCardTimer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'), Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
