import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: QuizzKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Center(
                        child: Text(
                          S.of(context).pageMainProfileButton,
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                  onPressed: () =>
                      Navigator.pushNamed(context, QuizzRoutes.register),
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Center(
                        child: Text(
                          S.of(context).pageMainEventButton,
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                  onPressed: () =>
                      Navigator.pushNamed(context, QuizzRoutes.register),
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Center(
                        child: Text(
                          S.of(context).pageMainOpenPackButton,
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                  onPressed: () =>
                      Navigator.pushNamed(context, QuizzRoutes.register),
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Center(
                        child: Text(
                          S.of(context).pageMainMarketButton,
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                  onPressed: () =>
                      Navigator.pushNamed(context, QuizzRoutes.register),
                )
              ]),
        ));
  }
}
