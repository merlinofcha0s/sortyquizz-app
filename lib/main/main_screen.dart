import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/main/main_bloc.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: QuizzKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProvider.of<MainBloc>(context);
    mainBloc.getCountOpenPack();
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                btnMenu(context, S.of(context).pageMainProfileButton, () => Navigator.pushNamed(context, QuizzRoutes.register)),
                btnMenu(context, S.of(context).pageMainEventButton, () => Navigator.pushNamed(context, QuizzRoutes.register)),
                RaisedButton(
                  color: Colors.white,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Row(
                        children: <Widget>[
                          numberOfPack(mainBloc),
                          btnTitleOpenPack(context)
                        ],
                      )),
                  onPressed: () =>
                      Navigator.pushNamed(context, QuizzRoutes.openPack),
                ),
                btnMenu(context, S.of(context).pageMainMarketButton, () => Navigator.pushNamed(context, QuizzRoutes.register))
              ]),
        ));
  }

  Widget btnMenu(BuildContext context, String textButton, Function onPressedFunction) {
    return RaisedButton(
      color: Colors.white,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(fontSize: 17),
            ),
          )),
      onPressed: onPressedFunction,
    );
  }

  Widget btnTitleOpenPack(BuildContext context){
    return Expanded(
      child: Center(
        child: Text(
          S.of(context).pageMainOpenPackButton,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget numberOfPack(MainBloc mainBloc) {
    return StreamBuilder<int>(
        stream: mainBloc.numberOpenPackStream,
        builder: (context, snapshot) {
          return Container(
            height: 70,
            width: 70,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  snapshot.hasData ? snapshot.data.toString() : 0.toString(),
                  style: TextStyle(fontSize: 28),
                ),
                Text(S.of(context).pageMainNumberPackOpen),
              ],
            ),
          );
        });
  }
}
