import 'package:SortyQuizz/main/main_bloc.dart';
import 'package:SortyQuizz/main/main_screen.dart';
import 'package:SortyQuizz/openpack/open_pack_bloc.dart';
import 'package:SortyQuizz/openpack/open_pack_screen.dart';
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
          return QuizzScreen();
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
