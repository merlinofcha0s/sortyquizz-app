// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(numberOfLifeLeft) => "Il vous reste ${numberOfLifeLeft} vie(s)";

  static m1(numberCardsWon) => "Vous avez gagné les ${numberCardsWon} cartes à classer";

  static m2(rank) => "Vous êtes ${rank}er au classement";

  static m3(numberlifeUsed) => "Nombre de vie(s) utilisée(s) : ${numberlifeUsed}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "pageFinishStep1AbortPack" : MessageLookupByLibrary.simpleMessage("Abandonner"),
    "pageFinishStep1AbortPackSubtitle" : MessageLookupByLibrary.simpleMessage("Attention si vous abandonnez maintenant, vous perdrez toutes vos vies du pack."),
    "pageFinishStep1ActionLifeLeft" : m0,
    "pageFinishStep1ActionLooseWithoutLife" : MessageLookupByLibrary.simpleMessage("Acheter une vie pour xx po"),
    "pageFinishStep1LooseWithoutLife" : MessageLookupByLibrary.simpleMessage("Vous n\'avez plus de vie..."),
    "pageFinishStep1RestartPackStep1" : MessageLookupByLibrary.simpleMessage("Recommencer ce pack"),
    "pageFinishStep1StartStep2" : MessageLookupByLibrary.simpleMessage(" Démarrer le classement"),
    "pageFinishStep1SubTitleFail" : MessageLookupByLibrary.simpleMessage("Vous n\'avez pas récupéré assez de carte pour continuer"),
    "pageFinishStep1SubTitleSuccess" : m1,
    "pageFinishStep1TitleFail" : MessageLookupByLibrary.simpleMessage("Perdu..."),
    "pageFinishStep1TitleSucceed" : MessageLookupByLibrary.simpleMessage("Félicitations"),
    "pageFinishStep1UsedQuestion" : MessageLookupByLibrary.simpleMessage("Questions utilisées"),
    "pageFinishStep1UsedTime" : MessageLookupByLibrary.simpleMessage("Temps passé"),
    "pageFinishStep2Rank" : m2,
    "pageFinishStep2StepQuizzTitle" : MessageLookupByLibrary.simpleMessage("Etape quizz"),
    "pageFinishStep2StepSortNumberOfCards" : MessageLookupByLibrary.simpleMessage("Nombre de cartes"),
    "pageFinishStep2StepSortTime" : MessageLookupByLibrary.simpleMessage("Temps"),
    "pageFinishStep2StepSortTitle" : MessageLookupByLibrary.simpleMessage("Etape classement"),
    "pageFinishStep2SubTitleFail" : MessageLookupByLibrary.simpleMessage("Votre classement est incorrect"),
    "pageFinishStep2SubTitleLifeUsedSuccess" : m3,
    "pageFinishStep2SubTitleSuccess" : MessageLookupByLibrary.simpleMessage("Votre score final est"),
    "pageFinishStep2TitleFail" : MessageLookupByLibrary.simpleMessage("Perdu"),
    "pageFinishStep2TitleSuccess" : MessageLookupByLibrary.simpleMessage("Félicitations"),
    "pageFinishStep2WinXP" : MessageLookupByLibrary.simpleMessage("Vous gagnez"),
    "pageLoginBar" : MessageLookupByLibrary.simpleMessage("Se connecter"),
    "pageLoginErrorAuthentication" : MessageLookupByLibrary.simpleMessage("Un problème est survenu, veuillez vérifier vos identifiants"),
    "pageLoginLoginButton" : MessageLookupByLibrary.simpleMessage("S\'identifier"),
    "pageLoginRegisterButton" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "pageLoginTitle" : MessageLookupByLibrary.simpleMessage("Bienvenue sur SortyQuizz"),
    "pageMainEventButton" : MessageLookupByLibrary.simpleMessage("Evénement"),
    "pageMainMarketButton" : MessageLookupByLibrary.simpleMessage("Boutique"),
    "pageMainNumberPackOpen" : MessageLookupByLibrary.simpleMessage("packs"),
    "pageMainOpenPackButton" : MessageLookupByLibrary.simpleMessage("Ouvrir un pack"),
    "pageMainProfileButton" : MessageLookupByLibrary.simpleMessage("Résumé du profil"),
    "pageOpenPackAppBar" : MessageLookupByLibrary.simpleMessage("Ouvrir un pack"),
    "pageOpenPackBuyPack" : MessageLookupByLibrary.simpleMessage("Acheter un pack"),
    "pageOpenPackFilter" : MessageLookupByLibrary.simpleMessage("Filtre"),
    "pageOpenPackLevel" : MessageLookupByLibrary.simpleMessage("Niveau"),
    "pageOpenPackLife" : MessageLookupByLibrary.simpleMessage("vie(s)"),
    "pageOpenPackMyPacks" : MessageLookupByLibrary.simpleMessage("Mes packs"),
    "pageQuizzStep1CurrentQuestion" : MessageLookupByLibrary.simpleMessage("Questions"),
    "pageQuizzStep1Lvl" : MessageLookupByLibrary.simpleMessage("niv"),
    "pageQuizzStep1QuestionTimer" : MessageLookupByLibrary.simpleMessage("Minuteur"),
    "pageQuizzStep1QuestionTitle" : MessageLookupByLibrary.simpleMessage("Question"),
    "pageQuizzStep1WonCard" : MessageLookupByLibrary.simpleMessage("Cartes gagnées"),
    "pageRegisterErrorLoginExist" : MessageLookupByLibrary.simpleMessage("Cet identifiant est déjà pris"),
    "pageRegisterErrorMailExist" : MessageLookupByLibrary.simpleMessage("Cette adresse existe déjà"),
    "pageRegisterErrorPasswordNotIdentical" : MessageLookupByLibrary.simpleMessage("Les mots de passe ne sont pas identiques"),
    "pageRegisterFormConfirmPassword" : MessageLookupByLibrary.simpleMessage("Confirmer le mot de passe"),
    "pageRegisterFormEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageRegisterFormEmailHint" : MessageLookupByLibrary.simpleMessage("you@exemple.com"),
    "pageRegisterFormLogin" : MessageLookupByLibrary.simpleMessage("Login"),
    "pageRegisterFormPassword" : MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "pageRegisterFormSubmit" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "pageRegisterFormTermsConditions" : MessageLookupByLibrary.simpleMessage("J\'accepte les conditions générales d\'utilisations"),
    "pageRegisterFormTermsConditionsNotChecked" : MessageLookupByLibrary.simpleMessage("Merci d\'accepter les conditions générales d\'utilisations"),
    "pageRegisterSuccess" : MessageLookupByLibrary.simpleMessage("Félicitation"),
    "pageRegisterSuccessAltImg" : MessageLookupByLibrary.simpleMessage("Votre compte a été créé avec succés"),
    "pageRegisterSuccessSub" : MessageLookupByLibrary.simpleMessage("Votre compte a été créé avec succés"),
    "pageRegisterTitle" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "pageSortCardTimer" : MessageLookupByLibrary.simpleMessage("Timer"),
    "pageSortCardValidate" : MessageLookupByLibrary.simpleMessage("Valider")
  };
}
