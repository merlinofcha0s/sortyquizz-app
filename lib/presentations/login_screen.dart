import 'package:SortyQuizz/presentations/quizz_screen.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Welcome to sorty quizz',
                style: Theme.of(context).textTheme.headline4,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, QuizzRoutes.quizz);
                },
                child: const Text('Start', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        )
    );
  }
}
