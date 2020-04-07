import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/ui/account/register/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/register_bloc.dart';
import 'generated/l10n.dart';
import 'ui/main/login_screen.dart';
import 'ui/quizz/quizz_screen.dart';


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
        QuizzRoutes.home: (context) {
          return LoginPage();
        },
        QuizzRoutes.quizz: (context) {
          return QuizzScreen();
        },
        QuizzRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
              bloc: RegisterBloc(), child: RegisterScreen());
        }
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
