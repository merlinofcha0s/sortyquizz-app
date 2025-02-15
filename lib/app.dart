import 'package:SortyQuizz/main/finishstep1/finish_step1_bloc.dart';
import 'package:SortyQuizz/main/finishstep1/finish_step1_screen.dart';
import 'package:SortyQuizz/main/finishstep2/finish_step2_bloc.dart';
import 'package:SortyQuizz/main/finishstep2/finish_step2_screen.dart';
import 'package:SortyQuizz/main/main_bloc.dart';
import 'package:SortyQuizz/main/main_screen.dart';
import 'package:SortyQuizz/main/openpack/open_pack_bloc.dart';
import 'package:SortyQuizz/main/quizz/quizz_bloc.dart';
import 'package:SortyQuizz/main/quizz/quizz_screen.dart';
import 'package:SortyQuizz/main/sortcard/sort_card_bloc.dart';
import 'package:SortyQuizz/main/sortcard/sort_card_screen.dart';
import 'package:SortyQuizz/quizz/quizz_screen.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'account/login/login_bloc.dart';
import 'account/login/login_screen.dart';
import 'account/register/register_bloc.dart';
import 'account/register/register_screen.dart';
import 'generated/l10n.dart';
import 'main/openpack/open_pack_screen.dart';


class SortyQuizzApp extends StatelessWidget {
  const SortyQuizzApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorty Quizz',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        QuizzRoutes.login: (context) {
          return BlocProvider<LoginBloc>(bloc: LoginBloc(), child: LoginScreen());
        },
        QuizzRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
              bloc: RegisterBloc(), child: RegisterScreen());
        },
        QuizzRoutes.main: (context) {
          return BlocProvider<MainBloc>(
              bloc: MainBloc(), child: MainScreen());
        },
        QuizzRoutes.openPack: (context) {
          return BlocProvider<OpenPackBloc>(
              bloc: OpenPackBloc(), child: OpenPackScreen());
        },
        QuizzRoutes.quizz: (context) {
          return BlocProvider<QuizzBloc>(
              bloc: QuizzBloc(), child: QuizzScreen());
        },
        QuizzRoutes.finishStep1: (context) {
          return BlocProvider<FinishStep1Bloc>(
              bloc: FinishStep1Bloc(), child: FinishStep1Screen());
        },
        QuizzRoutes.sortCard: (context) {
          return BlocProvider<SortCardBloc>(
              bloc: SortCardBloc(), child: SortCardScreen());
        },
        QuizzRoutes.finishStep2: (context) {
          return BlocProvider<FinishStep2Bloc>(
              bloc: FinishStep2Bloc(), child: FinishStep2Screen());
        },
        QuizzRoutes.quizz2: (context) {
          return QuizzScreen2();
        },
      },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales
    );
  }
}
