import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/main/finishstep1/finish_step1_arguments.dart';
import 'package:SortyQuizz/main/finishstep1/finish_step1_bloc.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';

import '../../keys.dart';

class FinishStep1Screen extends StatelessWidget {
  FinishStep1Screen({Key key}) : super(key: QuizzKeys.finishStep1Screen);

  @override
  Widget build(BuildContext context) {
    final FinishStep1Argument args = ModalRoute.of(context).settings.arguments;
    final finishStep1Bloc = BlocProvider.of<FinishStep1Bloc>(context);
    finishStep1Bloc.recordScore(args);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: title(args, context)),
      backgroundColor: Colors.white70,
      body: body(context, args),
    );
  }

  Widget title(FinishStep1Argument args, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(args.pack.name),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(args.pack.themeName),
            Text(' - '),
            Text(S.of(context).pageQuizzStep1Lvl + ' ' + args.pack.level.toString()),
          ],
        ),
      ],
    );
  }

  body(BuildContext context, FinishStep1Argument args) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(S.of(context).pageFinishStep1Title, style: TextStyle(fontSize: 30),),
          Padding(padding: const EdgeInsets.all(15.0),),
          Text(S.of(context).pageFinishStep1SubTitle(args.wonCards), style: TextStyle(fontSize: 20),),
          Padding(padding: const EdgeInsets.all(15.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              card(context, args, S.of(context).pageFinishStep1UsedQuestion, args.usedQuestions.toString() + ' / ' + args.pack.rule.nbMaxQuestions.toString()),
              card(context, args, S.of(context).pageFinishStep1UsedTime, args.passedTime.toString() + 's')
            ],
          ),
          Padding(padding: const EdgeInsets.all(15.0),),
          RaisedButton(
            color: Colors.white,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Center(
                    child: Text(S.of(context).pageFinishStep1StartStep2,
                      style: TextStyle(fontSize: 17),))),
            onPressed: () => Navigator.pushNamed(context, QuizzRoutes.login),
          )
        ],
      ),
    );
  }

  Widget card(BuildContext context, FinishStep1Argument args, String line1, String line2) {
    return Container(
      width: 100,
      height: 120,
      child: Card(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(line1, textAlign: TextAlign.center,),
                Text(line2),
              ],),
          )
      ),
    );
  }
}
