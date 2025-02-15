// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(numberOfLifeLeft) => "You have ${numberOfLifeLeft} life(s) left";

  static m1(numberCardsWon) => "You have win ${numberCardsWon} cards";

  static m2(rank) => "You are ${rank}st on this pack";

  static m3(numberlifeUsed) => "Number of life used : ${numberlifeUsed}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "pageFinishStep1AbortPack" : MessageLookupByLibrary.simpleMessage("Abort"),
    "pageFinishStep1AbortPackSubtitle" : MessageLookupByLibrary.simpleMessage("If you abort now you\'ll loose all the life left in the pack."),
    "pageFinishStep1ActionLifeLeft" : m0,
    "pageFinishStep1ActionLooseWithoutLife" : MessageLookupByLibrary.simpleMessage("Buy a life for xx po"),
    "pageFinishStep1LooseWithoutLife" : MessageLookupByLibrary.simpleMessage("You don\'t have life left..."),
    "pageFinishStep1RestartPackStep1" : MessageLookupByLibrary.simpleMessage("Restart this pack"),
    "pageFinishStep1StartStep2" : MessageLookupByLibrary.simpleMessage("Start sorting"),
    "pageFinishStep1SubTitleFail" : MessageLookupByLibrary.simpleMessage("You didn\'t get enough cards"),
    "pageFinishStep1SubTitleSuccess" : m1,
    "pageFinishStep1TitleFail" : MessageLookupByLibrary.simpleMessage("You loose..."),
    "pageFinishStep1TitleSucceed" : MessageLookupByLibrary.simpleMessage("Congratulations"),
    "pageFinishStep1UsedQuestion" : MessageLookupByLibrary.simpleMessage("Questions consumed"),
    "pageFinishStep1UsedTime" : MessageLookupByLibrary.simpleMessage("Time consumed"),
    "pageFinishStep2Rank" : m2,
    "pageFinishStep2StepQuizzTitle" : MessageLookupByLibrary.simpleMessage("Quizz step"),
    "pageFinishStep2StepSortNumberOfCards" : MessageLookupByLibrary.simpleMessage("Number of cards"),
    "pageFinishStep2StepSortTime" : MessageLookupByLibrary.simpleMessage("Time"),
    "pageFinishStep2StepSortTitle" : MessageLookupByLibrary.simpleMessage("Sorting step"),
    "pageFinishStep2SubTitleFail" : MessageLookupByLibrary.simpleMessage("Your sorting is incorrect"),
    "pageFinishStep2SubTitleLifeUsedSuccess" : m3,
    "pageFinishStep2SubTitleSuccess" : MessageLookupByLibrary.simpleMessage("Your final score is"),
    "pageFinishStep2TitleFail" : MessageLookupByLibrary.simpleMessage("Fail"),
    "pageFinishStep2TitleSuccess" : MessageLookupByLibrary.simpleMessage("Congratulations"),
    "pageFinishStep2WinXP" : MessageLookupByLibrary.simpleMessage("You win"),
    "pageLoginBar" : MessageLookupByLibrary.simpleMessage("Login"),
    "pageLoginErrorAuthentication" : MessageLookupByLibrary.simpleMessage("Problem when authenticate, verify your credential"),
    "pageLoginLoginButton" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "pageLoginRegisterButton" : MessageLookupByLibrary.simpleMessage("Register"),
    "pageLoginTitle" : MessageLookupByLibrary.simpleMessage("Welcome to SortyQuizz"),
    "pageMainEventButton" : MessageLookupByLibrary.simpleMessage("Event"),
    "pageMainMarketButton" : MessageLookupByLibrary.simpleMessage("Marketplace"),
    "pageMainNumberPackOpen" : MessageLookupByLibrary.simpleMessage("Packs"),
    "pageMainOpenPackButton" : MessageLookupByLibrary.simpleMessage("Open pack"),
    "pageMainProfileButton" : MessageLookupByLibrary.simpleMessage("Your profile"),
    "pageOpenPackAppBar" : MessageLookupByLibrary.simpleMessage("Open pack"),
    "pageOpenPackBuyPack" : MessageLookupByLibrary.simpleMessage("Buy a pack"),
    "pageOpenPackFilter" : MessageLookupByLibrary.simpleMessage("Filter"),
    "pageOpenPackLevel" : MessageLookupByLibrary.simpleMessage("Level"),
    "pageOpenPackLife" : MessageLookupByLibrary.simpleMessage("life(s)"),
    "pageOpenPackMyPacks" : MessageLookupByLibrary.simpleMessage("My packs"),
    "pageQuizzStep1CurrentQuestion" : MessageLookupByLibrary.simpleMessage("Questions"),
    "pageQuizzStep1Lvl" : MessageLookupByLibrary.simpleMessage("lvl"),
    "pageQuizzStep1QuestionTimer" : MessageLookupByLibrary.simpleMessage("Timer"),
    "pageQuizzStep1QuestionTitle" : MessageLookupByLibrary.simpleMessage("Question"),
    "pageQuizzStep1WonCard" : MessageLookupByLibrary.simpleMessage("Cards won"),
    "pageRegisterErrorLoginExist" : MessageLookupByLibrary.simpleMessage("Login already taken"),
    "pageRegisterErrorMailExist" : MessageLookupByLibrary.simpleMessage("Email already exist"),
    "pageRegisterErrorPasswordNotIdentical" : MessageLookupByLibrary.simpleMessage("The passwords are not identical"),
    "pageRegisterFormConfirmPassword" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "pageRegisterFormEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageRegisterFormEmailHint" : MessageLookupByLibrary.simpleMessage("you@example.com"),
    "pageRegisterFormLogin" : MessageLookupByLibrary.simpleMessage("Login"),
    "pageRegisterFormPassword" : MessageLookupByLibrary.simpleMessage("Password"),
    "pageRegisterFormSubmit" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "pageRegisterFormTermsConditions" : MessageLookupByLibrary.simpleMessage("I accept the terms of use"),
    "pageRegisterFormTermsConditionsNotChecked" : MessageLookupByLibrary.simpleMessage("\'Please accept the terms and conditions\'"),
    "pageRegisterSuccess" : MessageLookupByLibrary.simpleMessage("Congratulation"),
    "pageRegisterSuccessAltImg" : MessageLookupByLibrary.simpleMessage("Register success"),
    "pageRegisterSuccessSub" : MessageLookupByLibrary.simpleMessage("You have successfuly registered"),
    "pageRegisterTitle" : MessageLookupByLibrary.simpleMessage("Register"),
    "pageSortCardTimer" : MessageLookupByLibrary.simpleMessage("Timer"),
    "pageSortCardValidate" : MessageLookupByLibrary.simpleMessage("Validate")
  };
}
