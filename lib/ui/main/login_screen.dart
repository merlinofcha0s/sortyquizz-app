import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).pageLoginBar),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                S.of(context).pageLoginTitle,
                style: Theme.of(context).textTheme.headline,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, QuizzRoutes.quizz);
                },
                child: const Text('Start', style: TextStyle(fontSize: 20)),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, QuizzRoutes.register);
                },
                child: Text(S.of(context).pageLoginRegisterButton, style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        )
    );
  }
}
