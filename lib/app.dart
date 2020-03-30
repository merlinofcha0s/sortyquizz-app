import 'dart:developer';
import 'dart:io';

import 'package:SortyQuizz/environement.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/main/login_screen.dart';
import 'ui/quizz/quizz_screen.dart';


class SortyQuizzApp extends StatelessWidget {
  const SortyQuizzApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorty quizz',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        QuizzRoutes.home: (context) {
          return LoginPage(title: 'Sorty quizz - Login');
        },
        QuizzRoutes.quizz: (context) {
          return QuizzScreen();
        },
      },
    );
  }
}
