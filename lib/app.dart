import 'package:SortyQuizz/presentations/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortyQuizzApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorty quizz',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(title: 'Sorty quizz - Login'),
    );
  }
}
