import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizzPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quizz"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Le quizz va demarrer',
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        )
    );
  }

}
