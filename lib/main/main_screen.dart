import 'package:SortyQuizz/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: QuizzKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Center(
            child: Text('Welcome Home, you are connected !!!',
                style: TextStyle(fontSize: 30)),
          )
        ]));
  }
}
